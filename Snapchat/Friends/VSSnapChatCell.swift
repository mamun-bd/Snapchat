//
//  VSSnapChatCell.swift
//  Snapchat
//
//  Created by Md. Mamun-Ur-Rashid on 13/9/18.
//  Copyright © 2018 Md. Mamun-Ur-Rashid. All rights reserved.
//

import UIKit

class VSSnapChatCell: UITableViewCell {

     @IBOutlet weak var container:UIView!;
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        self.frame = CGRect(x:self.frame.origin.x, y:self.frame.origin.y, width:UIScreen.main.bounds.size.width, height:UIScreen.main.bounds.size.width);
        self.setNeedsLayout()
        self.needsUpdateConstraints()
        self.layoutIfNeeded()
        self.selectionStyle = .none
        self.container.roundCorners(corners: [.topLeft, .topRight], radius: 10)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
