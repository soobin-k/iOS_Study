//
//  ViewController.swift
//  MVVMEx
//
//  Created by 김수빈 on 2021/12/27.
//

import UIKit

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.onUpdated = {[weak self] in
            DispatchQueue.main.async {
                self?.datetimeLabel?.text = self?.viewModel.dateTimeString
            }
        }
        
        viewModel.reload()
    }

}

