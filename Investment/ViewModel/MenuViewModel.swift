//
//  MenuViewModel.swift
//  Investment
//
//  Created by Jitendra Kumar Agarwal on 02/11/18.
//  Copyright © 2018 Jitendra Kumar Agarwal. All rights reserved.
//

import Foundation

class MenuViewModel: NSObject {
    
    private var arrayMenuList: [String] = ["Home", "Create Folder", "Logout"]
    
    
    public var numberOfItems : [String] {
        
        get{
            
            return arrayMenuList
        }
        
    }
    
}

