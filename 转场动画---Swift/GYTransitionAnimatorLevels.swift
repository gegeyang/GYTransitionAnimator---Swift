//
//  GYTransitionAnimatorLevels.swift
//  转场动画---Swift
//
//  Created by GeYang on 2017/2/10.
//  Copyright © 2017年 GeYang. All rights reserved.
//

import UIKit

class GYTransitionAnimatorLevels: GYTransitionAnimator {
    override func animte(transitionContext: UIViewControllerContextTransitioning) {
        if isPresent! {
            toView?.frame = CGRect.init(x: 0, y: HEIGHT, width: WIDTH, height: HEIGHT);
            UIView.animate(withDuration: 0.2, animations: {
                self.fromView?.transform = CGAffineTransform.init(scaleX: 0.95, y: 0.95);
            }, completion: { (Bool) in
                UIView.animate(withDuration: self.duration!, animations: {
                    self.toView?.frame = CGRect.init(x: 0, y: 0, width: WIDTH, height: HEIGHT);
                }, completion: { (Bool) in
                    self.fromView?.transform = CGAffineTransform.identity;
                    transitionContext.completeTransition(!transitionContext.transitionWasCancelled);
                });
            })
        }else{
            containerView?.addSubview(fromView!);
            toView?.transform = CGAffineTransform.init(scaleX: 0.95, y: 0.95);
            fromView?.frame = CGRect.init(x: 0, y: 0, width: WIDTH, height: HEIGHT);
            UIView.animate(withDuration: duration!, animations: {
                self.fromView?.frame = CGRect.init(x: 0, y: HEIGHT, width: WIDTH, height: HEIGHT);
            }, completion: { (Bool) in
                UIView.animate(withDuration: self.duration!, animations: {
                    self.toView?.transform = CGAffineTransform.identity;
                }, completion: { (Bool) in
                    transitionContext.completeTransition(!transitionContext.transitionWasCancelled);
                });
            });
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
