//
//  LoginViewController.swift
//  Tim-Messenger
//
//  Created by Tim Cho on 12/8/2020.
//  Copyright © 2020 Tim Cho. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        return scrollView
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let emailField: UITextField = {
        let emailField = UITextField()
        emailField.autocapitalizationType = .none
        emailField.autocorrectionType = .no
        emailField.returnKeyType = .continue // when user presses enter goes to PW
        // modifying visual aspects of component
        emailField.layer.cornerRadius = 12
        emailField.layer.borderWidth = 1
        emailField.layer.borderColor = UIColor(red: 0.42, green: 0.46, blue: 0.49, alpha: 1.00).cgColor
        emailField.attributedPlaceholder = NSAttributedString(string: "email", attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 0.29, green: 0.31, blue: 0.34, alpha: 1.00)])
        emailField.textColor = UIColor(red: 0.68, green: 0.71, blue: 0.74, alpha: 1.00)
        // fixing left padding
        emailField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        emailField.leftViewMode = .always
        
        return emailField
    }()
    
    private let passwordField: UITextField = {
        let passwordField = UITextField()
        passwordField.autocapitalizationType = .none
        passwordField.autocorrectionType = .no
        passwordField.returnKeyType = .done // when user presses enter goes to PW
        passwordField.isSecureTextEntry = true
        // modifying visual aspects of component
        passwordField.layer.cornerRadius = 12
        passwordField.layer.borderWidth = 1
        passwordField.layer.borderColor = UIColor(red: 0.42, green: 0.46, blue: 0.49, alpha: 1.00).cgColor
        passwordField.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 0.29, green: 0.31, blue: 0.34, alpha: 1.00)])
        passwordField.textColor = UIColor(red: 0.68, green: 0.71, blue: 0.74, alpha: 1.00)
        // fixing left padding
        passwordField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        passwordField.leftViewMode = .always
        return passwordField
        
    }()
    
    private let loginButton : UIButton = {
        let loginButton = UIButton()
        loginButton.setImage(UIImage(named: "loginButton"), for: .normal)
//        loginButton.setImage(UIImage(named: "loginButtonPressed"), for: .highlighted)
        loginButton.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        return loginButton
    } ()
    
    private let registerButton : UIButton = {
        let registerButton = UIButton(type: .custom)
        registerButton.setImage(UIImage(named: "registerButton"), for: .normal)
//        registerButton.setImage(UIImage(named: "registerButtonPressed"), for: .highlighted)
        registerButton.addTarget(self, action: #selector(didTapRegister), for: .touchUpInside)
        return registerButton
    } ()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.14, green: 0.14, blue: 0.19, alpha: 1.00)

        emailField.delegate = self
        passwordField.delegate = self
        
        // adding subviews
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(emailField)
        scrollView.addSubview(passwordField)
        scrollView.addSubview(loginButton)
        scrollView.addSubview(registerButton)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.frame = view.bounds
        
        // adjusting image position
        let image_width = scrollView.width / 2
        let image_height = scrollView.width / 2
        let image_x = (scrollView.width - image_width) / 2 // centers the image
        let registerButton_width: CGFloat = 115
        imageView.frame = CGRect(x: image_x,
                                 y: scrollView.top + (scrollView.height / 8) ,
                                 width: image_width,
                                 height: image_height)
        
        // adjusting email input position
        emailField.frame = CGRect(x: scrollView.left + scrollView.width * 0.1,
                                  y: imageView.bottom,
                                  width: scrollView.width * 0.8 ,
                                  height: 52) // height of typical input for iphone is 52
        
        // adjusting password input position
        passwordField.frame = CGRect(x: scrollView.left + scrollView.width * 0.1,
                                  y: emailField.bottom + 15,
                                  width: scrollView.width * 0.8,
                                  height: 52) // height of typical input for iphone is 52
        
        // adjusting login button position
        loginButton.frame = CGRect(x: scrollView.left + scrollView.width * 0.6,
                                   y: passwordField.bottom + 15,
                                   width: 115,
                                   height: 50)
        
        // adjusting register button position
        registerButton.frame = CGRect(x: (scrollView.width - registerButton_width) / 2,
                                      y: scrollView.bottom - scrollView.height * 0.2,
                                      width: registerButton_width,
                                      height: 50)
    }
    
    @objc private func didTapLogin() {
        
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        
        guard let email = emailField.text, let password = passwordField.text,
            !email.isEmpty, !password.isEmpty else {
                alertUserLoginError()
                return
        }
        // firebase login
        
    }
    
    func alertUserLoginError() {
        let alert = UIAlertController(title: "Error Logging in",
                                      message: "Please ensure credentials are correct",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss",
                                      style: .cancel,
                                      handler: nil))
        present(alert, animated: true)
    }
    
    @objc private func didTapRegister() {
        let vc = RegisterViewController()
        vc.title = "CreateAccount"
        navigationController?.pushViewController(vc, animated: false)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailField {
            passwordField.becomeFirstResponder()
        } else if (textField == passwordField) {
            didTapLogin()
        }
        return true
    }
}
