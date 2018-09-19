//
//  VSFriendsView.swift
//  Snapchat
//
//  Created by Md. Mamun-Ur-Rashid on 13/9/18.
//  Copyright © 2018 Md. Mamun-Ur-Rashid. All rights reserved.
//

import UIKit

class VSFriendsView: VSXibView {

    @IBOutlet weak var friendsTableView:UITableView!
    @IBOutlet weak var gradientLayer:UIView!
    @IBOutlet weak var bottomGradientLayer:UIView!
    
    var itemCell : VSContactCell?
    var headerView : VSFriendsHeader?
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
       self.friendsTableView.reloadData()

    }
    

    func registerXib() {
        
        self.friendsTableView.sectionHeaderHeight = 0;
        self.friendsTableView.sectionFooterHeight = 0;
        
        self.headerView = VSFriendsHeader.init(frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: 54))
        self.friendsTableView.tableHeaderView = self.headerView!

        self.friendsTableView.register(UINib(nibName: "VSContactCell", bundle:Bundle.main), forCellReuseIdentifier: "VSContactCell");
        self.friendsTableView.register(UINib(nibName: "VSSnapChatCell", bundle:Bundle.main), forCellReuseIdentifier: "VSSnapChatCell");
    
        let headerNib = UINib.init(nibName: "VSContactSectionHeaderCell", bundle: Bundle.main)
        self.friendsTableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "VSContactSectionHeaderCell")
        self.friendsTableView.separatorStyle = .none
        
    }
    
    func initializeDatasource() {
        
        self.contactList.removeAllObjects()
        self.snapList.removeAllObjects()
        
        for _ in 1...15 {
            self.contactList.add(VSContact())
        }
        
        self.snapList.add(VSsnap())
        
    }
   

}


extension VSFriendsView : UITableViewDataSource {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        if section == 0 {
            return nil
        } else {
            return  tableView.dequeueReusableHeaderFooterView(withIdentifier: "VSContactSectionHeaderCell")
        }

    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return CGFloat.leastNormalMagnitude
        } else {
           return 30
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
       
            return CGFloat.leastNormalMagnitude
      
    }
    
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return self.snapList.count
        } else {
            return self.contactList.count;
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "VSSnapChatCell", for: indexPath) as! VSSnapChatCell
            return cell
            
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "VSContactCell", for: indexPath) as! VSContactCell
            return cell
            
        }
        
        
      
    }
    
}

extension VSFriendsView : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        
        return UITableViewAutomaticDimension
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        

    }
    
}

extension VSFriendsView : UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
          let yPos: CGFloat = scrollView.contentOffset.y
          self.gradientLayer.alpha = (1.0/74.0) * yPos

    }
    
}
