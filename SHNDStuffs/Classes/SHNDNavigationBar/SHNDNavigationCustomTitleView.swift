//
//  SHNDNavigationCustomTitleView.swift
//  SHNDStuffs
//
//  Created by Sahand Raeisi on 1/1/19.
//

import UIKit

public protocol TitleViewBuilder {
    var title:String { get }
    var desc:String { get }
    var titleFont:UIFont { get }
    var descFont:UIFont { get }
    var titleTextColor:UIColor { get }
    var descTextColor:UIColor { get }
}

public struct NavigationTitleViewElements {
    
    public private(set) var title:String
    public private(set) var desc:String
    public private(set) var titleFont:UIFont
    public private(set) var descFont:UIFont
    public private(set) var titleTextColor:UIColor
    public private(set) var descTextColor:UIColor
    
    init(builder: TitleViewBuilder) {
        
        self.title = builder.title
        self.desc = builder.desc
        self.titleFont = builder.titleFont
        self.descFont = builder.descFont
        self.titleTextColor = builder.titleTextColor
        self.descTextColor = builder.descTextColor
    }
}

public struct NavigationTitleViewBuilder: TitleViewBuilder {
    
    public private(set) var title: String
    public private(set) var desc: String
    public private(set) var titleFont: UIFont
    public private(set) var descFont: UIFont
    public private(set) var titleTextColor: UIColor
    public private(set) var descTextColor: UIColor
    
    public init(title: String,
                desc: String,
                titleFont: UIFont,
                descFont: UIFont,
                titleTextColor: UIColor,
                descTextColor: UIColor) {
        
        self.title = title
        self.desc = desc
        self.titleFont = titleFont
        self.descFont = descFont
        self.titleTextColor = titleTextColor
        self.descTextColor = descTextColor
    }
}

public extension UINavigationItem {
    public func addCustomTitleView(builder: TitleViewBuilder){
        let view = NavTitleView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        view.initWith(builder: builder)
        self.titleView = view
    }
}

public class NavTitleView: UIView {
    
    private var titleLabel:UILabel!
    private var descLabel:UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initViews()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initViews() {
        titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 40)
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.minimumScaleFactor = 0.5
        
        titleLabel.setContentHuggingPriority(UILayoutPriority.init(rawValue: 252), for: NSLayoutConstraint.Axis.horizontal)
        titleLabel.setContentCompressionResistancePriority(UILayoutPriority.init(rawValue: 752), for: NSLayoutConstraint.Axis.horizontal)
        addSubview(titleLabel)
        
        descLabel = UILabel()
        descLabel.textColor = .black
        descLabel.textAlignment = .center
        descLabel.adjustsFontSizeToFitWidth = true
        descLabel.minimumScaleFactor = 0.5
        
        addSubview(descLabel)
    }
    
    public func initWith(builder:TitleViewBuilder){
        
        titleLabel.text = builder.title
        titleLabel.font = builder.titleFont
        titleLabel.textColor = builder.titleTextColor
        
        descLabel.text = builder.desc
        descLabel.font = builder.descFont
        descLabel.textColor = builder.descTextColor
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        let hasDesc = (self.descLabel.text ?? "" ).count > 0
        var rect = self.bounds
        rect.size.height *= hasDesc ? 0.6 : 1
        titleLabel.frame = rect
        
        var rect1 = self.bounds
        rect1.origin.y += titleLabel.frame.height
        rect1.size.height *= hasDesc ? 0.3 : 0
        descLabel.frame = rect1
    }
}

public extension UIViewController {
    public func SHNDNavigationCustomTitleView(builder: TitleViewBuilder) {
        let backButton = UIBarButtonItem(
            title: "",
            style: UIBarButtonItem.Style.plain,
            target: nil,
            action: nil
        )
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton;
        self.navigationItem.addCustomTitleView(builder: builder)
    }
}
