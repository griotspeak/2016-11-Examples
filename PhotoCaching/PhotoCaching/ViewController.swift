//
//  ViewController.swift
//  PhotoCaching
//
//  Created by TJ Usiyan on 2017/01/25.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let userStore = UserStore()
    var user: User? = nil

    @IBOutlet var usernameField: UITextField!
    @IBOutlet var displayNameField: UITextField!
    @IBOutlet var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refresh()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func takePicture(_ sender: Any) {
        if let username = usernameField.text,
            let displayName = displayNameField.text,
            username.isEmpty == false,
            displayName.isEmpty == false {

            user = User(username: username, displayName: displayName)

            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .photoLibrary
            imagePicker.delegate = self
            present(imagePicker, animated: true, completion: nil)
            refresh()
        } else {
            // present alert
        }
    }

    func refresh() {
        if let _user = user {
            usernameField.text = _user.username
            displayNameField.text = _user.displayName
            let image = userStore.avatarImage(user: _user)
            imageView.image = image
        }
    }
}


extension ViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let original = info[UIImagePickerControllerOriginalImage] as? UIImage {
            userStore.setAvatarImage(original, user: user!)
        }

        refresh()
        dismiss(animated: true, completion:nil)
    }
}
