//
//  VSControllerDisplayNode.swift
//  Snapchat
//
//  Created by Md. Mamun-Ur-Rashid on 13/9/18.
//  Copyright © 2018 Md. Mamun-Ur-Rashid. All rights reserved.
//

import UIKit


class VSControllerDisplayNode: UICollectionView  {

    var items : NSMutableArray = []
    let reuseIdentifier = "VSControllerCell"
    
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
        
      self.flowLayout = UICollectionViewFlowLayout.init()
      self.flowLayout?.itemSize = CGSize.init(width: self.frame.size.width, height: self.frame.size.height)
      self.flowLayout?.scrollDirection = UICollectionViewScrollDirection.horizontal
      self.collectionViewLayout = self.flowLayout!
        
    }
    
    func registerXibForDisplay() {
        
        var nibName = UINib(nibName: "VSControllerCell", bundle:nil)
        self.register(nibName, forCellWithReuseIdentifier: reuseIdentifier)
        
        nibName = UINib(nibName: "VSCeristalControllerCell", bundle:nil)
        self.register(nibName, forCellWithReuseIdentifier: "VSCeristalControllerCell")
        
        nibName = UINib(nibName: "VSControllerDiscoverCell", bundle:nil)
        self.register(nibName, forCellWithReuseIdentifier: "VSControllerDiscoverCell")
        
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

extension VSControllerDisplayNode : UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
    
        return CGSize.init(width: self.bounds.width, height: self.bounds.height)
    
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    
     return 0;
    
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
     return 0;
    
    }
    
}

extension VSControllerDisplayNode : UICollectionViewDataSource {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int{
    
        return 1
    
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 0 {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! VSControllerCell
            print(self.items[indexPath.row])
            cell.layoutIfNeeded()
            cell.setNeedsDisplay()
            return cell
            
        } else if indexPath.item == 1 {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VSCeristalControllerCell", for: indexPath as IndexPath) as! VSCeristalControllerCell
           // print(self.items[indexPath.row])
            cell.layoutIfNeeded()
            cell.setNeedsDisplay()
            return cell
            
            
        } else {
        
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VSControllerDiscoverCell", for: indexPath as IndexPath) as! VSControllerDiscoverCell
            cell.setInformationOnView()
            cell.layoutIfNeeded()
            cell.setNeedsDisplay()
            return cell
  
            
        }
    }
    
    
}

extension VSControllerDisplayNode : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print("You selected cell #\(indexPath.item)!")
//          self.selectionDelegate?.didSelectItem(item: indexPath.item)
    }
    
}

extension VSControllerDisplayNode : UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        self.selectionDelegate?.didUpdateOverlayOpacity(opacity: scrollView.contentOffset.x)
        
    }

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


