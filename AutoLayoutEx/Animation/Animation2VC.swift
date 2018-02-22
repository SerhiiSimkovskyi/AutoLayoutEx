//
//  Animation2VC.swift
//  AutoLayoutEx
//
//  Created by Serhii Simkovskyi on Feb/21/18.
//  Copyright © 2018 Serhii Simkovskyi. All rights reserved.
//

import UIKit

class Animation2VC: UIViewController {

    var state1Constraints: [NSLayoutConstraint] = []
    var state2Constraints: [NSLayoutConstraint] = []
    var state3Constraints: [NSLayoutConstraint] = []
    var state: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        state = 1
        
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
        
        let viewsDictionary = ["redView" : redView, "blueView" : blueView]
        
        var hStr1 = "H:|-[redView(==blueView)]-8-[blueView]-|"
        var vStr1 = "V:|-[redView(==blueView)]-|"
        state1Constraints += NSLayoutConstraint.constraints(withVisualFormat: hStr1, options: .alignAllTop, metrics: nil, views: viewsDictionary)
        state1Constraints += NSLayoutConstraint.constraints(withVisualFormat: vStr1, options: .alignAllTop, metrics: nil, views: viewsDictionary)

        hStr1 = "H:|-[blueView(==redView)]-8-[redView]-|"
        vStr1 = "V:|-[blueView(==redView)]-|"
        state2Constraints += NSLayoutConstraint.constraints(withVisualFormat: hStr1, options: .alignAllTop, metrics: nil, views: viewsDictionary)
        state2Constraints += NSLayoutConstraint.constraints(withVisualFormat: vStr1, options: .alignAllTop, metrics: nil, views: viewsDictionary)

        hStr1 = "V:|-[blueView(==redView)]-8-[redView]-|"
        vStr1 = "H:|-[blueView(==redView)]-|"
        state3Constraints += NSLayoutConstraint.constraints(withVisualFormat: hStr1, options: .alignAllLeft, metrics: nil, views: viewsDictionary)
        state3Constraints += NSLayoutConstraint.constraints(withVisualFormat: vStr1, options: .alignAllTop, metrics: nil, views: viewsDictionary)

        updateState()
    }
    
    func updateState() {
        switch state {
        case 1:
            NSLayoutConstraint.deactivate(state2Constraints)
            NSLayoutConstraint.deactivate(state3Constraints)
            NSLayoutConstraint.activate(state1Constraints)
        case 2:
            NSLayoutConstraint.deactivate(state1Constraints)
            NSLayoutConstraint.deactivate(state3Constraints)
            NSLayoutConstraint.activate(state2Constraints)
        case 3:
            NSLayoutConstraint.deactivate(state1Constraints)
            NSLayoutConstraint.deactivate(state2Constraints)
            NSLayoutConstraint.activate(state3Constraints)
        default: ()
        }
        
        // Optional code: let's animate autolayout changes slowly
        UIView.animate(withDuration: 0.5, animations: {
            self.view.layoutIfNeeded()
        });
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func actionPlay(_ sender: Any) {
        if (state == 1) {
            state = 2
        } else if (state == 2) {
            state = 3
        } else {
            state = 1
        }
        updateState()
    }
}
