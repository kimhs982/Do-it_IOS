//
//  ViewController.swift
//  Web
//
//  Created by 김형석 on 2023/04/29.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet var txtUrl: UITextField!
    @IBOutlet var myWebView: WKWebView!
    @IBOutlet var myActivityIndicator: UIActivityIndicatorView!
    
    // url의 인수를 통해 웹 페이지의 주소를 전달받아 웹 페이지를 보여 줌
    func loadWebPage(_ url: String) {
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!);
        myWebView.load(myRequest)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myWebView.navigationDelegate = self
//        loadWebPage("http://2sam.net")      // 앱이 처음 실행되었을 때 웹 페이지 주소
        loadWebPage("https://www.naver.com")      // 앱이 처음 실행되었을 때 웹 페이지 주소
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        myActivityIndicator.startAnimating()
        myActivityIndicator.isHidden = false
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    
    // "http//" 문자열이 없을 경우 자동으로 삽입
    func checkUrl(_ url: String) -> String {
        var strUrl = url
        let flag = strUrl.hasPrefix("http://")
        if !flag {
            strUrl = "http://" + strUrl
        }
        return strUrl
    }

    // 텍스트 필드에 적힌 주소로 웹 뷰 로딩
    @IBAction func btnGotoUrl(_ sender: UIButton) {
        let myUrl = checkUrl(txtUrl.text!)
        txtUrl.text = ""
        loadWebPage(myUrl)
    }
    
    // [Site1] 버튼 클릭 시 google.co.kr로 이동
    @IBAction func btnGoSite1(_ sender: UIButton) {
//        loadWebPage("http://fallinmac.tistory.com")     // Site1 버튼을 눌렀을 때 이동할 웹 페이지 주소
        loadWebPage("https://www.google.co.kr")     // Site1 버튼을 눌렀을 때 이동할 웹 페이지 주소
    }
    
    // [Site2] 버튼 클릭 시 youtube.com으로 이동
    @IBAction func btnGoSite2(_ sender: UIButton) {
//        loadWebPage("http://blog.2sam.net")     // Site2 버튼을 눌렀을 때 이동할 웹 페이지 주소
        loadWebPage("https://www.youtube.com")     // Site2 버튼을 눌렀을 때 이동할 웹 페이지 주소
    }
    
    // HTML 코드를 변수에 저장하고 [html] 버튼을 클릭하면
    // HTML 문법에 맞게 작성된 문자열 변수를 웹 뷰로 나타냄
    @IBAction func btnLoadHtmlString(_ sender: UIButton) {
//        let htmlString = "<h1> HTML String </h1><p> String 변수를 이용한 웹 페이지 </p> <p><a href=\"http://2sam.net\">2sam</a>으로 이동</p>"
        let htmlString = "<h1> HTML String </h1><p> String 변수를 이용한 웹 페이지 </p> <p><a href=\"https://learn.inha.ac.kr\">인하대 iclass</a>로 이동</p>"
        myWebView.loadHTMLString(htmlString, baseURL: nil)
    }
    
    // htmlView.html을 웹 뷰로 나타냄
    @IBAction func btnLoadHtmlFile(_ sender: UIButton) {
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        let myUrl = URL(fileURLWithPath: filePath!)
        let myRequest = URLRequest(url: myUrl)
        myWebView.load(myRequest)
    }
    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading()     // 웹 페이지의 로딩을 중지
    }
    
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        myWebView.reload()      // 웹 페이지를 재로딩
    }
    
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        myWebView.goBack()      // 이전 웹 페이지로 이동
    }
    
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        myWebView.goForward()       // 다음 웹 페이지로 이동
    }
}

