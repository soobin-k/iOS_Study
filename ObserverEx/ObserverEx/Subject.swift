//
//  Subject.swift
//  ObserverEx
//
//  Created by 김수빈 on 2022/01/15.
//

import Foundation

//관찰자들이 보고있는 대상
class Subject {
    private var observers: [Observer] = [Observer]()
    private var value: Int = Int()
    
    var number: Int {
        set {
            value = newValue
            notify()
        }
        get {
            return value
        }
    }
    
    //옵저버 등록
    func attachObsever(_ obsever: Observer) {
        observers.append(obsever)
    }
    
    //옵저버 알림
    func notify() {
        for observer in observers {
            observer.update(number)
        }
    }
}
