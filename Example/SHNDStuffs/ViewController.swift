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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Shimmer label
        
        let builderObject = ShimmerObject.init(text: "SHNDShimmer",
                                               font: UIFont(name: "Papyrus", size: 41)!,
                                               textAlignment: .center, animationDuration: 2,
                                               frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 230),
                                               parentView: view,
                                               mainLabelTextColor: .orange,
                                               maskLabelTextColor: .purple)
        SHNDShimmerFactory.create(builder: builderObject)
    }
    
    @IBAction private func goToSHNDButtonVC(_ sender: SHNDButton) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "SHNDButtonVC") as? SHNDButtonVC else { return }
        navigationController?.pushViewController(vc, animated: true)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}

