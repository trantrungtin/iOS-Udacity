//
//  RequestTokenResponse.swift
//  TheMovieManager
//
//  Created by Tin Tran on 21/06/2022.
//

import Foundation

struct RequestTokenResponse: Codable {
    let success: Bool
    let expiresAt, requestToken: String

    enum CodingKeys: String, CodingKey {
        case success
        case expiresAt = "expires_at"
        case requestToken = "request_token"
    }
}
