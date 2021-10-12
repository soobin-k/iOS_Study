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
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setCalendarUI()
        
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        calendarView.delegate = self
        calendarView.dataSource = self
    }
    
    func setCalendarUI()  {
        calendarView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        calendarView.appearance.selectionColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        
        calendarView.appearance.todayColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        
        calendarView.allowsMultipleSelection = true
        
        calendarView.swipeToChooseGesture.isEnabled = true
        
        // 스와이프 스크롤 작동 여부 ( 활성화하면 좌측 우측 상단에 다음달 살짝 보임, 비활성화하면 사라짐 )
        calendarView.scrollEnabled = true
        
        // 스와이프 스크롤 방향 ( 버티칼로 스와이프 설정하면 좌측 우측 상단 다음달 표시 없어짐, 호리젠탈은 보임 )
        calendarView.scrollDirection = .horizontal
        
        // 선택된 날짜의 모서리 설정 ( 0으로 하면 사각형으로 표시 )
        calendarView.appearance.borderRadius = 0
        
        // 타이틀 컬러
        calendarView.appearance.titleSelectionColor = .black
        // 서브 타이틀 컬러
        calendarView.appearance.subtitleSelectionColor = .black
        
        // 달력의 평일 날짜 색깔
        calendarView.appearance.titleDefaultColor = .black
        // 달력의 토,일 날짜 색깔
        calendarView.appearance.titleWeekendColor = .red
        // 달력의 맨 위의 년도, 월의 색깔
        calendarView.appearance.headerTitleColor = .systemPink
        // 달력의 요일 글자 색깔
        calendarView.appearance.weekdayTextColor = .orange

        // 달력의 년월 글자 바꾸기
        calendarView.appearance.headerDateFormat = "YYYY년 M월"
        // 달력의 요일 글자 바꾸는 방법 1
        calendarView.locale = Locale(identifier: "ko_KR")
        // 달력의 요일 글자 바꾸는 방법 2
        calendarView.calendarWeekdayView.weekdayLabels[0].text = "일"
        calendarView.calendarWeekdayView.weekdayLabels[1].text = "월"
        calendarView.calendarWeekdayView.weekdayLabels[2].text = "화"
        calendarView.calendarWeekdayView.weekdayLabels[3].text = "수"
        calendarView.calendarWeekdayView.weekdayLabels[4].text = "목"
        calendarView.calendarWeekdayView.weekdayLabels[5].text = "금"
        calendarView.calendarWeekdayView.weekdayLabels[6].text = "토"

        // 년월에 흐릿하게 보이는 애들 없애기
        calendarView.appearance.headerMinimumDissolvedAlpha = 0

        
    }
    
}
extension ViewController : FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {
    
    // 날짜 선택 시 콜백 메소드
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print(dateFormatter.string(from: date) + " 선택됨")
    }
    
    // 날짜 선택 해제 시 콜백 메소드
    public func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print(dateFormatter.string(from: date) + " 해제됨")
    }
    
    //날짜 밑에 문자열을 표시
    func calendar(_ calendar: FSCalendar, subtitleFor date: Date) -> String? {
            
            switch dateFormatter.string(from: date) {
            case dateFormatter.string(from: Date()):
                return "오늘"
            case "2021-10-22":
                return "출근"
            case "2021-10-23":
                return "지각"
            case "2021-10-24":
                return "결근"
            default:
                return nil
            }
    }
    
    //날짜 글씨 자체를 바꾸기
    func calendar(_ calendar: FSCalendar, titleFor date: Date) -> String? {
            switch dateFormatter.string(from: date) {
            case "2021-10-25":
                return "D-day"
            default:
                return nil
            }
        }
    
    //날짜별로 선택 컬러 변경
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillSelectionColorFor date: Date) -> UIColor? {
            
            switch dateFormatter.string(from: date) {
            case "2021-10-22":
                return #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
            case "2021-10-23":
                return #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
            case "2021-10-24":
                return #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
            default:
                return appearance.selectionColor
            }
        }
    
    //최대 선택 가능 갯수
    func calendar(_ calendar: FSCalendar, shouldSelect date: Date, at monthPosition: FSCalendarMonthPosition) -> Bool {
            // 날짜 5개까지만 선택되도록
            if calendar.selectedDates.count > 5 {
                return false
            } else {
                return true
            }
        }
    
    //선택해제
    func calendar(_ calendar: FSCalendar, shouldDeselect date: Date, at monthPosition: FSCalendarMonthPosition) -> Bool {
            //return false // 선택해제 불가능
            return true // 선택해제 가능
        }
}
