//
//  LoginTextField.swift
//  TheMovieManager
//
//  Created by Tin Tran on 21/06/2022.
//

import UIKit

class LoginTextField: UITextField {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 5
        tintColor = .white
        backgroundColor = .primaryLight
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let insetBounds = CGRect(x: bounds.origin.x + 8, y: bounds.origin.y, width: bounds.size.width - 16, height: bounds.size.height)
        return insetBounds
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let insetBounds = CGRect(x: bounds.origin.x + 8, y: bounds.origin.y, width: bounds.size.width - 16, height: bounds.size.height)
        return insetBounds
    }
}
