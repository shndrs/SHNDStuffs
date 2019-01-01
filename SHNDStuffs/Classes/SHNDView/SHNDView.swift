//
//  SHNDView.swift
//  SHNDStuffs
//
//  Created by Sahand Raeisi on 1/1/19.
//

import UIKit

@IBDesignable
open class SHNDView: UIView {
    
    // MARK: Border Stuffs
    
    @IBInspectable public var borderColor: UIColor = .clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable public var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable public var circularView: Bool = false {
        didSet {
            if circularView {
                let radius = self.frame.width/2.0
                self.layer.cornerRadius = radius
            } else {
                self.layer.cornerRadius = cornerRadius
            }
        }
    }
    
    //MARK: Shadow Stuffs
    
    @IBInspectable public var shadowOpacity: CGFloat = 0.0 {
        didSet {
            layer.shadowOpacity = Float(shadowOpacity)
        }
    }
    
    @IBInspectable public var shadowRadius: CGFloat = 0.0 {
        didSet {
            layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable public var shadowColor: UIColor = .clear {
        didSet {
            layer.shadowColor = shadowColor.cgColor
        }
    }
    
    @IBInspectable public var shadowOffset: CGSize = CGSize(width: 0.0, height: 0.0) {
        didSet {
            layer.shadowOffset = shadowOffset
        }
    }
    
    // MARK: Gradient Stuffs
    
    @IBInspectable var firstColor: UIColor = UIColor.white {
        didSet {
            update()
        }
    }
    
    @IBInspectable var secondColor: UIColor = UIColor.white {
        didSet {
            update()
        }
    }
    
    @IBInspectable var horizontalGradient: Bool = false {
        didSet {
            update()
        }
    }
    
    override open class var layerClass: AnyClass {
        get {
            return CAGradientLayer.self
        }
    }
    
    // MARK: Flipped Stuffs
    
    @IBInspectable public var isGeometryFlipped: Bool = false {
        didSet {
            layer.isGeometryFlipped = isGeometryFlipped
        }
    }
    
    // MARK: Mask Stuffs
    
    @IBInspectable public var maskToBounds: Bool = false {
        didSet {
            layer.masksToBounds = maskToBounds
        }
    }
    
    // MARK: Funcs
    
    fileprivate func update() {
        let layer = self.layer as! CAGradientLayer
        layer.colors = [ firstColor.cgColor, secondColor.cgColor ]
        
        if (horizontalGradient) {
            layer.startPoint = CGPoint(x: 0.0, y: 0.5)
            layer.endPoint = CGPoint(x: 1.0, y: 0.5)
        } else {
            layer.startPoint = CGPoint(x: 0, y: 0)
            layer.endPoint = CGPoint(x: 0, y: 1)
        }
    }
}
