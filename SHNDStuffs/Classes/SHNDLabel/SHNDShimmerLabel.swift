//
//  SHNDShimmerLabel.swift
//  SHNDStuffs
//
//  Created by Sahand Raeisi on 1/5/19.
//

import UIKit

fileprivate protocol ShimmerAnimation {
    func animate() -> Void
}

public protocol ShimmerBuilder {
    var text:String { get }
    var font:UIFont { get }
    var textAlignment:NSTextAlignment { get }
    var frame:CGRect { get }
    var parentView:UIView { get }
    var animationDuration:CFTimeInterval { get }
    var mainLabelTextColor:UIColor { get }
    var maskLabelTextColor:UIColor { get }
}

public struct ShimmerObject: ShimmerBuilder {
    public var text: String
    public var font: UIFont
    public var textAlignment: NSTextAlignment
    public var animationDuration: CFTimeInterval
    public var frame: CGRect
    public var parentView: UIView
    public var mainLabelTextColor: UIColor
    public var maskLabelTextColor: UIColor
    
    public init(text:String,
         font:UIFont,
         textAlignment:NSTextAlignment,
         animationDuration:CFTimeInterval,
         frame:CGRect,
         parentView:UIView,
         mainLabelTextColor:UIColor,
         maskLabelTextColor:UIColor) {
        
        self.text = text
        self.font = font
        self.textAlignment = textAlignment
        self.animationDuration = animationDuration
        self.frame = frame
        self.parentView = parentView
        self.mainLabelTextColor = mainLabelTextColor
        self.maskLabelTextColor = maskLabelTextColor
    }
}

public struct SHNDShimmerFactory {
    public static func create(builder: ShimmerBuilder) -> Void {
        SHNDShimmerLabel(builder: builder).animate()
    }
}

fileprivate class SHNDShimmerLabel: ShimmerAnimation, ShimmerBuilder {
    
    fileprivate var text: String
    fileprivate var font: UIFont
    fileprivate var textAlignment: NSTextAlignment
    fileprivate var frame: CGRect
    fileprivate var parentView: UIView
    fileprivate var animationDuration: CFTimeInterval
    fileprivate var mainLabelTextColor: UIColor
    fileprivate var maskLabelTextColor: UIColor
    
    fileprivate init(builder: ShimmerBuilder) {
        self.text = builder.text
        self.font = builder.font
        self.textAlignment = builder.textAlignment
        self.animationDuration = builder.animationDuration
        self.frame = builder.frame
        self.parentView = builder.parentView
        self.mainLabelTextColor = builder.mainLabelTextColor
        self.maskLabelTextColor = builder.maskLabelTextColor
    }
    
    fileprivate func animate() {
        let mainLabel = UILabel()
        mainLabel.text = text
        mainLabel.textColor = mainLabelTextColor
        mainLabel.font = font
        mainLabel.textAlignment = textAlignment
        mainLabel.frame = frame
        
        let maskLabel = UILabel()
        maskLabel.text = text
        maskLabel.textColor = maskLabelTextColor
        maskLabel.font = font
        maskLabel.textAlignment = textAlignment
        maskLabel.frame = frame
        
        parentView.addSubview(mainLabel)
        parentView.addSubview(maskLabel)
        
        let gradientlayer = CAGradientLayer()
        gradientlayer.colors = [UIColor.clear.cgColor,
                                UIColor.white.cgColor,
                                UIColor.clear.cgColor]
        gradientlayer.locations = [0, 0.5, 1]
        gradientlayer.frame = maskLabel.frame
        
        let angle = Radian(degrees: 45).value()
        
        gradientlayer.transform = CATransform3DMakeRotation(angle, 0, 0, 1)
        
        maskLabel.layer.mask = gradientlayer
        
        let animation = CABasicAnimation(keyPath: "transform.translation.x")
        animation.duration = animationDuration
        animation.fromValue = -parentView.frame.width
        animation.toValue = parentView.frame.width
        animation.repeatCount = Float.infinity
        
        gradientlayer.add(animation, forKey: "shnd")
    }
}

fileprivate class Radian {
    
    private(set) var degrees: Double
    
    init(degrees: Double) {
        self.degrees = degrees
    }
    
    @discardableResult
    public func value() -> CGFloat {
        return CGFloat(degrees * .pi / 180)
    }
}
