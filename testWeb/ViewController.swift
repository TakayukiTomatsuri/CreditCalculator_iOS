//
//  ViewController.swift
//  testWeb
//
//  Created by T.T on 2017/02/04.
//  Copyright © 2017年 T.T. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate  {
    
    let webView : UIWebView = UIWebView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Delegate設定
        webView.delegate = self
        
        // Webページの大きさを画面に合わせる
        let rect:CGRect = self.view.frame
        webView.frame = rect
        webView.scalesPageToFit = true
        
        // インスタンスをビューに追加する
        self.view.addSubview(webView)
        
        // URLを指定
        let url: URL = URL(string: "https://my.waseda.jp/login/login")!
        let request: URLRequest = URLRequest(url: url)
        
        // リクエストを投げる
        webView.loadRequest(request)
        
        var html = webView.stringByEvaluatingJavaScript(from: "document.body.innerHTML")
        print(html as Any)
        print("hello")
        
        html = webView.stringByEvaluatingJavaScript(from: "document.body.innerHTML")
        print(html as Any)
    }
    
    
    // ロード時にインジケータをまわす
    func webViewDidStartLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        print("indicator on")
    }
    
    // ロード完了でインジケータ非表示
    func webViewDidFinishLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        print("indicator off")
        print("END")
        if !webView.isLoading {
            print(webView.stringByEvaluatingJavaScript(from: "document.URL") as Any)
            self.navigationItem.title = webView.stringByEvaluatingJavaScript(from: "document.title")
            if webView.stringByEvaluatingJavaScript(from: "document.URL") == "https://coursereg.waseda.jp/portal/simpleportal.php?HID_P14=EN"{
                    print("HITT")
                
                        webView.stringByEvaluatingJavaScript(from: "function doSubmit ( strURL, strAuthGp, strAuth, strStatus, strWindow ) {strWindow='_self';intRtnVal=fncControlSubmit ( 10 );if ( intRtnVal == true ){window.open( '','_self','menubar=no,status=yes,scrollbars=yes,location=no,resizable=yes' );document.F01.url.value=strURL;document.F01.HID_P6.value=strAuthGp;document.F01.HID_P8.value=strAuth;document.F01.target='ap';document.F01.pageflag.value=1000;document.F01.status.value=strStatus;document.F01.target='_self';document.F01.submit();} else {alert ( 'ただいま処理中です。OKボタンを押して、しばらく待ってから再度メニューをクリックしてください。' );}}")
//                                        webView.stringByEvaluatingJavaScript(from: "function doSubmit( strURL, strAuthGp, strAuth, strStatus, strWindow ){strWindow = '_self';intRtnVal=fncControlSubmit ( 10 ); if ( intRtnVal == true ) {window.open ( '', strWindow, 'menubar=no,status=yes,scrollbars=yes,location=no,resizable=yes' );document.F01.url.value=strURL;document.F01.HID_P6.value=strAuthGp;document.F01.HID_P8.value=strAuth;document.F01.target='ap'document.F01.pageflag.value=1000;document.F01.status.value=strStatus;document.F01.target='_self';document.F01.submit();} else {alert ( 'ただいま処理中です。OKボタンを押して、しばらく待ってから再度メニューをクリックしてください。' );}}}")
                
                //とりあえずこの下のやつをやれば成績画面は出る。
//                    webView.stringByEvaluatingJavaScript(from: "doSubmit('https://www.wnp12.waseda.jp/kyomu/epb2050.htm', 'eStudent', 'ea02', '1', '_self');")
                
            }
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
