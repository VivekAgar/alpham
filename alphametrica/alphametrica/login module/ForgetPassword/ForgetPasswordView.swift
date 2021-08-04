//
//  ForgetPasswordView.swift
//  alphametrica
//
//  Created by Vivek.Agar on 8/3/21.
//

import Foundation
import UIKit


protocol ForgetPasswordViewProtocol{
    var presenter: ForgetPasswordPresenter? {get set}
    func showErrorMsg(message: String)
    func showLoading()
    func stopLoading()

}

class ForgetPasswordView: UIViewController, ForgetPasswordViewProtocol, UITextFieldDelegate{
    var presenter: ForgetPasswordPresenter?
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    
    @IBAction func submitEmailAction(_ sender: Any) {
        presenter?.submitEmail(email: self.emailTextField.text)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View did load Forget Password")

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        self.emailTextField.delegate = self
        
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

    
    func showErrorMsg(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
                case .default:
                print("default")
                
                case .cancel:
                print("cancel")
                
                case .destructive:
                print("destructive")
                
            @unknown default:
                print("default in Exastuive case Swift 5 feature")
            }
        }))
        self.present(alert, animated: true, completion: nil)
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
    
    func showLoading(){
        indicator.startAnimating()
        indicator.backgroundColor = .white
    }
    
    func stopLoading(){
        indicator.stopAnimating()
        indicator.hidesWhenStopped = true
    }

    
    
    

}
