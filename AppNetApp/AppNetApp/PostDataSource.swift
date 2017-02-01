//
//  PostDataSource.swift
//  AppNetApp
//
//  Created by TJ Usiyan on 2017/02/01.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import UIKit

final class PostDataSource: NSObject, UITableViewDataSource {
    var posts: [Post] = []

    fileprivate static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-DD'T'HH:mm:ssZ"
        formatter.timeZone = TimeZone.autoupdatingCurrent
        return formatter
    }()

    internal static let standardCellIdentifier = "PostCell"

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = PostDataSource.standardCellIdentifier
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! PostCell

        let post = posts[indexPath.row]

        guard let user = post.user else { fatalError("no user associated with post") }

        guard let contentTextLabel = cell.contentTextLabel,
            let userNameLabel = cell.userNameLabel,
            let dateLabel = cell.dateLabel else {
                fatalError("improper cell label setup")
        }

        guard let displayName = user.displayName,
            let userName = user.name else {
                fatalError("user name field(s) unexpectedly nil")
        }

        contentTextLabel.text = post.text
        contentTextLabel.numberOfLines = 0
        userNameLabel.numberOfLines = 0
        userNameLabel.text = "\(displayName)\n(\(userName))"
        dateLabel.text = PostDataSource.dateFormatter.string(from: post.createdAt as Date)
        
        return cell
    }
}
