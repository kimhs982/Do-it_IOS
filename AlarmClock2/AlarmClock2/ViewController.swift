//
//  ViewController.swift
//  AlarmClock2
//
//  Created by 김형석 on 2023/04/22.
//

import UIKit

class ViewController: UIViewController {
    let interval = 1.0
    let timeSelector: Selector = #selector(updateCurrentTime)
    var alarmTime: String?
    var oneMinuteCheck = false
    
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        
        lblPickerTime.text = "선택시간: " + formatter.string(from: sender.date)
        
        alarmTime = formatter.string(from: sender.date)
    }
    
    @objc func updateCurrentTime() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        
        lblCurrentTime.text = "현재시간: " + formatter.string(from: NSDate() as Date)
        
        var currentTime = formatter.string(from: NSDate() as Date)
        
        if alarmTime == currentTime {
            if !oneMinuteCheck {
                let sameTimeAlert = UIAlertController(title: "알림", message: "설정된 시간입니다!!!", preferredStyle: UIAlertController.Style.alert)
                let okayAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
                
                sameTimeAlert.addAction(okayAction)
                
                present(sameTimeAlert, animated: true, completion: nil)
                
                oneMinuteCheck = true;
            }
        }
        else {
            oneMinuteCheck = false
        }
    }
    
}

