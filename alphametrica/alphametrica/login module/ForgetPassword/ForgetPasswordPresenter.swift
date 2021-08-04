//
//  ForgetPasswordPresenter.swift
//  alphametrica
//
//  Created by Vivek.Agar on 8/3/21.
//

import Foundation

protocol ForgetPasswordPresenterProtocol {
    var view:ForgetPasswordView? {get set}
    var interactor: ForgetPasswordInteractor? {get set}
    var router: ForgetPasswordRouter?{get set}
    func interactorDidsentCode()
    func unknownuserEmail()
}

class ForgetPasswordPresenter: ForgetPasswordPresenterProtocol{
    
    var interactor: ForgetPasswordInteractor?
    
    var view: ForgetPasswordView?
    
    var router: ForgetPasswordRouter?
    
    
    func submitEmail(email: String?){
        view?.showLoading()
        
        guard let  email = email else {
            view?.stopLoading()
            view?.showErrorMsg(message: "Please enter valid email"); return
        }
        
        if email.isValidEmail{
            interactor?.performForgetPassword(userEmail:email)
        }
        else {
            view?.stopLoading()
            view?.showErrorMsg(message:"Please enter a valid email")
            return
        }
        
    }

    func interactorDidsentCode() {
        view?.stopLoading()
        router?.loadCodeEnterScreen()
    }
    
    
    func unknownuserEmail(){
        view?.stopLoading()
        view?.showErrorMsg(message: "User account this email not found")
        
    }
    
    

    
}
