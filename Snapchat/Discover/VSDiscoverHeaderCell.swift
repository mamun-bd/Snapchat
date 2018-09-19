//
//  VSDiscoverHeaderCell.swift
//  Snapchat
//
//  Created by Md. Mamun-Ur-Rashid on 13/9/18.
//  Copyright © 2018 Md. Mamun-Ur-Rashid. All rights reserved.
//

import UIKit

class VSDiscoverHeaderCell: UITableViewHeaderFooterView {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var container:UIView!;
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.frame = CGRect(x:self.frame.origin.x, y:self.frame.origin.y, width:UIScreen.main.bounds.size.width, height:UIScreen.main.bounds.size.width);
        self.setNeedsLayout()
        self.needsUpdateConstraints()
        self.layoutIfNeeded()
       
        self.container.roundCorners(corners: [.topLeft, .topRight], radius: 10)
    }

   
}
