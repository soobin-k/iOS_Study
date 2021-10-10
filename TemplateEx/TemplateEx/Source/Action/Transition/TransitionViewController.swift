//
//  TransitionViewController.swift
//  TemplateEx
//
//  Created by 김수빈 on 2021/10/10.
//

import Foundation
import UIKit

class TransitionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func changeRootViewControllerButtonTouchUpInside(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func changeWindowButtonTouchUpInside(_ sender: Any) {
        let splashStoryboard = UIStoryboard(name: "SplashStoryboard", bundle: nil)
        let splashViewController = splashStoryboard.instantiateViewController(identifier: "SplashViewController")
        self.changeRootViewController(splashViewController)
    }
    
}
