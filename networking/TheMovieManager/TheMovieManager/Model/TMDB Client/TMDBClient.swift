//
//  TMDBClient.swift
//  TheMovieManager
//
//  Created by Tin Tran on 21/06/2022.
//

import Foundation

class TMDBClient {
    static let apiKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String
}
