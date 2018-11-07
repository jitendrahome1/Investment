//
//  InverstmentListModel.swift
//  Investment
//
//  Created by Jitendra Kumar Agarwal on 05/11/18.
//  Copyright © 2018 Jitendra Kumar Agarwal. All rights reserved.
//

import Foundation


class InverstmentViewModel: NSObject {
    

    private var arrFolderTitle:[String] = ["Anup Hesab", "Arif Hesab", "ShriPal Hesab","ShriPal Hesab","Rajesh Hesab","Rahul Hesab","Jitu Hesab","Viakrm Hesab","Ravi Agarwal Hesab"]
    
    public var cellHieght: Float {
        get {
            return 74.0
        }
    }
    
    public var numberOfItems : [String] {
        
        get{
            
            return arrFolderTitle
        }
        
    }
}
