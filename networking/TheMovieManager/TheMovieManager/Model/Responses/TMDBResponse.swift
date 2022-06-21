//
//  TMDBResponse.swift
//  TheMovieManager
//
//  Created by Tin Tran on 21/06/2022.
//

import Foundation

struct TMDBResponse: Codable {
    let statusMessage: String
    let statusCode: Int

    enum CodingKeys: String, CodingKey {
        case statusMessage = "status_message"
        case statusCode = "status_code"
    }
}

