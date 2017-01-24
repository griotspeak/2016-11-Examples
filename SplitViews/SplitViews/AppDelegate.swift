//
//  AppDelegate.swift
//  SplitViews
//
//  Created by TJ Usiyan on 2017/01/24.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {


        let splitVC = window?.rootViewController as! ContainerViewController

        let mainStoryboard = UIStoryboard(name: "Main", bundle: .main)
        let listStoryboard = UIStoryboard(name: "ContactListFlow", bundle: .main)

        let contactListVC = listStoryboard.instantiateInitialViewController() as! ContactListViewController
        let contactVC = mainStoryboard.instantiateViewController(withIdentifier: "ContactDetails") as! ContactViewController


        contactListVC.selectionClosure = { contact in
            contactVC.contact = contact
            splitVC.showDetailViewController(contactVC, sender: nil)
        }

        let masterNav = UINavigationController(rootViewController: contactListVC)
        let detailNav = UINavigationController(rootViewController: contactVC)
        splitVC.viewControllers = [masterNav, detailNav]

        return true
    }

}

