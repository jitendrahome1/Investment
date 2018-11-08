//
//  InvestmentDetailsVC.swift
//  Investment
//
//  Created by Jitendra Kumar Agarwal on 05/11/18.
//  Copyright © 2018 Jitendra Kumar Agarwal. All rights reserved.
//

import UIKit
import EzPopup
class InvestmentDetailsVC: BaseViewController, AuthenticationTouchID,EditableAccessoryDelegate {
    
    @IBOutlet weak var textViewEdit: JAEditableTextView!
    let editableAccessory = EditableAccessoryView()
    var _title: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        build()
        
        // textViewArea.setContentOffset(.zero, animated: true)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        editableAccessory.delegate = self
        
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
            //self.authenticationWithTouchID()
            self.setAccessoryView()
        }
        
    }
    func setAccessoryView() {
        guard let accessoryView: EditableAccessoryView  =  UIView.fromNib() else {
            return
            
        }
        accessoryView.delegate = self
        self.textViewEdit.inputAccessoryView = accessoryView
        
    }
    
}
// AuthenticationTouchID Delegate
extension InvestmentDetailsVC {
    func didAuthenticationScucces(succes: Bool) {
        
    }
    
    
}
// EditableAccessoryDelegate
extension InvestmentDetailsVC {
    func didTapSelectColorAction() {
          self.textViewEdit.resignFirstResponder
        ColorPickupVC.showColorPopUp(self) { (color) in
            if let _ = self.textViewEdit.text {
                let attributedText = self.textViewEdit.attributedText
                self.textViewEdit.textColor = color
                self.textViewEdit.attributedText = attributedText
            }
        }
       
    }
    
    
}

