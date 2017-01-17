//
//  GroupsViewController.swift
//  Contact
//
//  Created by TJ Usiyan on 2017/01/17.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import UIKit

class GroupsViewController: UIViewController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        sharedInitWork()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInitWork()
    }

    func sharedInitWork() {
        navigationItem.title = "Teams"
    }

    var dataSource: GroupsDataSource!

    var tableView: UITableView {
        return view as! UITableView
    }

    override func loadView() {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = dataSource
        view = tableView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension GroupsViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let (teamName, members) = dataSource.team(indexPath.row)
        let teamVC = GroupViewController()
        teamVC.dataSource = GroupDataSource(teamName: teamName, group: members)
        show(teamVC, sender: self)
    }
}

final class GroupsDataSource: NSObject, UITableViewDataSource {
    var book: [String : Team]
    init(book: [String : Team]) {
        self.book = book
    }

    var sortedKeys: [String] {
        return book.keys.sorted()
    }

    func team(_ index: Int) -> (name: String, members: [[String:String]]) {
        let teamKey = sortedKeys[index]
        let team = book[teamKey]!
        return (teamKey, team)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return book.keys.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = sortedKeys[indexPath.row]
        return cell
    }
}

