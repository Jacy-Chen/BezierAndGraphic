//
//  ViewController.swift
//  BezierAndGraphic
//
//  Created by Zexi Chen on 7/18/16.
//  Copyright © 2016 Jacy Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

// MARK: - ViewContrller 生命周期
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //－－－－Shage layer 测试
        
        //CAshapelayer 矩形区域
//        let layer = CAShapeLayer()
//        layer.frame = CGRectMake(110, 100, 150, 100)
//        layer.backgroundColor = UIColor.blackColor().CGColor
//        view.layer.addSublayer(layer)

        
        
        //Bezeir Path for CAShapeLayer
//        let path = UIBezierPath(rect: CGRect(x: 110,y: 100,width: 150,height: 100))
//        let layer = CAShapeLayer()
//        layer.path = path.CGPath
//        layer.fillColor = UIColor.clearColor().CGColor
//        layer.strokeColor = UIColor.blackColor().CGColor
//        view.layer.addSublayer(layer)
        
        
        
        //Bezeir Path for round corner
//        let path = UIBezierPath(roundedRect: CGRectMake(110, 100, 150, 100), cornerRadius: 50)
//        let layer = CAShapeLayer()
//        layer.path = path.CGPath
//        layer.fillColor = UIColor.clearColor().CGColor
//        layer.strokeColor = UIColor.blackColor().CGColor
//        view.layer.addSublayer(layer)

        
        
        //draw the circle from starting angle radius
//        let radius: CGFloat = 60.0
//        let startAngle: CGFloat = 0.0
//        let endAngle: CGFloat = CGFloat(M_PI * 2)
//        let path = UIBezierPath(arcCenter: view.center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
//        let layer = CAShapeLayer()
//        layer.path = path.CGPath
//        layer.fillColor = UIColor.clearColor().CGColor
//        layer.strokeColor = UIColor.blackColor().CGColor
//        view.layer.addSublayer(layer)
        
        
//        drawCurvLine()
//        animation3()
        drawMagicLayer()
        
    }
    
// MARK: - 画不规则Layer
    func drawMagicLayer() -> () {
        let finalSize = CGSizeMake(CGRectGetWidth(view.frame), 400)
        let layerHeight = finalSize.height * 0.2
        let layer = CAShapeLayer()
        let bezier = UIBezierPath()
        bezier.moveToPoint(CGPointMake(0, finalSize.height - layerHeight))
        bezier.addLineToPoint(CGPointMake(0, finalSize.height - 1))
        bezier.addLineToPoint(CGPointMake(finalSize.width, finalSize.height - 1))
        bezier.addLineToPoint(CGPointMake(finalSize.width, finalSize.height - layerHeight))
        bezier.addQuadCurveToPoint(CGPointMake(0,finalSize.height - layerHeight),
                                   controlPoint: CGPointMake(finalSize.width / 2, (finalSize.height - layerHeight) - 40))
        layer.path = bezier.CGPath
        layer.fillColor = UIColor.blackColor().CGColor
        view.layer.addSublayer(layer)
    }
    
    
    
    
    
// MARK: - 画Bezier曲线
    func drawCurvLine() -> () {
        let startPoint = CGPointMake(50, 300)
        let endPoint = CGPointMake(300, 300)
        let controlPoint = CGPointMake(170, 200)
        
        
        let Layer1 = CALayer()
        Layer1.frame = CGRectMake(startPoint.x, startPoint.y, 5, 5)
        Layer1.backgroundColor = UIColor.redColor().CGColor
        
        let layer2 = CALayer()
        layer2.frame = CGRectMake(endPoint.x, endPoint.y, 5, 5)
        layer2.backgroundColor = UIColor.redColor().CGColor
        
        let layer3 = CALayer()
        layer3.frame = CGRectMake(controlPoint.x, controlPoint.y, 5, 5)
        layer3.backgroundColor = UIColor.redColor().CGColor
        
        
        let path = UIBezierPath()
        let layer = CAShapeLayer()
        
        path.moveToPoint(startPoint)
        path.addQuadCurveToPoint(endPoint, controlPoint: controlPoint)
        
        layer.path = path.CGPath
        layer.fillColor = UIColor.clearColor().CGColor
        layer.strokeColor = UIColor.blackColor().CGColor
        
        view.layer.addSublayer(layer)
        view.layer.addSublayer(layer3)
        view.layer.addSublayer(layer2)
        view.layer.addSublayer(Layer1)
        
    }
    
    
// MARK: - 画Bezier曲线，并根据CALayer的属性添加动画
    private func animation1() -> () {
        let startPoint = CGPointMake(50, 300)
        let endPoint = CGPointMake(300, 300)
        let controlPoint = CGPointMake(170, 200)
        
        let path = UIBezierPath()
        let layer = CAShapeLayer()
        
        path.moveToPoint(startPoint)
        path.addQuadCurveToPoint(endPoint, controlPoint: controlPoint)
        
        layer.path = path.CGPath
        layer.fillColor = UIColor.clearColor().CGColor
        layer.strokeColor = UIColor.blackColor().CGColor
        
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.fromValue = 0
        animation.duration = 2
        layer.addAnimation(animation, forKey: "")
        view.layer.addSublayer(layer)
    }
    
    func animation2() -> () {
        let startPoint = CGPointMake(50, 300)
        let endPoint = CGPointMake(300, 300)
        let controlPoint = CGPointMake(170, 200)
        
        let path = UIBezierPath()
        let layer = CAShapeLayer()
        
        path.moveToPoint(startPoint)
        path.addQuadCurveToPoint(endPoint, controlPoint: controlPoint)
        
        layer.path = path.CGPath
        layer.fillColor = UIColor.clearColor().CGColor
        layer.strokeColor = UIColor.blackColor().CGColor
        
        layer.strokeStart = 0
        layer.strokeEnd = 1
        
        //animation的种类有好几种:
        //主要是CALayer的特性
        let animation = CABasicAnimation(keyPath: "strokeStart")
        animation.fromValue = 0.5
        animation.toValue = 0
        animation.duration = 2
        
        let animation2 = CABasicAnimation(keyPath: "strokeEnd")
        animation2.fromValue = 0.5
        animation2.toValue = 1
        animation2.duration = 2
        
        layer.addAnimation(animation, forKey: "")
        layer.addAnimation(animation2, forKey: "")
        view.layer.addSublayer(layer)
        
    }
    
    func animation3() -> () {
        
        let startPoint = CGPointMake(50, 300)
        let endPoint = CGPointMake(300, 300)
        let controlPoint = CGPointMake(170, 200)
        
        let path = UIBezierPath()
        let layer = CAShapeLayer()
        
        path.moveToPoint(startPoint)
        path.addQuadCurveToPoint(endPoint, controlPoint: controlPoint)
        
        layer.path = path.CGPath
        layer.fillColor = UIColor.clearColor().CGColor
        layer.strokeColor = UIColor.blackColor().CGColor
        
        let animation = CABasicAnimation(keyPath: "lineWidth")
        animation.fromValue = 1
        animation.toValue = 10
        animation.duration = 2
        
        layer.addAnimation(animation, forKey: "")
        view.layer.addSublayer(layer)
    }
    
    
    
    
// MARK: - 系统函数
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

