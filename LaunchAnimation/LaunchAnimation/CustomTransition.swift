//
//  CustomTransition.swift
//  LaunchAnimation
//
//  Created by ShawnDu on 15/10/16.
//  Copyright © 2015年 Beijing Smarter Eye Technology Co., Ltd. All rights reserved.
//

import Foundation
import UIKit

class CustomTransition: NSObject, UINavigationControllerDelegate {
    var navigationVC : UINavigationController?
    var popTransition : UIPercentDrivenInteractiveTransition?
    
    init (vc: UIViewController) {
        super.init()
        navigationVC = vc as? UINavigationController
        navigationVC!.delegate = self
    }
    
}
