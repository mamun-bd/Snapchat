//
//  VSSuggestionStoryDisplayNode.swift
//  Snapchat
//
//  Created by Md. Mamun-Ur-Rashid on 13/9/18.
//  Copyright © 2018 Md. Mamun-Ur-Rashid. All rights reserved.
//

import UIKit

private let kImgName = "img_"
private let kTotalImgs = 10


class VSSuggestionStoryDisplayNode: UICollectionView  {

    var items : NSMutableArray = []
  
    
    var flowLayout : UICollectionViewFlowLayout?
    var selectionDelegate : VSDisplayNodeDelegate?
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
       self.setUpView()
    }
    
    func setUpView() {
        
        self.setUpCollectionViewLayoutForDisplay()
        self.registerXibForDisplay()
        self.dataSource = self
        self.delegate = self
        self.reloadData()
        
    }
    
    func setUpCollectionViewLayoutForDisplay() {
    
       self.contentInset = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
    
    }
    
    func registerXibForDisplay() {
        
        let nibName = UINib(nibName: "VSSuggestionCell", bundle:nil)
        self.register(nibName, forCellWithReuseIdentifier: "VSSuggestionCell")

    }

    func resetInformation() {
      
        if self.items.count > 0 {
            
            self.items.removeAllObjects()
            self.reloadData()
            self.collectionViewLayout.invalidateLayout()
        }
    }

    
    func addItems(items:NSArray) {
        self.resetInformation()
        if items.count > 0 {
            self.items.addObjects(from:items as! [Any])
            self.reloadData()
         
            
        }
        
    }


}


extension VSSuggestionStoryDisplayNode : UICollectionViewDataSource {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int{
    
        return 1
    
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
//        let imgNumber = indexPath.item % kTotalImgs + 1
//        let imageName = kImgName + "\(imgNumber)"
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VSSuggestionCell", for: indexPath) as! VSSuggestionCell
     
        
        return cell
    }
    
    
}

extension VSSuggestionStoryDisplayNode : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print("You selected cell #\(indexPath.item)!")
//          self.selectionDelegate?.didSelectItem(item: indexPath.item)
    }
    
}



