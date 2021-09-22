//
//  ViewController.swift
//  TextField_Delegate
//
//  Created by 김수빈 on 2021/09/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: 텍스트 필드 속성 설정
        self.textField.placeholder = "값을 입력하세요"
        self.textField.keyboardType = UIKeyboardType.alphabet // 키보드 타입 영문자 패드로
        self.textField.keyboardAppearance = UIKeyboardAppearance.dark // 키보드 스타일 어둡게
        self.textField.returnKeyType = UIReturnKeyType.join // 리턴키 타입은 "join"
        self.textField.enablesReturnKeyAutomatically = true // 리턴키 자동 활성화 "On"
        
        //MARK: 텍스트 필드 스타일 설정
        // 테두리 스타일 - 직선
        self.textField.borderStyle = UITextField.BorderStyle.line
        // 배경 색상
        self.textField.backgroundColor = UIColor(white: 0.87, alpha: 1.0)
        // 수직 방향으로 텍스트가 가운데 정렬되도록
        self.textField.contentVerticalAlignment = .center
        // 수평 방향으로 텍스트가 가운데 정렬되도록
        self.textField.contentHorizontalAlignment = .center
        // 테두리 색상을 회색으로
        self.textField.layer.borderColor = UIColor.darkGray.cgColor
        // 테두리 두께 설정 (단위: pt)
        self.textField.layer.borderWidth = 2.0
      
        //MARK: Delegate 지정
        self.textField.delegate = self
        
    }
    
    //MARK: First Responder 지정하기
    @IBAction func btnInput(_ sender: Any) {
        //텍스트 필드를 최초 응답자로 지정
        self.textField.becomeFirstResponder()
    }
    
    @IBAction func btnConfirm(_ sender: Any) {
        //텍스트 필드를 최초 응답 객체에서 해제
        self.textField.resignFirstResponder()
    }
    
    // 텍스트 필드의 편집을 시작할 때 호출
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("텍스트 필드의 편집이 시작됩니다.")
        return true // false를 리턴하면 편집되지 않는다.
    }
    
    // 텍스트 필드의 내용이 삭제될 때 호출
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("텍스트 필드의 내용이 삭제됩니다.")
        return true // false를 리턴하면 삭제되지 않는다.
    }
    
    // 텍스트 필드 내용이 변경될 때 호출
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("텍스트 필드의 내용이 \(string)으로 변경됩니다.")
        if Int(string) == nil { //입력된 값이 숫자가 아니라면 true를 리턴
            if(textField.text?.count)! + string.count > 10{
                // 현재 텍스트 필드에 입력된 길이와 더해질 문자열 길이의 합이 10을 넘는다면 반영하지 않음
                return false
            }else{
                return true
            }
            
        }else{ //입력된 값이 숫자라면 false를 리턴
            return false
        }
    }
    
    // 텍스트 필드의 리턴키가 눌러졌을 때 호출
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        print("텍스트 필드의 리턴키가 눌러졌습니다.")
        return true
    }
    
    // 텍스트 필드 편집이 종료될 때 호출
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("텍스트 필드의 편집이 종료됩니다.")
        return true
    }
    
    // 텍스트 필드의 편집이 종료되었을 때 호출
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("텍스트 필드의 편집이 종료되었습니다.")
    }
}

