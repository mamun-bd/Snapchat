//
//  UIStoryboard+Addition.swift
//  Snapchat
//
//  Created by Md. Mamun-Ur-Rashid on 13/9/18.
//  Copyright © 2018 Md. Mamun-Ur-Rashid. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    func getMainStoryboard() -> UIStoryboard {
        return UIStoryboard.init(name: "Main", bundle: Bundle.main)
    }

}
