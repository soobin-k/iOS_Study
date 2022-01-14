//
//  ViewController.swift
//  ObserverEx
//
//  Created by 김수빈 on 2022/01/15.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        main()
    }
    func main() {
        let subject = Subject()
        let _ = Soobin(subject)
        let _ = Chobi(subject)
        
        subject.number = 2
        subject.number = 10
    }

}

