//
//  VSEffectsDisplayNode.swift
//  Snapchat
//
//  Created by Md. Mamun-Ur-Rashid on 13/9/18.
//  Copyright © 2018 Md. Mamun-Ur-Rashid. All rights reserved.
//

import UIKit


class VSEffectsDisplayNode: UICollectionView  {

    var items : NSMutableArray = []
    let reuseIdentifier = "VSEffectCell"
    
    var flowLayout : UICollectionViewFlowLayout?
    var selectionDelegate : VSEffectsViewDelegate?
    
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
        
      self.flowLayout = UICollectionViewFlowLayout.init()
      self.flowLayout?.itemSize = CGSize.init(width: self.frame.size.height, height: self.frame.size.height)
      self.flowLayout?.scrollDirection = UICollectionViewScrollDirection.horizontal
      self.collectionViewLayout = self.flowLayout!
        
    }
    
    func registerXibForDisplay() {
        
        let nibName = UINib(nibName: "VSEffectCell", bundle:nil)
        self.register(nibName, forCellWithReuseIdentifier: reuseIdentifier)

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

extension VSEffectsDisplayNode : UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
    
        return CGSize.init(width: self.bounds.height, height: self.bounds.height)
    
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    
     return 0;
    
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
     return 0;
    
    }
    
}

extension VSEffectsDisplayNode : UICollectionViewDataSource {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int{
    
        return 1
    
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! VSEffectCell
            print(self.items[indexPath.row])
            cell.layoutIfNeeded()
            cell.setNeedsDisplay()
            return cell
        
    }
    
    
}

extension VSEffectsDisplayNode : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.item)!")
        self.selectionDelegate?.didSelected(effect:self.items.object(at: indexPath.item) as? VSEffect )
    }
    
}

extension VSEffectsDisplayNode : UIScrollViewDelegate {
    

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        let centerPoint = CGPoint.init(x: self.center.x + self.contentOffset.x, y: self.center.y + self.contentOffset.y)
        let centerCellIndexPath = self.indexPathForItem(at: centerPoint)
        if decelerate == false {
            self.endDecelerating(indexpath: centerCellIndexPath! as NSIndexPath)
        }

    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let centerPoint = CGPoint.init(x: self.center.x + self.contentOffset.x, y: self.center.y + self.contentOffset.y)
        let centerCellIndexPath = self.indexPathForItem(at: centerPoint)
        self.endDecelerating(indexpath: centerCellIndexPath! as NSIndexPath)
    }
    
    func endDecelerating(indexpath:NSIndexPath) {
        
      
        
    }
    
}


