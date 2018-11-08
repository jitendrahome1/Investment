//
//  JAEditableTextView.swift
//  Investment
//
//  Created by Jitendra Kumar Agarwal on 05/11/18.
//  Copyright © 2018 Jitendra Kumar Agarwal. All rights reserved.
//

import Foundation
import  UIKit

class JAEditableTextView : UITextView, UITextViewDelegate {
    
    override func awakeFromNib() {
        self.delegate = self
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
//        self.setAccessoryView()
    }
    
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    
    
}
extension JAEditableTextView {
    
    @objc func adjustForKeyboard(notification: Notification) {
        let view = self.superview
        let userInfo = notification.userInfo!
        let keyboardScreenEndFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let keyboardViewEndFrame = view!.convert(keyboardScreenEndFrame, from: view!.window)
        
        if notification.name == UIResponder.keyboardWillHideNotification {
            self.contentInset = UIEdgeInsets.zero
        } else {
            self.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height, right: 0)
        }
        self.scrollIndicatorInsets = self.contentInset
        let selectedRange = self.selectedRange
        self.scrollRangeToVisible(selectedRange)
    }

    
}

// UITextView Delagte
extension JAEditableTextView {
    func textViewDidBeginEditing(_ textView: UITextView) {
    }
    
    func textViewDidEndEditing(_ textField: UITextView) {
    }
    func textViewDidChange(_ textView: UITextView) {
    }
}



