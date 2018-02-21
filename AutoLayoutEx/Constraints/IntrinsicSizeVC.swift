//
//  IntrinsicSizeVC.swift
//  AutoLayoutEx
//
//  Created by Serhii Simkovskyi on Feb/20/18.
//  Copyright © 2018 Serhii Simkovskyi. All rights reserved.
//

import UIKit

class IntrinsicSizeVC: UIViewController {

    @IBOutlet weak var label0: UILabel!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    var state: Int!

    override func viewDidLoad() {
        super.viewDidLoad()

        state = 1
        updateState()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateState() {
        switch state {
        case 1:
            label0.text = "Email:"
            label1.text = "First name:"
            label2.text = "Second name:"
            label3.text = "Middle name:"
            btn1.setTitle(" Clear ", for: .normal)
            btn2.setTitle(" Fix ", for: .normal)
            btn3.setTitle(" Remove ", for: .normal)
        case 2:
            label0.text = "Address:"
            label1.text = "Bank:"
            label2.text = "Account:"
            label3.text = "CVV:"
            btn1.setTitle(" + ", for: .normal)
            btn2.setTitle(" - ", for: .normal)
            btn3.setTitle("?", for: .normal)
        default:
            label0.text = ""
            label1.text = ""
            label2.text = ""
            label3.text = ""
            
        }
        
        // Optional code: let's animate autolayout changes slowly
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
        });
    }
    
    @IBAction func btnPlay(_ sender: Any) {
        if (state == 1) {
            state = 2
        } else  {
            state = 1
        }
        updateState()
    }
    
}
