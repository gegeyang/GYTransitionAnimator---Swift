//
//  GYViewController.swift
//  转场动画---Swift
//
//  Created by GeYang on 2017/2/9.
//  Copyright © 2017年 GeYang. All rights reserved.
//

import UIKit


class GYViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    let array = ["渐变", "缩放", "层次", "圆形扩散"];

    override func viewDidLoad() {
        super.viewDidLoad()
        let tabelview = UITableView.init(frame: CGRect(x : 0, y : 0, width : WIDTH, height : HEIGHT));
        tabelview.delegate = self;
        tabelview.dataSource = self;
        self.view.addSubview(tabelview);
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: .default, reuseIdentifier: "cell");
        cell.textLabel?.text = array[indexPath.row];
        cell.accessoryType = .disclosureIndicator;
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true);
        let first = FirstViewController();
        first.style = NSString.init(format: "%d", indexPath.row + 1);
        self.navigationController?.pushViewController(first, animated: true);
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
