//
//  ViewController.swift
//  YouGiveLoveABadName
//
//  Created by Flatiron School on 6/30/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bonJovi: UIImageView!
  
    @IBOutlet weak var animateButton: UIButton!
    
    var animateBig = false
    var imageHeightConstraint = NSLayoutConstraint()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.removeConstraints(self.view.constraints)
        self.view.translatesAutoresizingMaskIntoConstraints = false

        
        self.view.bringSubviewToFront(self.animateButton)
        self.imageHeightConstraint = bonJovi.heightAnchor.constraintEqualToAnchor(self.view.heightAnchor, multiplier: 0.3)
        self.imageHeightConstraint.active = true
        bonJovi.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor).active = true
        bonJovi.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor).active = true
        bonJovi.widthAnchor.constraintEqualToAnchor(self.view.widthAnchor).active = true
        animateButton.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor).active = true
        animateButton.bottomAnchor.constraintEqualToAnchor(self.view.bottomAnchor, constant: -50).active = true

    }
    
    @IBAction func expandButtonTapped(sender: UIButton) {
       
        if !animateBig {
            animateUp()
            animateBig = true
        }else {
            animateDown()
            animateBig = false
        }
        
     
    }
    
    func animateUp() {
        UIView.animateKeyframesWithDuration(1, delay: 0.0, options: [], animations: {
            
            UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 0.25, animations: {

                self.imageHeightConstraint.constant = -100
                
                self.view.layoutIfNeeded()
            })
            
            UIView.addKeyframeWithRelativeStartTime(0.25, relativeDuration: 0.5, animations: {
              
                self.imageHeightConstraint.constant = 550
                
                self.view.layoutIfNeeded()
            })
            
            
            UIView.addKeyframeWithRelativeStartTime(0.75, relativeDuration: 0.25, animations: {
                
                self.imageHeightConstraint.constant = 500
                
                self.view.layoutIfNeeded()
            })


        
            }) { (true) in

                self.imageHeightConstraint.constant = 500
                self.view.layoutIfNeeded()
        }
        
    }
    
    func animateDown() {
        UIView.animateKeyframesWithDuration(1, delay: 0.0, options: [], animations: {
            
            UIView.addKeyframeWithRelativeStartTime(0.1, relativeDuration: 0.25, animations: {

                self.imageHeightConstraint.constant = 500
                self.view.layoutIfNeeded()
            })
            
            UIView.addKeyframeWithRelativeStartTime(0.5, relativeDuration: 0.5, animations: {
              self.imageHeightConstraint.constant = -100
                self.view.layoutIfNeeded()
            })
            
            UIView.addKeyframeWithRelativeStartTime(0.4, relativeDuration: 0.25, animations: {
                self.imageHeightConstraint.constant = 0
                self.view.layoutIfNeeded()
            })

            
        }) { (true) in

            self.imageHeightConstraint.constant = 0
            self.view.layoutIfNeeded()
        }
        
    }

    
    
}

