//
//  Animation3VC.swift
//  AutoLayoutEx
//
//  Created by Serhii Simkovskyi on Feb/22/18.
//  Copyright © 2018 Serhii Simkovskyi. All rights reserved.
//

import UIKit

class Animation3VC: UIViewController {

    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    var state: Int!
    
    var imageView0: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        state = 1
        
        // create view to be animated
        imageView0 = UIImageView(frame: CGRect(x: 0, y: 100, width: 100, height: 100))
        imageView0.isHidden = false
        imageView0.clipsToBounds = true
        imageView0.contentMode = .scaleAspectFit
        view.addSubview(imageView0)
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
        
        imageView0.frame = imageView1.frame
        self.imageView0.isHidden = false

        if (state == 1) {
            imageView0.image = imageView1.image
            imageView1.image = UIImage(named:"cat2")
        } else {
            imageView0.image = imageView1.image
            imageView1.image = UIImage(named:"cat1")
        }

        rotateView(view: imageView0, duration: 0.8)
        self.imageView2.alpha = 1.0

        UIView.animate(withDuration:0.8, animations: {
            self.imageView0.frame = self.imageView2.frame
            self.imageView2.alpha = 0.0
        }, completion: { success in
            self.view.layoutIfNeeded()
            
            if (self.state == 1) {
                self.imageView2.image = UIImage(named:"cat1")
            } else {
                self.imageView2.image = UIImage(named:"cat2")
            }
            self.imageView0.isHidden = true
            self.imageView2.alpha = 1.0
        })
    }

    let kRotationAnimationKey = "com.smartphoneware.AutolayoutEx.rotation" // Any key

    func rotateView(view: UIView, duration: Double = 1) {
        if view.layer.animation(forKey: kRotationAnimationKey) == nil {
            let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
            
            rotationAnimation.fromValue = 0.0
            rotationAnimation.toValue = Float(Double.pi * 2.0)
            rotationAnimation.duration = duration
            rotationAnimation.repeatCount = 1// Float.infinity
            
            view.layer.add(rotationAnimation, forKey: kRotationAnimationKey)
        }
    }
    
}
