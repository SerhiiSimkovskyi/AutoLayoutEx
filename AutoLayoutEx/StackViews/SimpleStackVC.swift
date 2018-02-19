//
//  SimpleStackViewController.swift
//  AutoLayoutEx
//
//  Created by Serhii Simkovskyi on Feb/13/18.
//  Copyright © 2018 Serhii Simkovskyi. All rights reserved.
//

import UIKit

class SimpleStackVC: UIViewController {

    @IBOutlet weak var labelHint: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    var state: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        state = 1
        updateState()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func updateState() {
        switch state {
        case 1:
            labelHint.text = "In this example, the stack view fills its superview, with a small, standard margin. The arranged views are resized to fill the stack view’s bounds. Horizontally, each view is stretched to match the stack view’s width."
            imageView.image = UIImage(named:"cat1")
        case 2:
            labelHint.text = "Vertically, the views are stretched based on their CHCR priorities. The image view should always shrink and grow to fill the available space. Therefore, its vertical content hugging and compression resistance priorities must be lower than the label and button’s default priorities."
            imageView.image = UIImage(named:"cat2")
        default:
            labelHint.text = "?"
        }
        
        // Optional code: let's animate autolayout changes slowly
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
        });
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
