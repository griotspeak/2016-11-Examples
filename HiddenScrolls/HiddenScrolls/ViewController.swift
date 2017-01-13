//
//  ViewController.swift
//  HiddenScrolls
//
//  Created by TJ Usiyan on 2017/01/13.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var outerView: UIView!
    var scrollView: UIScrollView {
        return view as! UIScrollView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = outerView.bounds.size
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

