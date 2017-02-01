//
//  ViewController.swift
//  AppNetApp
//
//  Created by TJ Usiyan on 2017/02/01.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    let store = PostStore()
    lazy var dataSource = PostDataSource()

    fileprivate func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = dataSource
        tableView.allowsSelection = false

        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 120

        refreshControl = UIRefreshControl()
        refreshControl?.backgroundColor = UIColor.white
        refreshControl?.tintColor = UIColor.black
        refreshControl?.addTarget(self, action: #selector(ViewController.refreshTableView), for: .valueChanged)
    }

    @objc func refreshTableView() {
        store.fetchGlobalStreamPosts {
            (postsResult) -> Void in

            OperationQueue.main.addOperation() {
                switch postsResult {
                case let .success(photos):
                    print("Found \(photos.count) global posts.")
                    self.dataSource.posts = photos
                case let .failure(error):
                    self.dataSource.posts.removeAll()
                    print("Error fetching global posts: \(error)")
                }
                self.tableView.reloadSections(IndexSet(integer: 0), with: .automatic)
                self.refreshControl?.endRefreshing()
            }

        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        refreshTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }


    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let post = dataSource.posts[indexPath.row]
        let postCell = cell as! PostCell

        if let user = post.user {
            postCell.postID = post.postID
            store.fetchImage(user) { (result) -> Void in
                OperationQueue.main.addOperation() {
                    // When the request finishes, only update the cell if it's associated with this post
                    if postCell.postID! == post.postID {
                        postCell.update(result)
                    }
                }
            }
        }
    }

}

