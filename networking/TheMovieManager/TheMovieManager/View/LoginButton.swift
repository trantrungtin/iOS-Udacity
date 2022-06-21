//
//  LoginButton.swift
//  TheMovieManager
//
//  Created by Tin Tran on 21/06/2022.
//

import Foundation
import UIKit

class LoginButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 5
        tintColor = .white
        backgroundColor = .primaryDark
    }
}
