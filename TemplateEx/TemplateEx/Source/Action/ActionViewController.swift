//
//  ActionViewController.swift
//  TemplateEx
//
//  Created by 김수빈 on 2021/10/10.
//

import Foundation
import UIKit

class ActionViewController: UIViewController {

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func indicatorButtonTapped(_ sender: Any) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.dismissIndicator()
        }
    }
    
    @IBAction func gifIndicatorButtonTapped(_ sender: Any){
        let containerView = UIView(frame: UIScreen.main.bounds)
        let activityIndicator = UIImageView(frame: CGRect(origin: .zero, size: CGSize(width: 191.8, height: 85.2)))
        let images: [UIImage] = Array(0..<12).map{ UIImage(named: "bts\($0)")! }
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        containerView.frame = window.frame
        containerView.center = window.center
        containerView.backgroundColor = .clear
        containerView.addSubview(activityIndicator)
        UIApplication.shared.windows.first?.addSubview(containerView)
        
        containerView.backgroundColor = UIColor(hex: 0x000000, alpha: 0.4)
        activityIndicator.center = containerView.center
        activityIndicator.animationImages = images
        activityIndicator.animationDuration = Double(activityIndicator.animationImages?.count ?? 0) / 12
        activityIndicator.animationRepeatCount = 0
        activityIndicator.startAnimating()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            activityIndicator.stopAnimating()
            containerView.removeFromSuperview()
        }
    }
    
    
    
}
