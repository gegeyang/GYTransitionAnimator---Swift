//
//  SecondViewController.swift
//  转场动画---Swift
//
//  Created by GeYang on 2017/2/9.
//  Copyright © 2017年 GeYang. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let imageview = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: WIDTH, height: HEIGHT));
        imageview.image = UIImage.init(named: "header.jpg");
        self.view.addSubview(imageview);
        imageview.isUserInteractionEnabled = true;
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(dis));
        imageview.addGestureRecognizer(tap);
    }

    func dis() -> Void{
        self .dismiss(animated: true, completion: nil);
    }

}
