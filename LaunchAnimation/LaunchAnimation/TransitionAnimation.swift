
//
//  TransitionAnimation.swift
//  LaunchAnimation
//
//  Created by ShawnDu on 15/10/17.
//  Copyright © 2015年 Beijing Smarter Eye Technology Co., Ltd. All rights reserved.
//

import Foundation
import UIKit

class TransitionAnimation : NSObject, UIViewControllerAnimatedTransitioning {
    var transitionCtx : UIViewControllerContextTransitioning!
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 1.7
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        self.transitionCtx = transitionContext
        let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        let containerView = transitionContext.containerView()
        
        containerView!.insertSubview(toVC!.view, belowSubview: fromVC!.view)
        
        let duration = self.transitionDuration(transitionContext)
        
        UIView.animateWithDuration(duration, animations:{
            fromVC!.view.frame = CGRectMake(Constant.screenWidth, 0, Constant.screenWidth, Constant.screenHeight)
            }){
                finished in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        }
    }
    
    func animationEnded(transitionCompleted: Bool) {
        self.transitionCtx!.completeTransition(!self.transitionCtx!.transitionWasCancelled())
        self.transitionCtx!.viewControllerForKey(UITransitionContextFromViewControllerKey)!.view = nil
    }
    
    
}