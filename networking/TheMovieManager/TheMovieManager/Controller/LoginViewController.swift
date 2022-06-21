//
//  ViewController.swift
//  TheMovieManager
//
//  Created by Tin Tran on 21/06/2022.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var emailTextField: LoginTextField!
    @IBOutlet weak var passwordTextField: LoginTextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var loginButton: LoginButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        emailTextField.text = ""
        passwordTextField.text = ""
        emailTextField.delegate = self
        passwordTextField.delegate = self
//        loginButton.isUserInteractionEnabled = false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let _ = emailTextField.text, let _ = passwordTextField.text else {
            loginButton.isUserInteractionEnabled = false
            return
        }
        loginButton.isUserInteractionEnabled = true
    }

    @IBAction func loginTapped(_ sender: Any) {
        setLoggingIn(true)
        TMDBClient.getRequesToken(completion: handleRequestTokenResponse(success:error:))
    }
    
    @IBAction func loginViaWebsiteTapped(_ sender: Any) {
        
    }
    
    func handleRequestTokenResponse(success: Bool, error: Error?) {
        print("handleRequestTokenResponse :\(success), \(error)")
    }
    
    func setLoggingIn(_ loggingIn: Bool) {
        if loggingIn {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }
}

