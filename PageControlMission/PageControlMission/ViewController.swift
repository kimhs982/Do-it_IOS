//
//  ViewController.swift
//  PageControlMission
//
//  Created by 김형석 on 2023/06/27.
//

import UIKit

let PAGE_NUM = 10

class ViewController: UIViewController {
    @IBOutlet var lblPageNum: UILabel!
    @IBOutlet var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        pageControl.numberOfPages = PAGE_NUM     // 페이지 컨트롤의 전체 페이지를 10으로 설정
        pageControl.currentPage = 0     // 페이지 컨트롤의 현재 페이지를 1로 설정
        
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.currentPageIndicatorTintColor = UIColor.darkGray
        
        lblPageNum.text = String(pageControl.currentPage + 1)
    }

    @IBAction func pageChange(_ sender: UIPageControl) {
        lblPageNum.text = String(pageControl.currentPage + 1)
    }
}

