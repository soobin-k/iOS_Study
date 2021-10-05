//
//  SettingViewController.swift
//  UserDefaultsEx
//
//  Created by 김수빈 on 2021/10/06.
//
import UIKit
import Foundation

struct Setting {
    enum State:String{
        case Vibrate
        case Sound
        case Bright
    }
}

class SettingViewController: UIViewController{
  @IBOutlet weak var vibrateSwitch: UISwitch!
  @IBOutlet weak var soundSwitch: UISwitch!
  @IBOutlet weak var brightSlider: UISlider!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setState()

    }
    
    func setState(){
            let userDefault = UserDefaults.standard
            if let vibrate = userDefault.value(forKey: Setting.State.Vibrate.rawValue),
                let sound = userDefault.value(forKey: Setting.State.Sound.rawValue),
                let bright = userDefault.value(forKey: Setting.State.Bright.rawValue){
                self.vibrateSwitch.isOn = vibrate as! Bool
                self.soundSwitch.isOn = sound as! Bool
                self.brightSlider.value = bright as! Float
            }else{
                // Default Value
                vibrateSwitch.isOn = true
                soundSwitch.isOn = true
                brightSlider.value = 0.5
            }
        }
    
    @IBAction func saveBtnTapped(_ sender: Any) {
        UserDefaults.standard.set(vibrateSwitch.isOn, forKey: Setting.State.Vibrate.rawValue)
                UserDefaults.standard.set(soundSwitch.isOn, forKey: Setting.State.Sound.rawValue)
                UserDefaults.standard.set(brightSlider.value, forKey: Setting.State.Bright.rawValue)
            
                navigationController?.popViewController(animated: true)
    }
}
