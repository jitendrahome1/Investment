//
//  TouchIDAuthentication.swift
//  Investment
//
//  Created by Jitendra Kumar Agarwal on 01/11/18.
//  Copyright © 2018 Jitendra Kumar Agarwal. All rights reserved.
//

import Foundation
import LocalAuthentication
let kMsgShowReason = "To access the scure data"
var policy: LAPolicy?
var context = LAContext()
typealias sucessResult      = ((_ sucessResult: Bool)->())?
typealias error             = ((_ error: Error)->())?
typealias errorMessage      = ((_ errorMessage: String)->())?
fileprivate var _sucessResult       :   sucessResult
fileprivate var _errorResult        :   error
fileprivate var _errorMessage       :   errorMessage
protocol JATouchIDAuthentication {
   
    func JAauthenticationWithTouchID(_ sucessResult:sucessResult,error:error ,errorMessage:errorMessage)

}
protocol AuthenticationTouchID {
    func authenticationWithTouchID()
    func didAuthenticationScucces(succes:Bool)
}
extension JATouchIDAuthentication where Self: AuthenticationViewController  {
   func JAauthenticationWithTouchID(_ sucessResult:sucessResult,error:error ,errorMessage:errorMessage) {
    
        if #available(iOS 9.0, *) {
            policy = .deviceOwnerAuthentication
        } else {
            context.localizedFallbackTitle = "Fuu!"
            policy = .deviceOwnerAuthenticationWithBiometrics
        }
        var err: NSError?
        guard context.canEvaluatePolicy(policy!, error: &err) else {
            return
        }
        _sucessResult = sucessResult
        _errorResult = error
        _errorMessage = errorMessage
       self.configureeAuthenticationPolicy()
   
    }
    
    func configureeAuthenticationPolicy() {
           context = LAContext()
        // Start evaluation process with a callback that is executed when the user ends the process successfully or not
        context.evaluatePolicy(policy!, localizedReason: kMsgShowReason, reply: { (success, evaluateError) in
            
            
            if success {
                _sucessResult!(success)
      
            } else {
               // error(evaluateError! as! (Error) -> ())
                _errorResult!(evaluateError!)
             
                guard let error = evaluateError else {
                    
                    return
                }
                
                _errorMessage!(self.evaluateAuthenticationPolicyMessageForLA(errorCode: error._code))
                
                //TODO: If you have choosen the 'Fallback authentication mechanism selected' (LAError.userFallback). Handle gracefully
                
            }
        })
    }
   private func evaluatePolicyFailErrorMessageForLA(errorCode: Int) -> String {
        var message = ""
        if #available(iOS 11.0, macOS 10.13, *) {
            switch errorCode {
            case LAError.biometryNotAvailable.rawValue:
                message = "Authentication could not start because the device does not support biometric authentication."
                
            case LAError.biometryLockout.rawValue:
                message = "Authentication could not continue because the user has been locked out of biometric authentication, due to failing authentication too many times."
                
            case LAError.biometryNotEnrolled.rawValue:
                message = "Authentication could not start because the user has not enrolled in biometric authentication."
                
            default:
                message = "Did not find error code on LAError object"
            }
        } else {
            switch errorCode {
            case LAError.touchIDLockout.rawValue:
                message = "Too many failed attempts."
                
            case LAError.touchIDNotAvailable.rawValue:
                message = "TouchID is not available on the device"
                
            case LAError.touchIDNotEnrolled.rawValue:
                message = "TouchID is not enrolled on the device"
                
            default:
                message = "Did not find error code on LAError object"
            }
        }
        
        return message;
    }
   private func evaluateAuthenticationPolicyMessageForLA(errorCode: Int) -> String {
        
        var message = ""
        
        switch errorCode {
            
        case LAError.authenticationFailed.rawValue:
            message = "The user failed to provide valid credentials"
            
        case LAError.appCancel.rawValue:
            message = "Authentication was cancelled by application"
            
        case LAError.invalidContext.rawValue:
            message = "The context is invalid"
            
        case LAError.notInteractive.rawValue:
            message = "Not interactive"
            
        case LAError.passcodeNotSet.rawValue:
            message = "Passcode is not set on the device"
            
        case LAError.systemCancel.rawValue:
            message = "Authentication was cancelled by the system"
            
        case LAError.userCancel.rawValue:
            message = "The user did cancel"
            
        case LAError.userFallback.rawValue:
            message = "The user chose to use the fallback"
            
        default:
            message = evaluatePolicyFailErrorMessageForLA(errorCode: errorCode)
        }
        
        return message
    }
}
extension AuthenticationTouchID where Self: BaseTableViewController {
    func authenticationWithTouchID() {
     let authenticationVC = otherStoryboard.instantiateViewController(withIdentifier: "AuthenticationViewController") as! AuthenticationViewController
        authenticationVC.delegate = self
        self.present(authenticationVC, animated: true, completion: nil)
        
    }
}
extension AuthenticationTouchID where Self: BaseViewController {
    func authenticationWithTouchID() {
        let authenticationVC = otherStoryboard.instantiateViewController(withIdentifier: "AuthenticationViewController") as! AuthenticationViewController
        authenticationVC.delegate = self
        self.present(authenticationVC, animated: true, completion: nil)
        
    }
}




