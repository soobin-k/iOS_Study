//
//  ViewController.swift
//  FSCalendarEx
//
//  Created by 김수빈 on 2021/10/11.
//

import UIKit
import FSCalendar

class ViewController: UIViewController {

    @IBOutlet weak var calendarView: FSCalendar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        calendarView.backgroundColor = UIColor(red: 241/255, green: 249/255, blue: 255/255, alpha: 1)
        
        calendarView.appearance.selectionColor = UIColor(red: 38/255, green: 153/255, blue: 251/255, alpha: 1)
        
        calendarView.appearance.todayColor = UIColor(red: 188/255, green: 224/255, blue: 253/255, alpha: 1)
        
        calendarView.allowsMultipleSelection = true
        
        calendarView.swipeToChooseGesture.isEnabled = true
        
        // 스와이프 스크롤 작동 여부 ( 활성화하면 좌측 우측 상단에 다음달 살짝 보임, 비활성화하면 사라짐 )
        calendarView.scrollEnabled = true
        // 스와이프 스크롤 방향 ( 버티칼로 스와이프 설정하면 좌측 우측 상단 다음달 표시 없어짐, 호리젠탈은 보임 )
        calendarView.scrollDirection = .vertical
        
        // 선택된 날짜의 모서리 설정 ( 0으로 하면 사각형으로 표시 )
        calendarView.appearance.borderRadius = 0

    }


}

