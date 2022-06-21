//
//  DogAPI.swift
//  Randog
//
//  Created by Tin Tran on 21/06/2022.
//

import Foundation

class DogAPI {
    enum Enpoint: String {
        case randomImageFromAllDogsCollection = "https://dog.ceo/api/breeds/image/random"
        
        var url: URL {
            return URL(string: self.rawValue)!
        }
    }
}
