//
//  FirstViewController.swift
//  转场动画---Swift
//
//  Created by GeYang on 2017/2/9.
//  Copyright © 2017年 GeYang. All rights reserved.
//

import UIKit

let WIDTH = UIScreen.main.bounds.size.width;
let HEIGHT = UIScreen.main.bounds.size.height;

class FirstViewController: UIViewController, UIViewControllerTransitioningDelegate {
    var curim : UIView?
    var style : NSString?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white;
        for i in 0...4 {
            var rect : CGRect?;
            if i == 0 {
                rect = CGRect(x : 0, y : 64, width : 100, height : 150);
            }else if i == 1{
                rect = CGRect(x : WIDTH - 100, y : 64, width : 100, height : 150);
            }else if i == 2{
                rect = CGRect(x : 0, y : HEIGHT - 150, width : 100, height : 150);
            }else if i == 3{
                rect = CGRect(x :WIDTH - 100, y : HEIGHT - 150, width : 100, height : 150);
            }else{
                rect = CGRect(x :WIDTH / 2 - 50, y : HEIGHT  / 2  - 75 + 32, width : 100, height : 150);
            }
            let imview = UIImageView.init(frame: rect!);
            imview.image = UIImage.init(named: "header.jpg");
            imview.isUserInteractionEnabled = true;
            self.view.addSubview(imview);
            let tap = UITapGestureRecognizer.init(target: self, action: #selector(jump(gue:)));
            imview.addGestureRecognizer(tap);
        }
    }
    
    func jump(gue : UIGestureRecognizer) -> Void{
        curim = gue.view;
        let second = SecondViewController();
        second.transitioningDelegate = self;
        self.navigationController?.present(second, animated: true, completion: nil);
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if (style?.isEqual(to: "1"))!{
            return self.isPresentToController1(present: true);
        }else if (style?.isEqual(to: "2"))!{
            return self.isPresentToController2(present: true);
        }else if (style?.isEqual(to: "3"))!{
            return self.isPresentToController3(present: true);
        }else{
            return self.isPresentToController4(present: true);
        }
        
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if (style?.isEqual(to: "1"))!{
            return self.isPresentToController1(present: false);
        }else if (style?.isEqual(to: "2"))!{
            return self.isPresentToController2(present: false);
        }else if (style?.isEqual(to: "3"))!{
            return self.isPresentToController3(present: false);
        }else{
            return self.isPresentToController4(present: false);
        }
    }
    
    //渐变
    func isPresentToController1(present : Bool) -> GYTransitionAnimator {
        let animator = GYTransitionAnimator.init()
        animator.duration = 0.5;
        animator.isPresent = present;
        return animator;
    }
    
    //缩放
    func isPresentToController2(present : Bool) -> GYTransitionAnimatorScale {
        let animator = GYTransitionAnimatorScale.init()
        animator.duration = 0.5;
        animator.isPresent = present;
        animator.currentFrame = curim?.frame;
        return animator;
    }
    
    //层次
    func isPresentToController3(present : Bool) -> GYTransitionAnimatorLevels {
        let animator = GYTransitionAnimatorLevels.init()
        animator.duration = 0.5;
        animator.isPresent = present;
        animator.currentFrame = curim?.frame;
        return animator;
    }
    
    //扩散
    func isPresentToController4(present : Bool) -> GYTransitionAnimatorArc {
        let animator = GYTransitionAnimatorArc.init()
        animator.duration = 0.5;
        animator.isPresent = present;
        animator.currentFrame = curim?.frame;
        return animator;
    }
    
    
    
    
    
    
    
    
    
    
    
    
    

}











