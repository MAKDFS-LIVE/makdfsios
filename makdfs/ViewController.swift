//
//  ViewController.swift
//  makdfs
//
//  Created by ChafferHub on 25/04/24.
//

import UIKit
import WebKit
import FirebaseAuth

class ViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let request = URLRequest(url: URL(string: "https://m.makdfs.com")!)
        webView.configuration.defaultWebpagePreferences.allowsContentJavaScript = true
        webView?.load(request)
        
        sendCodeToPhone();
    }
    
    func sendCodeToPhone() {
        let phoneNumber = "2244668899"
        print("Attempting to send OTP to \(phoneNumber)")
        
        
        Auth.auth().settings?.isAppVerificationDisabledForTesting = true
        PhoneAuthProvider.provider().verifyPhoneNumber("+91"+phoneNumber, uiDelegate: nil) { verificationID, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            if let verificationID = verificationID {
                //self.verificationID = verificationID
                //self.isCodeSent = true
            } else {
                print("Error: verificationID is nil")
            }
        }
    }
}
