//
//  ViewController.swift
//  ImageViewer
//
//  Created by 김형석 on 2023/03/15.
//

import UIKit

class ViewController: UIViewController {
    var numImage = 1
    let maxImage = 6
    
    @IBOutlet var imgViewer: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        imgViewer.image = UIImage(named: "1.png")
    }

    @IBAction func btnPrevImg(_ sender: UIButton) {
        numImage -= 1
        
        if numImage < 1 {
            numImage = maxImage
        }
        
        let imageName = String(numImage) + ".png"
        imgViewer.image = UIImage(named: imageName)
    }
    
    @IBAction func btnNextImg(_ sender: UIButton) {
        numImage += 1
        
        if numImage > maxImage {
            numImage = 1
        }
        
        let imageName = String(numImage) + ".png"
        imgViewer.image = UIImage(named: imageName)
    }
}

