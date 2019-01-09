//
//  ViewController.swift
//  SHNDStuffs
//
//  Created by sahandraeisi1994@gmail.com on 12/18/2018.
//  Copyright (c) 2018 sahandraeisi1994@gmail.com. All rights reserved.
//

import UIKit
import SHNDStuffs

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Navigation gradient
        
        SHNDNavigationBarGradient(firstColor: .purple,
                                  secondColor: .red,
                                  tintColor: .black,
                                  isHorizontal: true)
        
        // Custom title
        
        let navTitleBuilder = NavigationTitleViewBuilder(title: "SHNDStuffs",
                                                         desc: "Navigation Bar Custom Title",
                                                         titleFont: UIFont(name: "Papyrus", size: 18)!,
                                                         descFont: UIFont(name: "Kailasa", size: 10)!,
                                                         titleTextColor: .white,
                                                         descTextColor: .white)
        
        SHNDNavigationCustomTitleView(builder: navTitleBuilder)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

