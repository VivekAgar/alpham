//
//  LoginPresenter.swift
//  alphametrica
//
//  Created by Vivek.Agar on 8/2/21.
//

import Foundation



protocol LoginPresenterProtocol {
    var view:LoginView? {get set}
    var interactor: LoginInteractor? {get set}
    var router: LoginRouter?{get set}
    func interactorDidFetchedData(With result: Result<Any, Error>)
    func interactorDidLoginSuccess(user:LoginUser)
    
}

class LoginPresenter : LoginPresenterProtocol{
    
    
    var view: LoginView?
    var interactor: LoginInteractor?
    var router: LoginRouter?

    func interactorDidFetchedData(With result: Result<Any, Error>) {
        
    
    }
// MARK: Login
    func performLogin(email: String?, password:String?){
        
        view?.showLoading()
        //Validations For a valid Email and Password TextFields
        guard let email  = email  else {
            view?.stopLoading()
            view?.showErrorMsg(message:"Please enter a valid email")
            return
        }
        
        guard let password  = password  else {
            view?.stopLoading()
            view?.showErrorMsg(message:"Please enter Password")
            return
        }
        
        if email.isValidEmail{
            interactor?.performUserLogin(with:email, pasword:password)
        }
        else {
            view?.stopLoading()
            view?.showErrorMsg(message:"Please enter a valid email")
            return
        }
        //router?.routToForgetPassword()
    }
    
    func interactorDidLoginfailed(message: String){
        view?.stopLoading()
        view?.showErrorMsg(message: message)
    }
    
    func interactorDidLoginSuccess(user: LoginUser) {
        router?.routToHomepage(user: user)
    }
// MARK: Forget Password
    func onForgetPassword(){
        router?.routToForgetPassword()
    }

// MARK: Signup
    //Move to SignUP Flow
    func onSignUp(){
        
    }
}


extension String {
    var isValidEmail: Bool {
        NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: self)
    }
}
