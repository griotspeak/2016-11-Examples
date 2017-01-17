//
//  GroupViewController.swift
//  Contact
//
//  Created by TJ Usiyan on 2017/01/17.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import UIKit

class GroupViewController: UIViewController {

    var dataSource: GroupDataSource!

    var tableView: UITableView {
        return view as! UITableView
    }

    override func loadView() {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = dataSource
        view = tableView
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        title = dataSource.teamName
    }
}

extension GroupViewController : UITableViewDelegate {
}

final class GroupDataSource: NSObject, UITableViewDataSource {
    var group: Team
    var teamName: String
    init(teamName: String, group: Team) {
        self.teamName = teamName
        self.group = group.sorted(by: { (lhs, rhs) -> Bool in
            let aliasKey = "alias"
            return lhs[aliasKey]! < rhs[aliasKey]!
        })
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return group.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = group[indexPath.row]["alias"]
        return cell
    }
}
