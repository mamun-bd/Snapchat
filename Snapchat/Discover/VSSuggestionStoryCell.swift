//
//  VSSuggestionStoryCell.swift
//  Snapchat
//
//  Created by Md. Mamun-Ur-Rashid on 13/9/18.
//  Copyright © 2018 Md. Mamun-Ur-Rashid. All rights reserved.
//

import UIKit

class VSSuggestionStoryCell: UITableViewCell {

    @IBOutlet weak var container:VSSuggestionStoryDisplayNode!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
   
  

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setInformationOnView(withItems items:[VSSuggestionSnap]){
        self.container?.addItems(items: items as NSArray)
    }
    
}
