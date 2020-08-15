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
        emailField.layer.borderColor = UIColor.lightGray.cgColor
        emailField.placeholder = "email"
        
        return emailField
    }()
    
    private let passwordField: UITextField = {
        let passwordField = UITextField()
        return passwordField
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Log In"
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(title:"Register",
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(didTapRegister))
        // adding subviews
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(emailField)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let image_width = view.width / 3
        let image_height = view.width / 3
        let image_x = (view.width - image_width) / 2 // centers the image
        imageView.frame = CGRect(x: image_x, y: 20, width: image_width, height: image_height)
    }
    
    @objc private func didTapRegister() {
        let vc = RegisterViewController()
        vc.title = "CreateAccount"
        navigationController?.pushViewController(vc, animated: true)
    }
}
