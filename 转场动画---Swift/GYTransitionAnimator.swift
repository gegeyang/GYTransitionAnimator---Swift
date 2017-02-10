//
//  GYTransitionAnimator.swift
//  转场动画---Swift
//
//  Created by GeYang on 2017/2/9.
//  Copyright © 2017年 GeYang. All rights reserved.
//

import UIKit

class GYTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    public var duration : TimeInterval?;
    var isPresent : Bool?;
    var currentFrame : CGRect?;
    var fromView : UIView?
    var toView : UIView?
    var containerView : UIView?
    
//    override init() {
//        super.init();
//    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration!;
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        fromView = transitionContext.view(forKey: .from);
        toView = transitionContext.view(forKey: .to);
        containerView = transitionContext.containerView;
        fromView = transitionContext.view(forKey: .from);
        toView = transitionContext.view(forKey: .to);
        containerView?.addSubview(toView!);
        self.animte(transitionContext: transitionContext);
    }
    
    func animte(transitionContext : UIViewControllerContextTransitioning){
        fromView?.alpha = 1.0;
        toView?.alpha = 0.0;
        UIView.animate(withDuration: duration!, animations: {
            self.fromView?.alpha = 0.0;
            self.toView?.alpha = 1.0;
        }) { (Bool) in
            self.fromView?.alpha = 1.0;
            let isCancelled = transitionContext.transitionWasCancelled;
            transitionContext.completeTransition(!isCancelled);
        };
    }
 
}
