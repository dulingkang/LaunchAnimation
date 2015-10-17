//
//  ViewController.swift
//  LaunchAnimation
//
//  Created by ShawnDu on 15/10/13.
//  Copyright © 2015年 Beijing Smarter Eye Technology Co., Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.grayColor()
    }
    
    @IBAction func rightButtonPressed(sender: UIButton) {
        let secondVC = SecondViewController.init()
        self.navigationController!.pushViewController(secondVC, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

