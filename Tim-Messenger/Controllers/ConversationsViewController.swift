//
//  ViewController.swift
//  Tim-Messenger
//
//  Created by Tim Cho on 12/8/2020.
//  Copyright © 2020 Tim Cho. All rights reserved.
//

import UIKit
import FirebaseAuth
class ConversationsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        // Do any additional setup after loading the view.
        DatabaseManager.shared.testDB()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        validateAuth()
    }
    
    private func validateAuth() {
//        print(FirebaseAuth.Auth.auth().currentUser?.email ?? "")
        if FirebaseAuth.Auth.auth().currentUser == nil {
            let vc = LoginViewController()
            let nav = UINavigationController(rootViewController: vc)
            nav.setNavigationBarHidden(true, animated: false)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: false)
        }
    }
    

}

