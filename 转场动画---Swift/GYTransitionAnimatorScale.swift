//
//  GYTransitionAnimatorScale.swift
//  转场动画---Swift
//
//  Created by GeYang on 2017/2/10.
//  Copyright © 2017年 GeYang. All rights reserved.
//

import UIKit

class GYTransitionAnimatorScale: GYTransitionAnimator {

    
    override func animte(transitionContext: UIViewControllerContextTransitioning) {
        let pictureView = isPresent! ? toView : fromView;
        containerView?.bringSubview(toFront: pictureView!);
        let scaleX = (currentFrame?.size.width)! / (pictureView?.frame.size.width)!;
        let scaleY = (currentFrame?.size.height)! / (pictureView?.frame.size.height)!;
        let currentCenter = CGPoint.init(x: (currentFrame?.size.width)! / 2 + (currentFrame?.origin.x)!, y: (currentFrame?.size.height)! / 2 + (currentFrame?.origin.y)!);
        let pictureCenter = CGPoint.init(x: (pictureView?.frame.size.width)! / 2 + (pictureView?.frame.origin.x)!, y: (pictureView?.frame.size.height)! / 2 + (pictureView?.frame.origin.y)!);
        
        var startTransform : CGAffineTransform?;
        var startCenter : CGPoint?;
        var endTransform : CGAffineTransform?;
        var endCenter : CGPoint?;
        
        if isPresent! {
            startTransform = CGAffineTransform.init(scaleX: scaleX, y: scaleY);
            startCenter = currentCenter;
            endTransform = CGAffineTransform.identity;
            endCenter = pictureCenter;
        }else{
            startTransform = CGAffineTransform.identity;
            startCenter = pictureCenter;
            endTransform = CGAffineTransform.init(scaleX: scaleX, y: scaleY);
            endCenter = currentCenter;
        }
        
        pictureView?.transform = startTransform!;
        pictureView?.center = startCenter!;
        UIView.animate(withDuration: duration!, animations: {
            pictureView?.transform = endTransform!;
            pictureView?.center = endCenter!;
        }) { (Bool) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled);
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
