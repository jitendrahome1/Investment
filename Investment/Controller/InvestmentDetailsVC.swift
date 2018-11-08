//
//  InvestmentDetailsVC.swift
//  Investment
//
//  Created by Jitendra Kumar Agarwal on 05/11/18.
//  Copyright © 2018 Jitendra Kumar Agarwal. All rights reserved.
//

import UIKit
import WOWMarkSlider
class InvestmentDetailsVC: BaseViewController, AuthenticationTouchID,EditableAccessoryDelegate,WOWMarkSliderDelegate {
    
    @IBOutlet weak var aSlider: WOWMarkSlider!
    @IBOutlet weak var textViewEdit: JAEditableTextView!
    fileprivate var arrBarButton:[UIImage] = [#imageLiteral(resourceName: "more")]
    fileprivate var _accessoryView:  EditableAccessoryView!
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
        self.addBarButton(items: self.arrBarButton)
        self.aSlider.delegate = self
        self.aSlider.alpha = 0.0
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
        self._accessoryView = accessoryView
        accessoryView.delegate = self
        self.textViewEdit.inputAccessoryView = accessoryView
        
    }
    
    
    fileprivate func addBarButton(items:[UIImage]) {

        self.addRightBarButton(images: items) { (index) in
            if index == 1{
                self._accessoryView.showAccessoryView()
            }
            
        }
    
    
    
    }
    
}
// AuthenticationTouchID Delegate
extension InvestmentDetailsVC {
    func didAuthenticationScucces(succes: Bool) {}
    
    
}
// EditableAccessoryDelegate
extension InvestmentDetailsVC {
    func didTapSelectColorAction() {
        view.endEditing(true)
        self.aSlider.alpha = 0.0
        ColorPickupVC.showColorPopUp(self) { (color) in
            if let _ = self.textViewEdit.text {
                let attributedText = self.textViewEdit.attributedText
                self.textViewEdit.textColor = color
                self.textViewEdit.attributedText = attributedText
            }
        }
        
    }
    func didTapFontSelectionAction() {
        self.aSlider.alpha =  1.0
        view.endEditing(true)
   
    }
    func didTapCancleAction() {
     _accessoryView.hideAccessoryView()
        if !(self.arrBarButton.contains(#imageLiteral(resourceName: "Done"))) {
            self.arrBarButton.append(#imageLiteral(resourceName: "Done"))
            self.addBarButton(items: self.arrBarButton)
        }

    }
}
// JASlider Delagte
extension InvestmentDetailsVC {
    func startDragging(slider: WOWMarkSlider) {
      
    }
    
    func endDragging(slider: WOWMarkSlider) {
         self.textViewEdit.font = UIFont(name: self.textViewEdit.font!.fontName, size: CGFloat(slider.value))
    }
    
    func markSlider(slider: WOWMarkSlider, dragged to: Float) {
        
    }
}


