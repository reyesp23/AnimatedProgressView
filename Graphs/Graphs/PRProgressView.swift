//
//  PRProgressView.swift
//  Graphs
//
//  Created by Patricio on 06/03/20.
//  Copyright © 2020 patricioreyes. All rights reserved.
//

import UIKit

class PRProgressView: UIView {
    
    public var innerDiameter: CGFloat = 170
    public var strokeColor: UIColor = UIColor(red:0.24, green:0.87, blue:0.59, alpha:1.0)
    public var baseColor: UIColor = UIColor.black.withAlphaComponent(0.05)
    public var originPosition: PRProgressViewOriginPosition = .top
    
    private var current: CGFloat = 0
    private var baseShape = CAShapeLayer()
    private var progressShape = CAShapeLayer()

    override func draw(_ rect: CGRect) {
        let radius = self.bounds.size.width/2
        baseShape.bounds = self.bounds
        baseShape.path = UIBezierPath(arcCenter: CGPoint(x: radius, y: radius), radius: radius, startAngle: originPosition.startAngle, endAngle: originPosition.endAngle, clockwise: true).cgPath
        baseShape.position = CGPoint(x: radius, y: radius)
        baseShape.strokeColor = baseColor.cgColor
        baseShape.lineWidth = (self.bounds.size.width - innerDiameter)/2
        baseShape.fillColor = UIColor.clear.cgColor
        self.layer.addSublayer(baseShape)
        
        progressShape.bounds = self.bounds
        progressShape.path = baseShape.path
        progressShape.position = baseShape.position
        progressShape.lineWidth = baseShape.lineWidth
        progressShape.fillColor = UIColor.clear.cgColor
        progressShape.lineCap = .round
        progressShape.strokeColor = strokeColor.cgColor
        progressShape.strokeEnd = current/100
        self.layer.addSublayer(progressShape)
    }
    
    public func setProgress(value: CGFloat){
        progressShape.strokeColor = strokeColor.cgColor
        progressShape.strokeEnd =  value/100
        current = value
    }
    
    public func animate(to value: CGFloat, duration: CFTimeInterval = 1.3){
        progressShape.strokeColor = strokeColor.cgColor
        progressShape.strokeEnd =  value/100
        let strokeAnimation = CABasicAnimation(keyPath: "strokeEnd")
        strokeAnimation.fromValue = CGFloat(current/100)
        strokeAnimation.toValue =  progressShape.strokeEnd
        strokeAnimation.duration = duration
        strokeAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        progressShape.add(strokeAnimation, forKey: nil)
        current = value
    }
    
    public enum PRProgressViewOriginPosition {
        case top, bottom, left, right
        
        var startAngle : CGFloat{
            switch self{
            case .top: return 3 * (CGFloat.pi/2)
            case .right: return 0
            case .bottom: return CGFloat.pi/2
            case .left: return CGFloat.pi
            }
        }
        var endAngle : CGFloat{
            return startAngle + 2 * CGFloat.pi
        }
    }
}

