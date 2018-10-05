//
//  LoadingView.swift
//  LoadingAnimationDemo
//
//  Created by f077616 on 2018/10/3.
//  Copyright © 2018年 f077616. All rights reserved.
//

import UIKit

class LoadingView: UIView {
    
    var dotGroup:[CAShapeLayer] = []
    let dotCount = 5
    let lineWidth = 10
    let animationDuration = 0.8
    
    override init(frame: CGRect) {
     super.init(frame: frame)
        self.backgroundColor = UIColor.black
        setView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setView() {
        //設定 圓點的 色彩/位置 排序
        for i in 0 ..< dotCount {
            let dotLayer = CAShapeLayer()
            dotLayer.bounds = CGRect(x: 0, y: 0, width: lineWidth, height: lineWidth)
            dotLayer.path = UIBezierPath(ovalIn: dotLayer.bounds).cgPath
            dotLayer.position = CGPoint(x: CGFloat(i) * bounds.width / CGFloat(dotCount - 1), y: bounds.height / 2.0)
            dotLayer.fillColor = UIColor.white.cgColor
            dotLayer.strokeColor = UIColor.white.cgColor
            
            layer.addSublayer(dotLayer)
            dotGroup.append(dotLayer)
        }
        
        // 最左側 第一點 的動畫
        let dotLayer1 = dotGroup[0]
        let pathAnimation = CAKeyframeAnimation(keyPath: "position")
        pathAnimation.path = UIBezierPath(arcCenter: CGPoint(x: bounds.width / 2.0, y: bounds.height / 2.0), radius: bounds.width / 2.0, startAngle: CGFloat(Double.pi), endAngle: 0, clockwise: true).cgPath
        pathAnimation.calculationMode = kCAAnimationPaced
        pathAnimation.duration        = animationDuration
        pathAnimation.repeatCount     = Float.infinity
        dotLayer1.add(pathAnimation, forKey: "pathAnimation")
        
        // 整排點的移動
        for i in 1 ..< dotCount {
            let dotLayer = dotGroup[i]
            let positionAnimation = CABasicAnimation(keyPath: "position.x")
            positionAnimation.toValue     = dotLayer.position.x - bounds.width / CGFloat(dotCount - 1)
            positionAnimation.duration    = animationDuration
            positionAnimation.repeatCount = Float.infinity
            dotLayer.add(positionAnimation, forKey: "positionAnimation")
        }
    }
    
    
}
