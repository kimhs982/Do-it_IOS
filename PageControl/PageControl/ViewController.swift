//
//  ViewController.swift
//  PageControl
//
//  Created by 김형석 on 2023/06/12.
//

import UIKit

var images = [ "01.png", "02.png", "03.png", "04.png", "05.png", "06.png" ]

class ViewController: UIViewController {
    @IBOutlet var imgView: UIImageView!     // 이미지 출력용 아웃렛 변수
    @IBOutlet var pageControl: UIPageControl!       // 페이지 컨트롤용 아웃렛 변수
    
    // 뷰가 로드되었을 때 호출됨
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        pageControl.numberOfPages = images.count        // 페이지 컨트롤의 전체 페이지를 images 배열의 전체 개수 값으로 설정
        pageControl.currentPage = 0     // 페이지 컨트롤의 현재 페이지를 0으로 설정
        
        pageControl.pageIndicatorTintColor = UIColor.green      // 페이지 표시 색상을 초록색으로 설정
        pageControl.currentPageIndicatorTintColor = UIColor.red     // 현재 페이지 표시 색상을 빨간색으로 설정
        
        imgView.image = UIImage(named: images[0])
    }

    // 페이지가 변하면 호출됨
    @IBAction func pageChange(_ sender: UIPageControl) {
        imgView.image = UIImage(named: images[pageControl.currentPage])     // images라는 배열에서 pageControl이 가리키는 현재 페이지에 해당하는 이미지를 imgView에 할당
    }
}

