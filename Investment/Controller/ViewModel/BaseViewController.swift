//
//  BaseViewController.swift
//  Investment
//
//  Created by Jitendra Kumar Agarwal on 31/10/18.
//  Copyright © 2018 Jitendra Kumar Agarwal. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    var navTitles : String = ""{
        didSet {
           setTitle(title: navTitles, BGColor: UIColor(hexFromString: "#FF5733"), tintColor: .white)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      self.setupUI()
    }
    
    func setupUI () {
    self.hideBackBarButtonItem()
    }
    func build() {}
    
    
    var isMenuIcone:Bool = false {
        didSet {
            if isMenuIcone {
                addLeftBarButton(images: [#imageLiteral(resourceName: "menu")]) { (index) in
                    self.panel?.openLeft(animated: true)
                    
                }
            }else{
                addLeftBarButton(images: [#imageLiteral(resourceName: "SearchBackArrow")]) { (index) in
                 NavigationHelper.helper.navController.popViewController(animated: true)
                }
            }
            
        }
    }
    
   
    
    
}

extension BaseViewController : StoryboardIdentifiable {}
