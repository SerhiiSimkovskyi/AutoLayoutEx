//
//  LayoutAnchorsVC.swift
//  AutoLayoutEx
//
//  Created by Serhii Simkovskyi on Feb/21/18.
//  Copyright © 2018 Serhii Simkovskyi. All rights reserved.
//

import UIKit

class LayoutAnchorsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let margins = view.layoutMarginsGuide  // Safe area

        let redView : UIView = UIView()
        redView.translatesAutoresizingMaskIntoConstraints = false
        redView.backgroundColor = UIColor.red
        view.addSubview(redView)

        let blueView : UIView = UIView()
        blueView.translatesAutoresizingMaskIntoConstraints = false
        blueView.backgroundColor = UIColor.blue
        view.addSubview(blueView)

        // horizontal constrains
        redView.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        redView.trailingAnchor.constraint(equalTo: blueView.leadingAnchor, constant: -10.0).isActive = true
        blueView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        redView.widthAnchor.constraint(equalTo: blueView.widthAnchor).isActive = true

        // vertical constraints
        redView.centerYAnchor.constraint(equalTo: margins.centerYAnchor).isActive = true
        blueView.centerYAnchor.constraint(equalTo: margins.centerYAnchor).isActive = true
        redView.heightAnchor.constraint(equalTo: blueView.heightAnchor).isActive = true
        redView.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 0.5).isActive = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
