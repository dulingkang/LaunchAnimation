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
    var navigationVC : UINavigationController!
    var popTransition : UIPercentDrivenInteractiveTransition!
    
    init (vc: UIViewController) {
        super.init()
        self.navigationVC = vc as! UINavigationController
        self.navigationVC!.delegate = self
    }
    
    func handleControllerPop (recognizer : UIPanGestureRecognizer) {
        var progress = recognizer.translationInView(recognizer.view).x / Constant.screenWidth
        progress = min(1.0, max(0.0, progress))
        if (recognizer.state == UIGestureRecognizerState.Began) {
            popTransition = UIPercentDrivenInteractiveTransition.init()
            navigationVC!.popViewControllerAnimated(true)
        } else if (recognizer.state == UIGestureRecognizerState.Changed) {
            popTransition!.updateInteractiveTransition(progress)
        } else if (recognizer.state == UIGestureRecognizerState.Ended || recognizer.state == UIGestureRecognizerState.Cancelled) {
            if (progress > 0.5) {
                popTransition!.finishInteractiveTransition()
            } else {
                popTransition!.cancelInteractiveTransition()
            }
            popTransition = nil
        }
    }
    
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if (operation == UINavigationControllerOperation.Pop) {
            let transitionAnimation = TransitionAnimation.init()
            return transitionAnimation
        } else {
            return nil
        }
    }
    
    func navigationController(navigationController: UINavigationController, interactionControllerForAnimationController animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        if (animationController.isKindOfClass(TransitionAnimation)) {
            return popTransition
        } else {
            return nil
        }
    }

    
}
