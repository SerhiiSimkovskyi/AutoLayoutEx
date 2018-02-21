//
//  LayoutConstraintVC.swift
//  AutoLayoutEx
//
//  Created by Serhii Simkovskyi on Feb/21/18.
//  Copyright © 2018 Serhii Simkovskyi. All rights reserved.
//

import UIKit

class LayoutConstraintVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let margins = view.layoutMarginsGuide  // Safe area

        let redView : UIView = UIView()
        redView.translatesAutoresizingMaskIntoConstraints = false
        redView.backgroundColor = UIColor.red
        view.addSubview(redView)
        
        let blueView : UIView = UIView()
        blueView.translatesAutoresizingMaskIntoConstraints = false
        blueView.backgroundColor = UIColor.blue
        view.addSubview(blueView)
        
        // horizontal constrains
        NSLayoutConstraint(item: redView, attribute: .leading, relatedBy: .equal,
                           toItem: view, attribute: .leadingMargin,
                           multiplier: 1.0, constant: 0.0).isActive = true

        NSLayoutConstraint(item: redView, attribute: .trailing, relatedBy: .equal,
                           toItem: blueView, attribute: .leading,
                           multiplier: 1.0, constant: -10.0).isActive = true

        NSLayoutConstraint(item: blueView, attribute: .trailing, relatedBy: .equal,
                           toItem: view, attribute: .trailingMargin,
                           multiplier: 1.0, constant: 0.0).isActive = true

        NSLayoutConstraint(item: redView, attribute: .width, relatedBy: .equal,
                           toItem: blueView, attribute: .width,
                           multiplier: 1.0, constant: 0.0).isActive = true

//        redView.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
//        redView.trailingAnchor.constraint(equalTo: blueView.leadingAnchor, constant: -10.0).isActive = true
//        blueView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
//        redView.widthAnchor.constraint(equalTo: blueView.widthAnchor).isActive = true
        
        // vertical constraints
        NSLayoutConstraint(item: redView, attribute: .centerY, relatedBy: .equal,
                           toItem: view, attribute: .centerY,
                           multiplier: 1.0, constant: 0.0).isActive = true

        NSLayoutConstraint(item: blueView, attribute: .centerY, relatedBy: .equal,
                           toItem: view, attribute: .centerY,
                           multiplier: 1.0, constant: 0.0).isActive = true

        NSLayoutConstraint(item: redView, attribute: .height, relatedBy: .equal,
                           toItem: blueView, attribute: .height,
                           multiplier: 1.0, constant: 0.0).isActive = true

        NSLayoutConstraint(item: redView, attribute: .height, relatedBy: .equal,
                           toItem: view, attribute: .height,
                           multiplier: 0.5, constant: 0.0).isActive = true
        
//        redView.centerYAnchor.constraint(equalTo: margins.centerYAnchor).isActive = true
//        blueView.centerYAnchor.constraint(equalTo: margins.centerYAnchor).isActive = true
//        redView.heightAnchor.constraint(equalTo: blueView.heightAnchor).isActive = true
//        redView.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 0.5).isActive = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
