//
//  EditViewController.swift
//  Navigation
//
//  Created by 김형석 on 2023/07/03.
//

import UIKit

protocol EditDelegate {
    func didMessageEditDone(_ controller: EditViewController, message: String)
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool)
    func didImageZoomInOutDone(_ controller: EditViewController, isZoom: Bool)
}

class EditViewController: UIViewController {
    
    var textWayValue: String = ""
    var textMessage: String = ""
    var delegate: EditDelegate?
    var isOn = false
    var isZoom = false
    
    @IBOutlet var lblWay: UILabel!
    @IBOutlet var txMessage: UITextField!
    @IBOutlet var swIsOn: UISwitch!
    @IBOutlet var btnZoom: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblWay.text = textWayValue
        txMessage.text = textMessage
        swIsOn.isOn = isOn
        if isZoom {
            btnZoom.setTitle("축소", for: UIControl.State())
        } else {
            btnZoom.setTitle("확대", for: .normal)
        }
    }
    
    @IBAction func btnDone(_ sender: UIButton) {
        // 메인화면으로 텍스트와 전구 이미지 상태 보내기
        if delegate != nil {
            delegate?.didMessageEditDone(self, message: txMessage.text!)
            delegate?.didImageOnOffDone(self, isOn: isOn)
            delegate?.didImageZoomInOutDone(self, isZoom: isZoom)
        }
        // 메인화면으로 이동하기
        _ = navigationController?.popViewController(animated: true)
    }
    
    // 전구 켜고 끄기
    @IBAction func swImageOnOff(_ sender: UISwitch) {
        if sender.isOn {
            isOn = true
        } else {
            isOn = false
        }
    }
    
    @IBAction func btnIsZoomInOut(_ sender: UIButton) {
        if isZoom {
            sender.setTitle("확대", for: UIControl.State())
        } else {
            sender.setTitle("축소", for: UIControl.State())
        }
        isZoom = !isZoom
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}
