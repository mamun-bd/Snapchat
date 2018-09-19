//
//  VSHomeController.swift
//  Snapchat
//
//  Created by Md. Mamun-Ur-Rashid on 13/9/18.
//  Copyright © 2018 Md. Mamun-Ur-Rashid. All rights reserved.
//

import UIKit
import AVFoundation

let btnCaptureMinScaleValue : CGFloat = 0.75
let btnDiscoverMinScaleValue : CGFloat = 0.85
let maxOpacityValue : CGFloat = 1.0
let bottomConstraintForCaptureButton : CGFloat = 80
let trailingConstraintForDiscoverButton : CGFloat = 15
let paddingDistance : CGFloat = 4.0
let captureButtonWidth : CGFloat = 64.0

class VSHomeController: UIViewController {
    
    @IBOutlet weak var cameraView : VSCameraView!
    @IBOutlet weak var captureImageView:UIImageView!
    @IBOutlet weak var container:VSControllerDisplayNode!
    @IBOutlet weak var effectView:VSEffectsView!
    
    @IBOutlet weak var btnEffectShow:UIButton!
    @IBOutlet weak var btnEffectHide:UIButton!
    
    @IBOutlet weak var btnFriends:UIButton!
    @IBOutlet weak var btnDiscover:UIButton!
    @IBOutlet weak var btnCapture:UIButton!
    @IBOutlet weak var btnMemories:UIButton!
    @IBOutlet weak var overlayView:UIView!
    @IBOutlet weak var topbarView:VSTopbarView!
   
    
    @IBOutlet var friendsLeadingConstraing:NSLayoutConstraint!;
    @IBOutlet var btnCaptureBottomConstraint:NSLayoutConstraint!;
    @IBOutlet var btnMemoriesBottomConstraint:NSLayoutConstraint!;
    @IBOutlet var btnDiscoverTrailingConstraint:NSLayoutConstraint!;
    @IBOutlet var btnFriendsLeadingConstraint:NSLayoutConstraint!;
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.effectView?.hide()
        self.btnEffectShow.isHidden = false
        self.btnEffectHide.isHidden = true
        
        self.topbarView?.initializeContent()

        self.container?.addItems(items: ["a.jpg", "b.jpg", "c.jpg"])
        let indexPath = IndexPath(item: 1, section: 0)
        self.container.selectItem(at: indexPath, animated: false, scrollPosition: .left)
        self.container.selectionDelegate = self

        self.cameraView.delegate = self
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.cameraView.viewDidAppear()

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.cameraView.viewWillDisappear()
    }
    
    @IBAction func didTakePhoto(_ sender: Any) {
        
      //  self.cameraView.didTakePhoto()
        
    }
    
    @IBAction func showEffect(_ sender: Any) {
    
       self.btnMemories.isHidden = true
       self.btnEffectShow.isHidden = true
       self.btnEffectHide.isHidden = false
       self.effectView?.show()

    }
    
    @IBAction func hideEffect(_ sender: Any) {
        
        self.btnMemories.isHidden = false
        self.btnEffectShow.isHidden = false
        self.btnEffectHide.isHidden = true
        self.effectView?.hide()
        
    }
    
    @IBAction func showFriendsController(_ sender: Any) {
       
        let indexPath = IndexPath(item: 0, section: 0)
        self.container.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
      
    }
    
    @IBAction func showDiscoverController(_ sender: Any) {
        
        let indexPath = IndexPath(item: 2, section: 0)
        self.container.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    func updatePosition(withDistance distance:CGFloat, withController opacity:CGFloat) {
        
        var scaleValue  = maxOpacityValue - opacity
        if scaleValue < btnCaptureMinScaleValue {
            scaleValue = btnCaptureMinScaleValue
        }
        
        var scaleValueForDiscover  = maxOpacityValue - opacity
        if scaleValueForDiscover < btnDiscoverMinScaleValue {
            scaleValueForDiscover = btnDiscoverMinScaleValue
        }

        
        self.btnCapture.transform = CGAffineTransform(scaleX: scaleValue, y: scaleValue)
        self.btnCaptureBottomConstraint.constant = bottomConstraintForCaptureButton - (opacity * captureButtonWidth)
        
        self.btnDiscover.transform = CGAffineTransform(scaleX: scaleValueForDiscover, y: scaleValueForDiscover)

        self.btnDiscoverTrailingConstraint.constant = (opacity * ((self.view.bounds.width - (trailingConstraintForDiscoverButton * paddingDistance)) / paddingDistance )) + trailingConstraintForDiscoverButton
        
        self.btnFriends.transform = CGAffineTransform(scaleX: scaleValueForDiscover, y: scaleValueForDiscover)
        
        
        self.btnFriendsLeadingConstraint.constant = (opacity * ((self.view.bounds.width - (trailingConstraintForDiscoverButton * paddingDistance)) / paddingDistance )) + trailingConstraintForDiscoverButton

    }



}



extension VSHomeController : VSCameraViewDelegate {

    
    func didCaptureImage(item: UIImage?) {
      //  self.captureImageView.image = item
    }
    
    func didCaptureVideo(itemURL: String?) {
        
    }
    
}


extension VSHomeController : VSDisplayNodeDelegate {
    
    func didSelectItem(item: NSInteger) {
        
    }
    
    func didUpdateOverlayOpacity(opacity: CGFloat) {
        
        
        if opacity > self.view.bounds.width {
            self.overlayView.backgroundColor = UIColor.init(hexFromString: "#E040FB")
        } else if opacity < self.view.bounds.width {
            self.overlayView.backgroundColor = UIColor.init(hexFromString: "#448AFF")
        }
       
            
        let difference = (self.view.bounds.width - opacity)
        
        if difference <= -1.0 {
            
            let opacityValue1  = -(difference/(self.view.bounds.width-1))
            self.overlayView.alpha = opacityValue1
            
        } else if difference <= 0  {
            
            self.overlayView.alpha = 0
         
        } else {
            
            let opacityValue  = (difference/(self.view.bounds.width-1))
            self.overlayView.alpha = opacityValue

        }
      
        
        if (self.overlayView.alpha > 0.0 ) {
            
            self.btnEffectShow.alpha = 0.0;
            self.btnEffectHide.alpha = 0.0;
            self.effectView.alpha = 0.0;
            
        } else {
            
            self.btnEffectShow.alpha = 1.0;
            self.btnEffectHide.alpha = 1.0;
            self.effectView.alpha = 1.0;
            
        }
      
        self.updatePosition(withDistance: opacity, withController: self.overlayView.alpha)
        self.topbarView.updatePosition(withDistance: opacity, withController: self.overlayView.alpha)
     
        
    }
    
    
}





