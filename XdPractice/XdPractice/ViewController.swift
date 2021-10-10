//
//  ViewController.swift
//  XdPractice
//
//  Created by 김수빈 on 2021/10/10.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    //propertis
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    
    //action
    
    //배경 누르면 키보드 닫기(배경 이미지의 user interaction 옵션 선택해줘야함)
    @IBAction func bgOutside(_ sender: UITapGestureRecognizer) {
        usernameField.resignFirstResponder()
        emailField.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        usernameField.delegate = self
        emailField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

