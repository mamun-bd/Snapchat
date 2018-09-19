//
//  VSBottombarView.swift
//  Snapchat
//
//  Created by Md. Mamun-Ur-Rashid on 13/9/18.
//  Copyright © 2018 Md. Mamun-Ur-Rashid. All rights reserved.
//

import UIKit

class VSBottombarView: VSXibView {
    
    @IBOutlet weak var btnFriends:UIButton!
    @IBOutlet weak var btnDiscover:UIButton!
    @IBOutlet weak var btnCapture:UIButton!
    @IBOutlet weak var btnMemories:UIButton!
    @IBOutlet weak var btnEffect:UIButton!
    
    @IBOutlet var btnCaptureBottomConstraint:NSLayoutConstraint!;
    @IBOutlet var btnDiscoverTrailingConstraint:NSLayoutConstraint!;
    @IBOutlet var btnFriendsLeadingConstraint:NSLayoutConstraint!;

    func initializeContainer() {
        
        self.btnFriends.isUserInteractionEnabled = true
        self.btnDiscover.isUserInteractionEnabled = true
        self.btnCapture.isUserInteractionEnabled = true
        //self.btnEffect.isUserInteractionEnabled = true
        
       
        
    }
    
    func updatePosition(withDistance distance:CGFloat, withController opacity:CGFloat) {
        
        var scaleValue  = 1.0 - opacity
        if scaleValue < 0.75 {
            scaleValue = 0.75
        }
        
        var scaleValueForDiscover  = 1.0 - opacity
        
        if scaleValueForDiscover < 0.85 {
            scaleValueForDiscover = 0.85
        }
        
        self.btnCapture.transform = CGAffineTransform(scaleX: scaleValue, y: scaleValue)
        self.btnCaptureBottomConstraint.constant = 80 - (opacity * 64)
        
        self.btnDiscover.transform = CGAffineTransform(scaleX: scaleValueForDiscover, y: scaleValueForDiscover)
        self.btnDiscoverTrailingConstraint.constant = (opacity * (self.bounds.width-60)/4.0)+15
        
        self.btnFriends.transform = CGAffineTransform(scaleX: scaleValueForDiscover, y: scaleValueForDiscover)
        self.btnFriendsLeadingConstraint.constant = (opacity * (self.bounds.width-60)/4.0)+15
        
    }
    
    @IBAction func didTakePhoto(_ sender: Any) {
        
        //self.cameraView.didTakePhoto()
        
    }
    

    
}
