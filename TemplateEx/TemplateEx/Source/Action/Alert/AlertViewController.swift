//
//  AlertViewController.swift
//  TemplateEx
//
//  Created by 김수빈 on 2021/10/11.
//

import Foundation
import UIKit

class AlertViewController: BaseViewController{
    
    // MARK: 제목만 있는 경고창
    @IBAction func alertWithTitleButtonTouchUpInside(_ sender: Any) {
        self.presentAlert(title: "제목만 있는 경고창")
    }
    
    // MARK: 제목과 본문이 있는 경고창
    @IBAction func alertWithTitleAndMessageButtonTouchUpInside(_ sender: Any) {
        self.presentAlert(title: "제목입니다", message: "본문 내용입니다")
    }
    
    // MARK: 취소가 있는 경고창
    @IBAction func alertWithCancelButtonTouchUpInside(_ sender: Any) {
        self.presentAlert(title: "취소가 있는 경고창", isCancelActionIncluded: true)
    }
    
    // MARK: 확인에 completion이 있는 경고창
    @IBAction func alertWithCompletionButtonTouchUpInside(_ sender: Any) {
        self.presentAlert(title: "completion이 있는 경고창", message: "확인 버튼을 누르면 배경 색깔이 노랑색으로 바뀝니다", isCancelActionIncluded: true) { action in
            self.view.backgroundColor = .yellow
        }
    }
    
    // MARK: 커스텀 UIAlertAction이 있는 경고창
    @IBAction func alertWithCustomActionButtonTouchUpInside(_ sender: Any) {
        let action = UIAlertAction(title: "배경 색상을 빨간색으로 변경", style: .default) { action in
            self.view.backgroundColor = .red
        }
        self.presentAlert(title: "커스텀 Action을 등록할 수 있습니다", isCancelActionIncluded: true, with: action)
    }
    
    // MARK: 커스텀 UIAlertAction들이 있는 경고창
    @IBAction func alertwithCustomActionsButtonTouchUpInside(_ sender: Any) {
        let actionR = UIAlertAction(title: "배경 색상을 빨간색으로 변경", style: .default) { action in
            self.view.backgroundColor = .red
        }
        let actionG = UIAlertAction(title: "배경 색상을 초록색으로 변경", style: .default) { action in
            self.view.backgroundColor = .green
        }
        let actionB = UIAlertAction(title: "배경 색상을 파란색으로 변경", style: .default) { action in
            self.view.backgroundColor = .blue
        }
        let cancelAction = UIAlertAction(title: "원래대로 돌리기", style: .cancel) { action in
            self.view.backgroundColor = .white
        }
        self.presentAlert(
            title: "커스텀 Action을 등록할 수 있습니다",
            with: actionR, actionG, actionB, cancelAction
        )
    }
    
    // MARK: 커스텀 UIAlertAction들이 있는 Action Sheet
    @IBAction func actionSheetWithCustomActionsButtonTouchUpInside(_ sender: Any) {
        let actionR = UIAlertAction(title: "배경 색상을 빨간색으로 변경", style: .default) { action in
            self.view.backgroundColor = .red
        }
        let actionG = UIAlertAction(title: "배경 색상을 초록색으로 변경", style: .default) { action in
            self.view.backgroundColor = .green
        }
        let actionB = UIAlertAction(title: "배경 색상을 파란색으로 변경", style: .default) { action in
            self.view.backgroundColor = .blue
        }
        let cancelAction = UIAlertAction(title: "원래대로 돌리기", style: .cancel) { action in
            self.view.backgroundColor = .white
        }
        self.presentAlert(
            title: "커스텀 Action을 등록할 수 있습니다",
            preferredStyle: .actionSheet,
            with: actionR, actionG, actionB, cancelAction
        )
    }
    
    // MARK: 커스텀 하단 경고창
    @IBAction func customBottomAlertButtonTouchUpInside(_ sender: Any) {
        self.presentBottomAlert(message: "하단 경고창입니다")
    }
    
}
