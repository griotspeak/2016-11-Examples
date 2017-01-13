//
//  AvatarListViewController.swift
//  CharacterCreatorToo
//
//  Created by TJ Usiyan on 2017/01/13.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import UIKit

class AvatarListViewController: UIViewController {
    let dataSource = CharacterListDataSource()

    var tableView: UITableView {
        return view as! UITableView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = dataSource
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension AvatarListViewController : UITableViewDelegate {
}

class CharacterListDataSource: NSObject, UITableViewDataSource {
    var characters: [Avatar] = [
        Avatar(name: "Peter"),
        Avatar(name: "Paul"),
        Avatar(name: "Mary"),
    ]

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AvatarCell") as! AvatarCell
        let avatar = characters[indexPath.row]

        cell.nameLabel.text = avatar.name

        return cell
    }

}

