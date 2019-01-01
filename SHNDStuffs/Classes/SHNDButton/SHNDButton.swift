//
//  SHNDButton.swift
//  SHNDStuffs
//
//  Created by Sahand Raeisi on 1/1/19.
//

import UIKit

@IBDesignable
open class SHNDButton: UIButton {
    
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
}
