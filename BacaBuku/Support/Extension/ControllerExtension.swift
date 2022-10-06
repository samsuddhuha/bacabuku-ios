//
//  ControllerExtension.swift
//  BacaBuku
//
//  Created by Paxel on 06/10/22.
//

import Foundation
import UIKit
import NVActivityIndicatorView

extension UIViewController {
    
    func showAlert(_ title: String = "Oops! Something went wrong.", message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle:UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showLoadingView(_ message:String? = nil){
        startAnimating(CGSize(width: 40, height: 40), message: message, messageFont: UIFont.boldSystemFont(ofSize: 18), type: .ballPulse)
    }
    
    func showLoadingView(state:Bool,_ message: String? = nil){
        if state{
             startAnimating(CGSize(width: 40, height: 40), message: message, messageFont: UIFont.boldSystemFont(ofSize: 18), type: .ballPulse)
        }else{
            stopAnimating()
        }
    }
    
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    func hideLoadingView() {
        stopAnimating()
    }
    
    @objc func backButtonPressed() {
        navigationController?.popViewController(animated: true)
    }
}

extension UIViewController:NVActivityIndicatorViewable{
    
}
