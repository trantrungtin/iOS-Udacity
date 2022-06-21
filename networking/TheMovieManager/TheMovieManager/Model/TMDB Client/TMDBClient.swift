//
//  TMDBClient.swift
//  TheMovieManager
//
//  Created by Tin Tran on 21/06/2022.
//

import Foundation

class TMDBClient {
    static let apiKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String ?? ""
    
    struct Auth {
        static var requestToken = ""
    }
    
    enum Endpoints {
        static let base = "https://api.themoviedb.org/3"
        static let apiKeyParam = "?api_key=\(TMDBClient.apiKey)"
        
        case getRequestToken
        
        var stringValue: String {
            var urlString: String = ""
            switch self {
            case .getRequestToken:
                urlString = "/authentication/token/new"
            }
            
            return Endpoints.base + urlString + Endpoints.apiKeyParam
        }
        
        var url: URL {
            return URL(string: stringValue)!
        }
    }
    
    class func doGetRequest<ResponseType: Decodable>(url: URL, responseType: ResponseType.Type, completion: @escaping (ResponseType?, Error?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                completion(nil, error)
                return
            }
            let decoder = JSONDecoder()
            do {
                let responseObject = try decoder.decode(responseType, from: data)
                completion(responseObject, nil)
            } catch {
                do {
                    let errorResponse = try decoder.decode(TMDBResponse.self, from: data) as! Error
                    completion(nil, errorResponse)
                } catch {
                    completion(nil, error)
                }
            }
        }
        task.resume()
    }
    
    class func getRequesToken(completion: @escaping (Bool, Error?) -> Void) {
        doGetRequest(url: Endpoints.getRequestToken.url, responseType: RequestTokenResponse.self) { response, error in
            if let response = response {
                Auth.requestToken = response.requestToken
                completion(true, nil)
            } else {
                completion(false, error)
            }
        }
    }
}
