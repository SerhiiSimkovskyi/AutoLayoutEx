//
//  NestedStackVC.swift
//  AutoLayoutEx
//
//  Created by Serhii Simkovskyi on Feb/14/18.
//  Copyright © 2018 Serhii Simkovskyi. All rights reserved.
//

import UIKit

class NestedStackVC: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var stackBreed: UIStackView!
    @IBOutlet weak var imageView: UIImageView!
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
            textView.text = "In this recipe, the stack views work together to manage most of the layout. However, they cannot—by themselves—create all of the wanted behaviors. For example, the image should maintain its aspect ratio as the image view is resized. Unfortunately, the technique used in Simple Stack View won’t work here. The layout needs to fit close to both the trailing and bottom edge of the image, and using the Aspect Fit mode would add extra white space to one of those dimensions. Fortunately, in this example, the image’s aspect ratio is always square, so you can let the image completely fill the image view’s bounds, and constrain the image view to a 1:1 aspect ratio.\n\nAdditionally, all the text fields should be the same width. Unfortunately, they are all in separate stack views, so the stacks cannot manage this. Instead, you must explicitly add equal width constraints.\n\nLike the simple stack view, you must also modify some of the CHCR priorities. These define how the views shrink and grow as the superclass’s bounds change.\n\n"
            imageView.image = UIImage(named:"cat1")
            stackBreed.isHidden = false
        case 2:
            textView.text = "Vertically, you want the text view to expand to fill the space between the upper stack and the button stack. Therefore, the text view’s vertical content hugging must be lower than any other vertical content hugging priority.\n\nHorizontally, the labels should appear at their intrinsic content size, while the text fields resize to fill any extra space. The default CHCR priorities work well for the labels. Interface Builder already sets the content hugging at 251, making it higher than the text fields; however, you still need to lower both the horizontal content hugging and the horizontal compression resistance of the text fields.\n\nThe image view should shrink so that it is the same height as the stack containing the name rows. However, stack views only loosely hug their content. This means that the image view’s vertical compression resistance must be very low, so the image view shrinks instead of having the stack view expand. Additionally, the image view’s aspect ratio constraint complicates the layout, because it allows the vertical and horizontal constraints to interact. This means that the text fields’ horizontal content hugging must also be very low, or they will prevent the image view from shrinking. In both cases, set the priority to a value of 48 or lower."
            imageView.image = UIImage(named:"cat2")
            stackBreed.isHidden = true
        default:
            textView.text = "?"
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
