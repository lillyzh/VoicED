//
//  TabBarNavigationControllerViewController.swift
//  VoicED
//
//  Created by Lilly Zhou on 11/29/18.
//  Copyright © 2018 Lilly Zhou. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    var languageSelected: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let viewControllers = viewControllers else {
            return
        }
        
        for viewController in viewControllers {
            if let homePageNavigationController = viewController as? HomePageNavController {
                
                if let mainPageViewController = homePageNavigationController.viewControllers.first as? MainPageController {
                    mainPageViewController.chosenLanguage = languageSelected
                }
            }
        }
    }
}
