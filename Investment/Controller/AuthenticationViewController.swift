//
//  AuthenticationViewController.swift
//  Investment
//
//  Created by Jitendra Kumar Agarwal on 01/11/18.
//  Copyright © 2018 Jitendra Kumar Agarwal. All rights reserved.
//

import UIKit


class AuthenticationViewController: BaseViewController,JATouchIDAuthentication {
    var delegate : AuthenticationTouchID?
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        JAauthenticationWithTouchID({ (succes) in
         self.dismiss(animated: true, completion: {
           
            guard let _deleagte = self.delegate else {
                
                return
                
            }
            
            _deleagte.didAuthenticationScucces(succes: succes)
            })
            
        

            
            
        }, error: { (error) in
            
        }, errorMessage: { (errMessge) in
            
            self.configureeAuthenticationPolicy()
            
        })
    }

}


