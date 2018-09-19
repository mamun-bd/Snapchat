//
//  VSDiscoverView.swift
//  Snapchat
//
//  Created by Md. Mamun-Ur-Rashid on 13/9/18.
//  Copyright © 2018 Md. Mamun-Ur-Rashid. All rights reserved.
//

import UIKit

class VSDiscoverView: VSXibView {

    @IBOutlet weak var discoverTableView:UITableView!
    @IBOutlet weak var gradientLayer:UIView!
    @IBOutlet weak var bottomGradientLayer:UIView!
    
    var headerView : VSFriendsHeader?
    var itemCell : VSContactCell?
    
    var contactList : NSMutableArray = []
    var snapList : NSMutableArray = []
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        self.gradientLayer?.applyGradient(withColours: [UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.6),UIColor.clear], gradientOrientation: .vertical)
        self.gradientLayer.alpha = 0
        
        self.bottomGradientLayer?.applyGradient(withColours: [UIColor.clear,UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.3)], gradientOrientation: .vertical)
    }

    
    
    func viewDidLoad() {
        
        self.registerXib()
        self.initializeDatasource()
        self.discoverTableView.reloadData()
        
    }
    
    
    func blur(){
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = (self.headerView?.bounds)!
        blurEffectView.alpha = 0.9
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.headerView?.addSubview(blurEffectView)
    }
    
    func registerXib() {

        self.discoverTableView.sectionHeaderHeight = 0;
        self.discoverTableView.sectionFooterHeight = 0;

        self.headerView = VSFriendsHeader.init(frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: 54))
        self.discoverTableView.tableHeaderView = self.headerView

        self.discoverTableView.register(UINib(nibName: "VSSuggestionStoryCell", bundle:Bundle.main), forCellReuseIdentifier: "VSSuggestionStoryCell");
        self.discoverTableView.register(UINib(nibName: "VSFriendStoryCell", bundle:Bundle.main), forCellReuseIdentifier: "VSFriendStoryCell");
        
        self.discoverTableView.register(UINib.init(nibName: "VSDiscoverHeaderCell", bundle: Bundle.main), forHeaderFooterViewReuseIdentifier: "VSDiscoverHeaderCell")
         self.discoverTableView.register(UINib.init(nibName: "VSDiscoverForYouHeaderCell", bundle: Bundle.main), forHeaderFooterViewReuseIdentifier: "VSDiscoverForYouHeaderCell")

        self.discoverTableView.separatorStyle = .none
    }
    
    func initializeDatasource() {
        
        self.snapList.removeAllObjects()
        self.contactList.removeAllObjects()
        
        self.contactList.add(VSContact())
        
        for _ in 1...15 {
            self.snapList.add(VSSuggestionSnap())
        }
       
    }
  
}

extension VSDiscoverView : UITableViewDataSource {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
 
        if section == 0 {
             return tableView.dequeueReusableHeaderFooterView(withIdentifier: "VSDiscoverHeaderCell");
        } else {
             return tableView.dequeueReusableHeaderFooterView(withIdentifier: "VSDiscoverForYouHeaderCell");
        }
 
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

            return 35
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return self.contactList.count
        } else {
            return self.snapList.count > 0 ? 1 : 0;
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "VSFriendStoryCell", for: indexPath) as! VSFriendStoryCell
            return cell
            
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "VSSuggestionStoryCell", for: indexPath) as! VSSuggestionStoryCell
            cell.setInformationOnView(withItems: self.snapList as! [VSSuggestionSnap])
            return cell
            
        }
        
        
        
    }
    
}

extension VSDiscoverView : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        
        if indexPath.section == 0 {
            return UITableViewAutomaticDimension
        } else {
            
            let totalItems = self.snapList.count
            let totalRows = Int(totalItems/2)
            if (CGFloat(totalItems) - CGFloat(totalRows) * 2.0) == 1 {
                
                let sideItemWidth = (self.bounds.size.width-12.0)/2.0
                let sideItemHeight = ((sideItemWidth * 2.0) - (sideItemWidth * 0.30)) - 40.0
                return (sideItemHeight * (CGFloat(totalRows)+1.0)) + (CGFloat(totalRows+1+1) * 4)
                
            } else {
                
                let sideItemWidth = (self.bounds.size.width-12.0)/2.0
                let sideItemHeight = (sideItemWidth * 2.0) - (sideItemWidth * 0.30)
                return sideItemHeight * CGFloat(totalRows) + (CGFloat(totalRows+1) * 4)
            }
            

        }

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        

    }
    
}

extension VSDiscoverView : UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let yPos: CGFloat = scrollView.contentOffset.y
        self.gradientLayer.alpha = (1.0/74.0) * yPos

    }
    
}
