//
//  ViewController.swift
//  LoadingAnimationDemo
//
//  Created by f077616 on 2018/10/3.
//  Copyright © 2018年 f077616. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let animationView = LoadingView(frame: CGRect(x: 0, y: 50, width: 150, height: 150))
        animationView.center = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height/2)
        self.view.addSubview(animationView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

