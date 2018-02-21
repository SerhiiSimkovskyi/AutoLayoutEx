//
//  VisualFormatLanguageVC.swift
//  AutoLayoutEx
//
//  Created by Serhii Simkovskyi on Feb/21/18.
//  Copyright © 2018 Serhii Simkovskyi. All rights reserved.
//

import UIKit

class VisualFormatLanguageVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // create redView
        let redView : UIView = UIView()
        redView.translatesAutoresizingMaskIntoConstraints = false
        redView.backgroundColor = UIColor.red
        view.addSubview(redView)
        
        // create blueView
        let blueView : UIView = UIView()
        blueView.translatesAutoresizingMaskIntoConstraints = false
        blueView.backgroundColor = UIColor.blue
        view.addSubview(blueView)

        var allConstraints: [NSLayoutConstraint] = []
        let viewsDictionary = ["redView" : redView, "blueView" : blueView]
        
        let hStr1 = "H:|-[redView(==blueView@750,>=200)]-8-[blueView]-|" // maintains same width for blue and red, however red width should be at least 250 or more
        let vStr1 = "V:|-[redView(==blueView)]-|"
        
        allConstraints += NSLayoutConstraint.constraints(withVisualFormat: hStr1, options: .alignAllTop, metrics: nil, views: viewsDictionary)
        allConstraints += NSLayoutConstraint.constraints(withVisualFormat: vStr1, options: .alignAllTop, metrics: nil, views: viewsDictionary)

        NSLayoutConstraint.activate(allConstraints)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
