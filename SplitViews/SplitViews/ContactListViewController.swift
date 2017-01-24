//
//  ContactListViewController.swift
//  SplitViews
//
//  Created by TJ Usiyan on 2017/01/24.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import UIKit

class ContactListViewController: UITableViewController {
    let dataSource = ContactListDataSource()
    var selectionClosure: (Contact) -> Void = { contact in
        print("Selected \(contact)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ContactCell")
        tableView.dataSource = dataSource
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contact = dataSource[indexPath.row]

        selectionClosure(contact)
    }
}

final class ContactListDataSource: NSObject, UITableViewDataSource {
    let list: [Contact] = [
        Contact(givenName: "Grace", familyName: "Hopper"),
        Contact(givenName: "Katherine", familyName: "Goble")
    ]

    subscript (_ index: Int) -> Contact {
        return list[index]
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return list.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell") else {
            fatalError("failed to dequeue cell with identifier ContactCell")
        }
        cell.textLabel?.text = list[indexPath.row].fullName
        return cell
    }
}
