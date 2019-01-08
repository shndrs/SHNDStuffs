//
//  SHNDNavigationBar.swift
//  SHNDStuffs
//
//  Created by Sahand Raeisi on 1/1/19.
//

import UIKit

public extension UINavigationBar {
    
    public func applyNavigationGradient( _ colors : [UIColor], isHorizontal:Bool = true) {
        var frameAndStatusBar: CGRect = self.bounds
        frameAndStatusBar.size.height += 20
        
        setBackgroundImage(UINavigationBar.gradient(frameAndStatusBar.size, colors: colors,isHorizontal: isHorizontal), for: .default)
    }
    
    static public func gradient(_ size : CGSize, colors : [UIColor], isHorizontal:Bool) -> UIImage? {
        
        let cgcolors = colors.map { $0.cgColor }
        UIGraphicsBeginImageContextWithOptions(size, true, 0.0)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        
        defer { UIGraphicsEndImageContext() }
        
        var locations : [CGFloat] = [0.0, 1.0]
        
        guard let gradient = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(),
                                        colors: cgcolors as NSArray as CFArray,
                                        locations: &locations) else { return nil }
        
        if isHorizontal {
            
            context.drawLinearGradient(gradient, start: CGPoint(x: 0.0, y: 0.0), end: CGPoint(x: size.width, y: 0.0), options: [])
            return UIGraphicsGetImageFromCurrentImageContext()
        } else {
            
            context.drawLinearGradient(gradient, start: CGPoint(x: 0.0, y: 0.0), end: CGPoint(x: 0.0, y: size.height), options: [])
            return UIGraphicsGetImageFromCurrentImageContext()
        }
    }
}

public extension UIViewController {
    
    // call this function inside your viewDidLoad() and enjoy it
    
    public func SHNDNavigationBarGradient(firstColor:UIColor, secondColor:UIColor, tintColor:UIColor? = .black, isHorizontal:Bool? = true) {
        
        navigationController?.navigationBar.tintColor = tintColor
        navigationController?.navigationBar.applyNavigationGradient([firstColor, secondColor],isHorizontal: isHorizontal!)
    }
}
