//
//  AddProfilePicViewController.swift
//  Tim-Messenger
//
//  Created by Tim Cho on 16/8/2020.
//  Copyright © 2020 Tim Cho. All rights reserved.
//

import UIKit

class AddProfilePicViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        return scrollView
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"profilePicLogo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let addProfilePicButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "addProfilePic"), for: .normal)
        button.addTarget(self, action: #selector(didTapAddProfilePic), for: .touchUpInside)
        return button
    }()
    
    private let continueButton : UIButton = {
        let continueButton = UIButton()
        continueButton.setImage(UIImage(named: "loginButton"), for: .normal)
        continueButton.addTarget(self, action: #selector(didTapContinue), for: .touchUpInside)
        return continueButton
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("loaded Add profile pic view")
        view.backgroundColor = UIColor(red: 0.14, green: 0.14, blue: 0.19, alpha: 1.00)
        
        // adding subviews
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(addProfilePicButton)
        scrollView.addSubview(continueButton)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
        let image_width = scrollView.width / 2
        let image_height = scrollView.width / 2
        let image_x = (scrollView.width - image_width) / 2 // centers the image
        let add_profile_pic_width = scrollView.width * 0.6
        let add_profile_pic_height = scrollView.width * 0.6
        let add_profile_pic_x = (scrollView.width - add_profile_pic_width) / 2 // centers the image
        imageView.frame = CGRect(x: image_x,
                                 y: scrollView.top + (scrollView.height / 15) ,
                                 width: image_width,
                                 height: image_height)
        addProfilePicButton.frame = CGRect(x: add_profile_pic_x,
                                           y: imageView.bottom,
                                           width: add_profile_pic_width,
                                           height: add_profile_pic_height)
        continueButton.frame = CGRect(x: scrollView.left + scrollView.width * 0.6,
                                      y: addProfilePicButton.bottom + 30,
                                      width: 115,
                                      height: 50)
    }
    
    @objc private func didTapAddProfilePic() {
        print("Tapped add profile pic")
        presentPhotoActionActionSheet()
    }
    
    @objc private func didTapContinue() {
        print("Did tap continue")
        let vc = ConversationsViewController()
        navigationController?.pushViewController(vc, animated: false)
    }

}

extension AddProfilePicViewController : UIImagePickerControllerDelegate {
    
    func presentPhotoActionActionSheet() {
        let actionSheet = UIAlertController(title: "Profile Picture",
                                            message: "Please choose one of the options below to set a picture",
                                            preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Take Photo",
                                            style: .default,
                                            handler: { [weak self]_ in
                                                self?.presentCamera()
        }))
        actionSheet.addAction(UIAlertAction(title: "Choose Photo",
                                            style: .default,
                                            handler: { [weak self]_ in
                                                self?.presentImageLibrary()
        }))
        present(actionSheet, animated:true)
    }
    
    func presentCamera () {
        print("presenting camera")
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        
    }
    
    func presentImageLibrary () {
        print("presenting image library")
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // do something
        print("hello")
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // do something
    }
}
