//
//  EditableAccessoryView.swift
//  Investment
//
//  Created by Jitendra Kumar Agarwal on 05/11/18.
//  Copyright © 2018 Jitendra Kumar Agarwal. All rights reserved.
//

import Foundation
import UIKit

class EditableAccessoryView : UIView  {
    
    override func awakeFromNib() {
      
    }
    
    func showAccessoryView() {
        UIView.animate(withDuration: 0.5, animations: {
            self.alpha = 1.0
        }, completion: nil)
    }
    func hideAccessoryView(){
        
        UIView.animate(withDuration: 0.5, animations: {
             self.alpha = 0.0
        }, completion: nil)
       
    }
    

    @IBAction func didTapCloseAction(_ sender: UIButton) {
   
        hideAccessoryView()
    }
    
    @IBAction func didTapFontAction(_ sender: UIButton) {
        showAccessoryView()
    }
}
