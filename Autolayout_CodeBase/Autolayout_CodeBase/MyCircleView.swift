//
//  MyCircleView.swift
//  Autolayout_CodeBase
//
//  Created by 김수빈 on 2021/12/30.
//

import Foundation
import UIKit

class MyCircleView: UIView{
    override func layoutSubviews() {
        super.layoutSubviews()
        print("MyCircleView - layoutSubviews() called")
        self.layer.cornerRadius = self.frame.height / 2
    }
}
