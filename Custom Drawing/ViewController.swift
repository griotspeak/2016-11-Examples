//
//  ViewController.swift
//  Mastermind
//
//  Created by TJ Usiyan on 2017/01/20.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func loadView() {
        let codeView = CodeView()
        self.view = codeView
    }

    var codeView: CodeView {
        return view as! CodeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let tapRecognizer = UITapGestureRecognizer()
        tapRecognizer.numberOfTapsRequired = 1
        tapRecognizer.numberOfTouchesRequired = 1
        tapRecognizer.addTarget(self, action: #selector(ViewController.createRandomCode(sender:)))
        view.addGestureRecognizer(tapRecognizer)
    }

    @objc func createRandomCode(sender: UITapGestureRecognizer) {
        var options = Array(ColorSet.standard.colors)
        var codeValue: [Color] = []
        for _ in 0..<4 {
            let index = Int(arc4random_uniform(UInt32(options.count)))
            codeValue.append(options[index])
            options.remove(at: index)
        }
        codeView.code = Code(codeValue)
        print("It's happening!")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

