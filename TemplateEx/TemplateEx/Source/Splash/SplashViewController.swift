//
//  SplashViewController.swift
//  TemplateEx
//
//  Created by 김수빈 on 2021/10/10.
//

import Foundation
import UIKit
class SplashViewController: BaseViewController{
    

    @IBAction func presentMainButtonTouchUpInside(_ sender: Any) {
        let mainTabBarController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "MainTabBarController")
        changeRootViewController(mainTabBarController)
    }
    
}
