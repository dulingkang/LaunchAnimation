//
//  CustomNavigationVC.swift
//  LaunchAnimation
//
//  Created by ShawnDu on 15/10/17.
//  Copyright © 2015年 Beijing Smarter Eye Technology Co., Ltd. All rights reserved.
//

import Foundation
import UIKit

class CustomNavigationVC: UINavigationController, UIGestureRecognizerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let gesture = self.interactivePopGestureRecognizer
//        gesture!.enabled = false
//        let gestureView = gesture!.view
//        
//        let panGesture = UIPanGestureRecognizer.init()
//        panGesture.delegate = self
//        panGesture.maximumNumberOfTouches = 1
//        gestureView!.addGestureRecognizer(panGesture)
//        
        let customNavigationTransition = CustomTransition.init(vc: self)
//        panGesture.addTarget(customNavigationTransition, action: "hand")
    }
    
    func gestureRecognizerShouldBegin(gestureRecognizer: UIGestureRecognizer) -> Bool {
        return self.viewControllers.count != 1 && !self.valueForKey("_isTransitioning")!.boolValue
    }
}