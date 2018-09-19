//
//  VSEffectsView.swift
//  Snapchat
//
//  Created by Md. Mamun-Ur-Rashid on 13/9/18.
//  Copyright © 2018 Md. Mamun-Ur-Rashid. All rights reserved.
//

import UIKit

class VSEffectsView: VSXibView {

    @IBOutlet weak var container:VSEffectsDisplayNode!;

    var delegate : VSEffectsViewDelegate?
    
    func show() {
       
        self.container?.selectionDelegate = self
        self.container?.addItems(items: ["food_1.jpg", "food_2.jpg", "food_3.jpg","food_1.jpg", "food_2.jpg", "food_3.jpg","food_1.jpg", "food_2.jpg", "food_3.jpg"])
        self.isHidden = false
    }
    
    func hide() {
        self.isHidden = false
        self.container?.resetInformation()
    }
   
}


extension VSEffectsView : VSEffectsViewDelegate {
    
    func didSelected(effect item: VSEffect?) {
        
        self.delegate?.didSelected(effect: item)
        
    }
  
}



