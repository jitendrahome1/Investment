//
//  BaseTableViewController.swift
//  Investment
//
//  Created by Jitendra Kumar Agarwal on 31/10/18.
//  Copyright © 2018 Jitendra Kumar Agarwal. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundView = UIImageView(image: imageBG)
    
        
    }
   
    public var imageBG: UIImage! {
        
        get{
            return  UIImage(named: "bg")
        }
        set {
            if ((newValue) != nil){
            self.tableView.backgroundView = nil
            self.tableView.backgroundView = UIImageView(image: newValue)
            }
            
            
        }
        
    }
}

extension BaseTableViewController : StoryboardIdentifiable {}

