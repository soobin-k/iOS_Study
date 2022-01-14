//
//  ViewController.swift
//  MVVMEx_RxSwift
//
//  Created by 김수빈 on 2022/01/15.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {
    
    @IBOutlet weak var datetimeLabel: UILabel!
    
    @IBAction func onYesterday(_ sender: Any) {
        viewModel.moveDay(day: -1)
    }
    @IBAction func onNow(_ sender: Any) {
        datetimeLabel.text = "Loading.."
        viewModel.reload()
    }
    @IBAction func onTomorrow(_ sender: Any) {
        viewModel.moveDay(day: 1)
    }
    
    let viewModel = ViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.dateTimeString
            .bind(to: datetimeLabel.rx.text)
            .disposed(by: disposeBag)

        viewModel.reload()
    }

}

