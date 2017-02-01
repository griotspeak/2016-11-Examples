//
//  PostCell.swift
//  AppNetApp
//
//  Created by TJ Usiyan on 2017/02/01.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var contentTextLabel: UILabel!
    @IBOutlet var avatarView: UIImageView!
    @IBOutlet var spinner: UIActivityIndicatorView!
    @IBOutlet var dateLabel: UILabel!
    var postID: String?
    

    override func awakeFromNib() {
        super.awakeFromNib()

        updateWithImage(nil)
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        updateWithImage(nil)
    }

    func updateWithImage(_ image: UIImage?) {
        if let imageToDisplay = image {
            spinner.stopAnimating()
            avatarView.image = imageToDisplay
        }
        else {
            spinner.startAnimating()
            avatarView.image = nil
        }
    }

    func update(_ imageResult: ImageResult) {
        switch imageResult {
        case .systemFailure(let error):
            print("failed to fetch image: \(error)")
        case .httpFailure(let response):
            print("failed to fetch image: \(response)")
        case .success(let image):
            updateWithImage(image)
        }
    }
}
