//
//  VSTopbarView.swift
//  Snapchat
//
//  Created by Md. Mamun-Ur-Rashid on 13/9/18.
//  Copyright © 2018 Md. Mamun-Ur-Rashid. All rights reserved.
//

import UIKit

class VSTopbarView: VSXibView {

    @IBOutlet var discoverViewLeadingConstraint : NSLayoutConstraint!
    
    @IBOutlet weak var btnProfile : UIButton!
    @IBOutlet weak var btnSearch : UIButton!
    @IBOutlet weak var lblTitle : UILabel!
    
    @IBOutlet weak var btnRearCamera : UIButton!
    @IBOutlet weak var btnFlash : UIButton!
    @IBOutlet weak var btnNight : UIButton!
    @IBOutlet weak var btnAddFriend : UIButton!
    @IBOutlet weak var btnChat : UIButton!
    
    @IBOutlet weak var profileView : UIView!
    @IBOutlet weak var friendsView : UIView!
    @IBOutlet weak var cameraView : UIView!
    

    
    func initializeContent() {
        
        self.friendsView.alpha = 0
        self.cameraView.alpha = 1
        self.lblTitle.text = "Search"
       
    }
    
    func updatePosition(withDistance distance:CGFloat, withController opacity:CGFloat) {
        
        
        if (distance <= self.bounds.width) {
            
            self.cameraView.alpha = 1-opacity
            self.friendsView.alpha = opacity
            
            if self.cameraView.alpha >= 1.0 {
                 self.lblTitle.text = "Search"
            } else {
                 self.lblTitle.text = "Friends"
            }
        
        } else if (distance <= (self.bounds.width*2.0)) {
            
    
            self.cameraView.alpha = 1-opacity
            
            if self.cameraView.alpha >= 1.0 {
                self.lblTitle.text = "Search"
            } else {
                self.lblTitle.text = "Discover"
            }
           
        } else {
            
             self.lblTitle.text = "Discover"
            
        }
  
        
    }
    
  
  
}
