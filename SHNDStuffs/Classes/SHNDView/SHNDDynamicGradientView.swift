//
//  SHNDDynamicGradientView.swift
//  SHNDStuffs
//
//  Created by Sahand Raeisi on 1/11/19.
//

import UIKit

fileprivate protocol SHNDDynamicGradientViewDelegate {
    var colorArray: [(firstColor:UIColor, secondColor:UIColor)] { get }
    var duration: TimeInterval { get }
    var shndView: SHNDView { get }
}

fileprivate protocol TransitionProtocol {
    func animate() -> Void
}

public struct SHNDDynamicGradientViewObject: SHNDDynamicGradientViewDelegate {
    public var colorArray: [(firstColor: UIColor, secondColor: UIColor)]
    public var duration: TimeInterval
    public var shndView: SHNDView
}

open class SHNDDynamicGradientView:SHNDDynamicGradientViewDelegate, TransitionProtocol {
    
    public var colorArray: [(firstColor: UIColor, secondColor: UIColor)]
    public var duration: TimeInterval
    public var shndView: SHNDView
    private var currentColorArrayIndex = -1
    
    public init(builder: SHNDDynamicGradientViewObject) {
        self.colorArray = builder.colorArray
        self.duration = builder.duration
        self.shndView = builder.shndView
    }
    
    public func animate() {
        
        currentColorArrayIndex = currentColorArrayIndex == (colorArray.count - 1) ? 0 : currentColorArrayIndex + 1
        
        UIView.transition(with: shndView,
                          duration: duration,
                          options: [.transitionCrossDissolve],
                          animations: { [weak self] in
                            
            guard let self = self else { return }
                            
            self.shndView.firstColor = self.colorArray[self.currentColorArrayIndex].0
            self.shndView.secondColor = self.colorArray[self.currentColorArrayIndex].1
                            
        }) { (success) in
            self.animate()
        }
    }
}

