//
//  BreedsListResponse.swift
//  Randog
//
//  Created by Tin Tran on 21/06/2022.
//

import Foundation
struct BreedsListResponse: Codable {
    let message: [String: [String]]
    let status: String
}
