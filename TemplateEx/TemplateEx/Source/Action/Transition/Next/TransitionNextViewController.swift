//
//  TransitionNextViewController.swift
//  TemplateEx
//
//  Created by 김수빈 on 2021/10/11.
//

import Foundation
import UIKit
class TransitionNextViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.view.backgroundColor = .red
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.view.backgroundColor = .yellow
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.view.backgroundColor = .green
    }
    @IBAction func navigationPopButtonTouchUpInside(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func dismissModalButtonTouchUpInside(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

