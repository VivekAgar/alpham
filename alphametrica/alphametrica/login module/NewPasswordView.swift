//
//  NewPasswordView.swift
//  alphametrica
//
//  Created by Vivek.Agar on 8/4/21.
//

import Foundation
import UIKit


protocol NewPasswordViewProtocol {
    
    var presenter: NewPasswordPresenter? {get set}
    func showErrorMsg(message: String)
    func showMessage(message: String)
    func showLoading()
    func stopLoading()
    
}




class NewPasswordView: UIViewController, NewPasswordViewProtocol{
    var presenter: NewPasswordPresenter?

    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func setNewPasswordAction(_ sender: Any) {
    }
    
    
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View did load Set new Password")
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

    }
    
    override func viewDidDisappear(_ animated: Bool) {
            super.viewDidDisappear(animated)
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    var indicator = UIActivityIndicatorView()

    func activityIndicator() {
        indicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        indicator.style = UIActivityIndicatorView.Style.gray
        indicator.center = self.view.center
        self.view.addSubview(indicator)
    }

    
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

    
    
    
// MARK: NewPasswordViewProtocol
    func showErrorMsg(message: String) {
        
    }
    
    func showMessage(message: String) {
        
    }
    
    func showLoading(){
        indicator.startAnimating()
        indicator.backgroundColor = .white
    }
    
    func stopLoading(){
        indicator.stopAnimating()
        indicator.hidesWhenStopped = true
    }

    
    
}
