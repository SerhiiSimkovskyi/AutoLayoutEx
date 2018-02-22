//
//  Animation1VC.swift
//  AutoLayoutEx
//
//  Created by Serhii Simkovskyi on Feb/21/18.
//  Copyright © 2018 Serhii Simkovskyi. All rights reserved.
//

import UIKit

class Animation1VC: UIViewController {

    var state: Int!

    @IBOutlet weak var constraintWidth: NSLayoutConstraint!
    @IBOutlet weak var constrintHeight: NSLayoutConstraint!
    @IBOutlet weak var viewBox: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        state = 1
        //updateState()
    }
    
    func updateState() {
        switch state {
        case 1:
            constraintWidth.constant = 100
            constrintHeight.constant = 100
        case 2:
            constraintWidth.constant = 200
            constrintHeight.constant = 200
        default: ()
        }
        
        UIView.animate(withDuration: 1.0, animations: {
            if (self.state == 1) {
                self.viewBox.backgroundColor = UIColor.red
            } else {
                self.viewBox.backgroundColor = UIColor.blue
            }
            
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
        } else  {
            state = 1
        }
        updateState()
    }
}
