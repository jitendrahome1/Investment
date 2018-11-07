//
//  InvestmentDetailsVC.swift
//  Investment
//
//  Created by Jitendra Kumar Agarwal on 05/11/18.
//  Copyright © 2018 Jitendra Kumar Agarwal. All rights reserved.
//

import UIKit

class InvestmentDetailsVC: BaseViewController, AuthenticationTouchID {
    
    @IBOutlet weak var textViewEdit: JAEditableTextView!
    
    var _title: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        build()
 
       // textViewArea.setContentOffset(.zero, animated: true)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    override func setupUI() {
        guard let titleHeader =  _title else { return }
        self.navTitles = titleHeader
        self.isMenuIcone = false
        self.addRightBarButton(images: [#imageLiteral(resourceName: "more")]) { (index) in
            
            
        }
    }
    override func build() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.authenticationWithTouchID()
            
        }
        
    }
    
}
// AuthenticationTouchID Delegate
extension InvestmentDetailsVC {
    func didAuthenticationScucces(succes: Bool) {
    
    }
    
   
}

