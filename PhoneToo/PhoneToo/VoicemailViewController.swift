//
//  VoicemailViewController.swift
//  PhoneToo
//
//  Created by TJ Usiyan on 2017/01/17.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import UIKit

class VoicemailViewController: UIViewController {

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        sharedInitWork()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInitWork()
    }

    func sharedInitWork() {
        title = "Voicemail"
        tabBarItem.image = UIImage(named: "VoicemailTabIcon")
    }


    func update() {
        OperationQueue.main.addOperation {
            print("fasdfas")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
