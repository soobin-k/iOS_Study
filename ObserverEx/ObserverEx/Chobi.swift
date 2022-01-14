//
//  Chobi.swift
//  ObserverEx
//
//  Created by 김수빈 on 2022/01/15.
//

import Foundation
class Chobi: Observer {
    
    private var subject = Subject()
    
    init(_ subject: Subject) {
        self.subject = subject
        self.subject.attachObsever(self)
    }
    
    func update(_ notifyValue: Int) {
         print("초비가 \(notifyValue) 값으로 입력 된 걸 인지 하였습니다.")
    }
}
