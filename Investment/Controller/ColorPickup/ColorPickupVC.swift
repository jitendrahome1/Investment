//
//  ColorPickupVC.swift
//  Investment
//
//  Created by Jitendra Kumar Agarwal on 07/11/18.
//  Copyright © 2018 Jitendra Kumar Agarwal. All rights reserved.
//

import UIKit

class ColorPickupVC: UIViewController,ColorWheelDelegate {

    @IBOutlet weak var viewBG: UIView!
    @IBOutlet weak var viewColorWheel: ColorWheel!
    typealias pickupColor  = ((_ color: UIColor)->())?
    fileprivate var handlerPickupColor:pickupColor
    fileprivate var didRemove:(() -> ())?
    override func viewDidLoad() {
        super.viewDidLoad()
        viewColorWheel.delegate = self
        
    }

    internal class func showColorPopUp(_ sourceViewController: UIViewController, pickupColor:pickupColor) {
      let  colorPickupVC =   UIStoryboard(storyboard: .others).instantiateViewController(withIdentifier: "\(ColorPickupVC.self)") as? ColorPickupVC
        colorPickupVC!.handlerPickupColor =  pickupColor
        colorPickupVC!.presentAddOrClearPopUpWith(sourceViewController)
    }

}

extension ColorPickupVC {
    func presentAddOrClearPopUpWith(_ sourceController: UIViewController) {
        self.view.frame = sourceController.view.bounds
         sourceController.view.endEditing(true)
        sourceController.view.addSubview(self.view)
        sourceController.addChild(self)
        sourceController.view.bringSubviewToFront(self.view)
        presentAnimationToView()
    }
    func presentAnimationToView() {
        viewBG.alpha = 0.0
        self.viewColorWheel.transform = CGAffineTransform(translationX: 0, y: SCREEN_HEIGHT)
        UIView.animate(withDuration: 0.25, animations: {
            self.viewBG.alpha = 0.5
            self.viewColorWheel.transform = CGAffineTransform.identity
        })
    }
    func dismissAnimate() {
        
        if didRemove != nil {
            didRemove!()
        }
        
        UIView.animate(withDuration: 0.25, animations: {
            self.viewBG.alpha = 0.0
            self.viewColorWheel.transform = CGAffineTransform(translationX: 0, y: SCREEN_HEIGHT)
        }, completion: { (true) in
            self.view.removeFromSuperview();
            self.removeFromParent()
        })
    }

}
extension ColorPickupVC {
    func didSelect(color: UIColor) {
       // view.backgroundColor = color
        dismissAnimate()
        handlerPickupColor!(color)
    }
}

