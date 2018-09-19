//
//  VSCeristalControllerCell.swift
//  Snapchat
//
//  Created by Md. Mamun-Ur-Rashid on 13/9/18.
//  Copyright © 2018 Md. Mamun-Ur-Rashid. All rights reserved.
//

import UIKit

class VSCeristalControllerCell: UICollectionViewCell {

    @IBOutlet weak var artworkContainer:UIImageView!;
    @IBOutlet weak var container:UIView!;
  
    override func awakeFromNib() {
        
        super.awakeFromNib()
        self.backgroundColor = UIColor.clear
        self.frame = CGRect(x:self.frame.origin.x, y:self.frame.origin.y, width:UIScreen.main.bounds.size.width, height:UIScreen.main.bounds.size.width);
        self.setNeedsLayout()
        self.needsUpdateConstraints()
        self.layoutIfNeeded()

    }

}
