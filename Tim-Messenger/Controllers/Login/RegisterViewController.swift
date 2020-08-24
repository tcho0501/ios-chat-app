//
//  RegisterViewController.swift
//  Tim-Messenger
//
//  Created by Tim Cho on 12/8/2020.
//  Copyright © 2020 Tim Cho. All rights reserved.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {

    private let scrollView: UIScrollView = {
            let scrollView = UIScrollView()
            scrollView.clipsToBounds = true
            return scrollView
        }()
        
        private let imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named:"signUpLogo")
            imageView.contentMode = .scaleAspectFit
            return imageView
        }()
        
        private let firstNameField: UITextField = {
           let field = UITextField()
           field.autocapitalizationType = .none
           field.autocorrectionType = .no
           field.returnKeyType = .done // when user presses enter goes to PW
//           field.isSecureTextEntry = true
           // modifying visual aspects of component
           field.layer.cornerRadius = 12
           field.layer.borderWidth = 1
           field.layer.borderColor = UIColor(red: 0.42, green: 0.46, blue: 0.49, alpha: 1.00).cgColor
           field.attributedPlaceholder = NSAttributedString(string: "first name", attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 0.29, green: 0.31, blue: 0.34, alpha: 1.00)])
           field.textColor = UIColor(red: 0.68, green: 0.71, blue: 0.74, alpha: 1.00)
           // fixing left padding
           field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
           field.leftViewMode = .always
           return field
        } ()
    
        private let lastNameField: UITextField = {
            let field = UITextField()
            field.autocapitalizationType = .none
            field.autocorrectionType = .no
            field.returnKeyType = .done // when user presses enter goes to PW
//            field.isSecureTextEntry = true
            // modifying visual aspects of component
            field.layer.cornerRadius = 12
            field.layer.borderWidth = 1
            field.layer.borderColor = UIColor(red: 0.42, green: 0.46, blue: 0.49, alpha: 1.00).cgColor
            field.attributedPlaceholder = NSAttributedString(string: "last name", attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 0.29, green: 0.31, blue: 0.34, alpha: 1.00)])
            field.textColor = UIColor(red: 0.68, green: 0.71, blue: 0.74, alpha: 1.00)
            // fixing left padding
            field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
            field.leftViewMode = .always
            return field
        } ()
        
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
    
        private let reTypePasswordField: UITextField = {
            let field = UITextField()
            field.autocapitalizationType = .none
            field.autocorrectionType = .no
            field.returnKeyType = .done // when user presses enter goes to PW
            field.isSecureTextEntry = true
            // modifying visual aspects of component
            field.layer.cornerRadius = 12
            field.layer.borderWidth = 1
            field.layer.borderColor = UIColor(red: 0.42, green: 0.46, blue: 0.49, alpha: 1.00).cgColor
            field.attributedPlaceholder = NSAttributedString(string: "re-type password", attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 0.29, green: 0.31, blue: 0.34, alpha: 1.00)])
            field.textColor = UIColor(red: 0.68, green: 0.71, blue: 0.74, alpha: 1.00)
            // fixing left padding
            field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
            field.leftViewMode = .always
            return field
        } ()
        
        private let loginButton : UIButton = {
            let loginButton = UIButton()
            loginButton.setImage(UIImage(named: "loginButton"), for: .normal)
//            loginButton.setImage(UIImage(named: "loginButtonPressed"), for: .highlighted)
            loginButton.addTarget(self, action: #selector(didTapSignUp), for: .touchUpInside)
            return loginButton
        } ()
        
        private let backToLoginButton : UIButton = {
            let backToLogin = UIButton(type: .custom)
            backToLogin.setImage(UIImage(named: "returnToLoginButton"), for: .normal)
//            backToLogin.setImage(UIImage(named: "returnToLoginButtonPressed"), for: .highlighted)
            backToLogin.addTarget(self,
                                  action: #selector(didTapBackToLogin),
                                  for: .touchUpInside)
            return backToLogin
        } ()

        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = UIColor(red: 0.14, green: 0.14, blue: 0.19, alpha: 1.00)

            firstNameField.delegate = self
            lastNameField.delegate = self
            emailField.delegate = self
            passwordField.delegate = self
            reTypePasswordField.delegate = self
            
            // adding subviews
            view.addSubview(scrollView)
            scrollView.addSubview(imageView)
            scrollView.addSubview(firstNameField)
            scrollView.addSubview(lastNameField)
            scrollView.addSubview(emailField)
            scrollView.addSubview(passwordField)
            scrollView.addSubview(reTypePasswordField)
            scrollView.addSubview(loginButton)
            scrollView.addSubview(backToLoginButton)
        }
        
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            
            scrollView.frame = view.bounds
            
            // adjusting image position
            let image_width = scrollView.width / 2
            let image_height = scrollView.width / 2
            let image_x = (scrollView.width - image_width) / 2 // centers the image
            let backToLoginButton_width: CGFloat = 250
            imageView.frame = CGRect(x: image_x,
                                     y: scrollView.top ,
                                     width: image_width,
                                     height: image_height)

            firstNameField.frame = CGRect(x: scrollView.left + scrollView.width * 0.1,
                                      y: imageView.bottom,
                                      width: scrollView.width * 0.8 ,
                                      height: 52) // height of typical input for iphone is 52
            
            lastNameField.frame = CGRect(x: scrollView.left + scrollView.width * 0.1,
                                      y: firstNameField.bottom + 15,
                                      width: scrollView.width * 0.8,
                                      height: 52) // height of typical input for iphone is 52
            
            emailField.frame = CGRect(x: scrollView.left + scrollView.width * 0.1,
                                        y: lastNameField.bottom + 15,
                                        width: scrollView.width * 0.8,
                                        height: 52) // height of typical input for iphone is 52
            
            passwordField.frame = CGRect(x: scrollView.left + scrollView.width * 0.1,
                                      y: emailField.bottom + 15,
                                      width: scrollView.width * 0.8,
                                      height: 52) // height of typical input for iphone is 52
            
            reTypePasswordField.frame = CGRect(x: scrollView.left + scrollView.width * 0.1,
                                         y: passwordField.bottom + 15,
                                         width: scrollView.width * 0.8,
                                         height: 52) // height of typical input for iphone is 52
            
            // adjusting login button position
            loginButton.frame = CGRect(x: scrollView.left + scrollView.width * 0.6,
                                       y: reTypePasswordField.bottom + 15,
                                       width: 115,
                                       height: 50)
            
            // adjusting register button position
            backToLoginButton.frame = CGRect(x: (scrollView.width - backToLoginButton_width) / 2,
                                             y: scrollView.bottom - scrollView.height * 0.2,
                                             width: backToLoginButton_width,
                                             height: 50)
        }
        
        @objc private func didTapSignUp() {
            guard
                let firstName = firstNameField.text,
                let lastName = lastNameField.text,
                let email = emailField.text,
                let password = passwordField.text,
                let reTypePassword = reTypePasswordField.text,
                !firstName.isEmpty,
                !lastName.isEmpty,
                !email.isEmpty,
                !password.isEmpty,
                !reTypePassword.isEmpty
                else {
                    alertUserRegisterErrorEmptyFields()
                    return
                }
            if (password != reTypePassword) {
                alertUserRegisterErrorPasswordsMismatch()
            }
            // Firebase register
            FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password, completion: { [weak self]authResult, error in
                guard let strongSelf = self else {
                    return
                }
                guard let result = authResult, error == nil else {
                    print("Error creating user")
                    print(error!.localizedDescription)
                    // alert user of error creating account here
                    strongSelf.alertUserRegisterFirebaseError(localizedDescription: error!.localizedDescription)
                    return
                }
                let user = result.user
                print("Created User: \(user)")
                print(user.email ?? "no email available")
                // valid account creation, push controller to add profile pic
                let vc = AddProfilePicViewController()
                strongSelf.navigationController?.pushViewController(vc, animated: true)
            })
        }
    func alertUserRegisterFirebaseError(localizedDescription : String) {
        let alert = UIAlertController(title: "Error Creating User",
                                      message: localizedDescription,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Got it",
                                      style: .cancel,
                                      handler: nil))
        self.present(alert, animated: true)
    }
        func alertUserRegisterErrorEmptyFields() {
            let alert = UIAlertController(title: "Error Signing Up",
                                          message: "Please make sure input fields are not empty",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Got it",
                                          style: .cancel,
                                          handler: nil))
            present(alert, animated: true)
        }
        
        func alertUserRegisterErrorPasswordsMismatch() {
            let alert = UIAlertController(title: "Error Signing Up",
                                          message: "Passwords mismatch",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Got it",
                                          style: .cancel,
                                          handler: nil))
            present(alert, animated: true)
        }
        
        @objc private func didTapBackToLogin() {
            let vc = LoginViewController()
//            vc.title = "CreateAccount"
            navigationController?.pushViewController(vc, animated: false)
        }
    }

    extension RegisterViewController: UITextFieldDelegate {
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            switch (textField) {
            case firstNameField:
                lastNameField.becomeFirstResponder()
                return true
            case lastNameField:
                emailField.becomeFirstResponder()
                return true
            case emailField:
                passwordField.becomeFirstResponder()
                return true
            case passwordField:
                reTypePasswordField.becomeFirstResponder()
                return true
            case reTypePasswordField:
                didTapSignUp()
                return true
            default:
                return false
            }
        }
    }
// future improvement to clean up code
//class LoginRegisterTextInputField: UITextField {
//    override init(frame: CGRect) {
//        super.init(frame:frame)
//    }
//}

