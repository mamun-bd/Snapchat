//
//  UICollectionView+Extension.swift
//  Snapchat
//
//  Created by Md. Mamun-Ur-Rashid on 13/9/18.
//  Copyright © 2018 Md. Mamun-Ur-Rashid. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    func centerContentHorizontalyByInsetIfNeeded(minimumInset: UIEdgeInsets) {
        
        guard let layout = collectionViewLayout as? UICollectionViewFlowLayout,
            layout.scrollDirection == .horizontal else {
                assertionFailure("\(#function): layout.scrollDirection != .horizontal")
                return
        }
        
        if layout.collectionViewContentSize.width > frame.size.width {
            contentInset = minimumInset
        } else {
            contentInset = UIEdgeInsets(top: minimumInset.top,
                                        left: (frame.size.width - layout.collectionViewContentSize.width) / 2,
                                        bottom: minimumInset.bottom,
                                        right: 0)
        }
    }
    
}

    

