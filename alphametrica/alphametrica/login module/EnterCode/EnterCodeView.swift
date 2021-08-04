//
//  EnterCodeView.swift
//  alphametrica
//
//  Created by Vivek.Agar on 8/4/21.
//

import Foundation
import UIKit

protocol EnterCodeViewProtocol {
    var presenter: EnterCodePresenter? {get set}
    func showErrorMsg(message: String)
    func showLoading()
    func stopLoading()

}



class EnterCodeView: UIViewController, EnterCodeViewProtocol, UITextFieldDelegate{
    var presenter: EnterCodePresenter?
    
    
    @IBOutlet weak var digit1TextField: UITextField!
    @IBOutlet weak var digit2TextField: UITextField!
    @IBOutlet weak var digit3TextField: UITextField!
    @IBOutlet weak var digit4TextField: UITextField!
    @IBOutlet weak var digit5TextField: UITextField!
    @IBOutlet weak var digit6TextField: UITextField!
    @IBOutlet weak var digit7TextField: UITextField!
    @IBOutlet weak var digit8TextField: UITextField!
    @IBAction func verifyAction(_ sender: Any) {
        
    var firstEightdigit = self.digit1TextField.text
        firstEightdigit! += self.digit2TextField.text!
        firstEightdigit! += self.digit3TextField.text!
        firstEightdigit! += self.digit4TextField.text!
        firstEightdigit! += self.digit5TextField.text!
        firstEightdigit! += self.digit6TextField.text!
        firstEightdigit! += self.digit7TextField.text!
        firstEightdigit! += self.digit8TextField.text!
        
        presenter?.verifyCode(submittedCode: firstEightdigit!)
        
    }
    
    
    @IBAction func resendCodeAction(_ sender: Any) {
        
        
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
        self.digit1TextField.delegate = self
        self.digit2TextField.delegate = self
        self.digit3TextField.delegate = self
        self.digit4TextField.delegate = self
        self.digit5TextField.delegate = self
        self.digit6TextField.delegate = self
        self.digit7TextField.delegate = self
        self.digit8TextField.delegate = self
        
    }
    
    var indicator = UIActivityIndicatorView()

    func activityIndicator() {
        indicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        indicator.style = UIActivityIndicatorView.Style.gray
        indicator.center = self.view.center
        self.view.addSubview(indicator)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
            super.viewDidDisappear(animated)
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
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
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            // On inputing value to textfield
            if ((textField.text?.count)! <= 1  && string.count > 0){
                if(textField == self.digit1TextField)
                {
                    self.digit2TextField.becomeFirstResponder()
                }
                if(textField == self.digit2TextField)
                {
                    self.digit3TextField.becomeFirstResponder()
                }
                if(textField == self.digit3TextField)
                {
                    self.digit4TextField.becomeFirstResponder()
                }
                if(textField == digit4TextField)
                {
                    digit5TextField.becomeFirstResponder()
                }
                if(textField == digit5TextField)
                {
                    digit6TextField.becomeFirstResponder()
                }
                if(textField == digit6TextField)
                {
                    digit7TextField.becomeFirstResponder()
                }
                if(textField == digit7TextField)
                {
                    digit8TextField.becomeFirstResponder()
                }

                textField.text = string
                return false
            }
            else if ((textField.text?.count)! >= 1  && string.count == 0){
                // on deleting value from Textfield
                if(textField == digit8TextField)
                {
                    digit7TextField.becomeFirstResponder()
                }
                if(textField == digit7TextField)
                {
                    digit6TextField.becomeFirstResponder()
                }
                if(textField == digit6TextField)
                {
                    digit5TextField.becomeFirstResponder()
                }
                if(textField == digit5TextField)
                {
                    digit4TextField.becomeFirstResponder()
                }
                if(textField == digit4TextField)
                {
                    digit3TextField.becomeFirstResponder()
                }
                if(textField == digit3TextField)
                {
                    digit2TextField.becomeFirstResponder()
                }
                if(textField == digit2TextField)
                {
                    digit1TextField.becomeFirstResponder()
                }
                textField.text = ""
                return false
            }
            else if ((textField.text?.count)! >= 1  )
            {
                textField.text = string
                return false
            }
            return true
        }


}

extension EnterCodeView{
}
