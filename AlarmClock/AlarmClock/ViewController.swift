//
//  ViewController.swift
//  AlarmClock
//
//  Created by 김형석 on 2023/03/22.
//

import UIKit

class ViewController: UIViewController {
    let interval = 1.0
    let timeSelector: Selector = #selector(updateCurrentTime)
    
    var alarmTime: String!
    var currentTime: String!
    
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
        
        formatter.dateFormat = "hh:mm aaa"
        alarmTime = formatter.string(from: sender.date)
    }
    
    @objc func updateCurrentTime() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        
        lblCurrentTime.text = "현재시간: " + formatter.string(from: NSDate() as Date)
        
        formatter.dateFormat = "hh:mm aaa"
        currentTime = formatter.string(from: NSDate() as Date)
        
        if alarmTime == currentTime {
            view.backgroundColor = UIColor.red
        }
        else {
            view.backgroundColor = UIColor.white
        }
    }
}

