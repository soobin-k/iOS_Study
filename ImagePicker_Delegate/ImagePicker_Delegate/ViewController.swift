//
//  ViewController.swift
//  ImagePicker_Delegate
//
//  Created by 김수빈 on 2021/09/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pick(_ sender: Any) {
        // 이미지 피커 컨트롤러 인스턴스 생성
        let picker = UIImagePickerController( )
        picker.sourceType = .photoLibrary // 이미지 소스로 사진 라이브러리 선택
        picker.allowsEditing = true // 이미지 편집 기능 On
        
        // 추가된 부분) 델리게이트 지정
        picker.delegate = self
        
        // 이미지 피커 컨트롤러 실행
        self.present(picker, animated: false)
      }
}
    
// MARK:- 이미지 피커 컨트롤러 델리게이트 메소드
extension ViewController: UIImagePickerControllerDelegate {
  // 이미지 피커에서 이미지를 선택하지 않고 취소했을 때 호출되는 메소드
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    // 이미지 피커 컨트롤러 창 닫기
    picker.dismiss(animated:false)
    self.dismiss(animated: false) { () in
      // 알림창 호출
      let alert = UIAlertController(title: "",
                                    message: "이미지 선택이 취소되었습니다",
                                    preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "확인", style: .cancel))
      self.present(alert, animated: false)
    }
  }
  
  // 이미지 피커에서 이미지를 선택했을 때 호출되는 메소드
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
   
        var newImage: UIImage? = nil // update 할 이미지
                
        if let possibleImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            newImage = possibleImage // 수정된 이미지가 있을 경우
        } else if let possibleImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            newImage = possibleImage // 원본 이미지가 있을 경우
        }
        self.imgView.image = newImage
        // 이미지 피커 컨트롤러 창 닫기
        picker.dismiss(animated: false)
    }
}
// MARK:- 내비게이션 컨트롤러 델리게이트 메소드
extension ViewController: UINavigationControllerDelegate {
}
// MARK:- 텍스트필드 델리게이트 메소드
extension ViewController: UITextFieldDelegate {
  func textFieldDidBeginEditing(_ textField: UITextField) {
    
  }
  func textFieldDidEndEditing(_ textField: UITextField) {
    
  }
}


