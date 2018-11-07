//
//  LoginViewController.swift
//  Investment
//
//  Created by Jitendra Kumar Agarwal on 31/10/18.
//  Copyright © 2018 Jitendra Kumar Agarwal. All rights reserved.
//

import UIKit
import RSFloatInputView
import EMSpinnerButton
class LoginViewController: BaseTableViewController, AuthenticationTouchID {
    @IBOutlet weak var txtUserName: RSFloatInputView!
    @IBOutlet weak var txtPassword: RSFloatInputView!
    @IBOutlet weak var btnLogin: EMSpinnerButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        build()
    }
    
    @IBAction func action(_ sender: UIButton) {
        self.view.endEditing(true)
        self.btnLogin.animate(animation: .collapse)
        didAuthenticationScucces(succes: true)
        
    }
}

extension LoginViewController {
    fileprivate func setupUI() {
        self.imageBG = #imageLiteral(resourceName: "bg1")
        self.btnLogin.layer.cornerRadius = 10.0
        DispatchQueue.main.async {
            
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
          //  self.authenticationWithTouchID()
            
        }
    }
    fileprivate func build() {
        self.txtPassword.textField.isSecureTextEntry = true
    }
    
}
// AuthenticationTouchID Delegate
extension LoginViewController {
    func didAuthenticationScucces(succes: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            let leftMenuVC  = UIStoryboard(storyboard: .main).instantiateViewController(withIdentifier: "MenuVC") as! MenuVC
            let centerVC =  UIStoryboard(storyboard: .main).instantiateViewController(withIdentifier: "MainNavigation") as! UINavigationController
            NavigationHelper.helper.navController = centerVC
            let rootController = FAPanelController ()
            rootController.configs.rightPanelWidth = 808
            rootController.configs.bounceOnRightPanelOpen = false
            _ = rootController.center(centerVC).left(leftMenuVC)
            UIApplication.shared.windows.first!.rootViewController =  rootController
            
            
        }
    }
    
}


