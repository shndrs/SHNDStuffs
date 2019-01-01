//
//  SHNDButtonAnimationFactory.swift
//  SHNDStuffs
//
//  Created by Sahand Raeisi on 1/1/19.
//

import UIKit

public enum SHNDButtonAnimationMode {
    case pulsate
    case flash
    case shake
}

public struct AnimationElements {
    
    private(set) var duration: CFTimeInterval
    private(set) var repeatCount: Float
    private(set) var autoreverses: Bool
    private(set) var animationMode: SHNDButtonAnimationMode
    
    public init(duration: CFTimeInterval, repeatCount: Float, autoreverses: Bool, animationMode: SHNDButtonAnimationMode) {
        self.duration = duration
        self.repeatCount = repeatCount
        self.autoreverses = autoreverses
        self.animationMode = animationMode
    }
}

extension SHNDButton {
    
    @available(iOS 9.0, *)
    public func SHNDButtonAnimation(animationElements:AnimationElements) -> Void {
        
        switch animationElements.animationMode {
            
        case .pulsate:
            pulsateAnimation(animationElements: animationElements)
        case .flash:
            flashAnimation(animationElements: animationElements)
        case .shake:
            shakeAnimation(animationElements: animationElements)
        }
    }
    
    @available(iOS 9.0, *)
    private func pulsateAnimation(animationElements: AnimationElements) {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = animationElements.duration
        pulse.fromValue = 0.95
        pulse.toValue = 1.0
        pulse.autoreverses = animationElements.autoreverses
        pulse.repeatCount = animationElements.repeatCount
        pulse.initialVelocity = 0.5
        pulse.damping = 1.0
        
        layer.add(pulse, forKey: "pulse")
    }
    
    private func flashAnimation(animationElements: AnimationElements) {
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = animationElements.duration
        flash.fromValue = 1
        flash.toValue = 0.1
        flash.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        flash.autoreverses = animationElements.autoreverses
        flash.repeatCount = animationElements.repeatCount
        
        layer.add(flash, forKey: nil)
    }
    
    private func shakeAnimation(animationElements: AnimationElements) {
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = animationElements.duration
        shake.repeatCount = animationElements.repeatCount
        shake.autoreverses = animationElements.autoreverses
        
        let fromPoint = CGPoint(x: center.x - 5, y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: center.x + 5, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        shake.fromValue = fromValue
        shake.toValue = toValue
        
        layer.add(shake, forKey: "position")
    }
}
