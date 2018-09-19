//
//  VSCameraViewDelegate.swift
//  Snapchat
//
//  Created by Md. Mamun-Ur-Rashid on 13/9/18.
//  Copyright © 2018 Md. Mamun-Ur-Rashid. All rights reserved.
//

import UIKit

protocol VSCameraViewDelegate : NSObjectProtocol {

    func didCaptureImage(item: UIImage?)
    func didCaptureVideo(itemURL: String?)
   
}

