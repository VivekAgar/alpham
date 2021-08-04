//
//  NewPasswordPresenter.swift
//  alphametrica
//
//  Created by Vivek.Agar on 8/4/21.
//

import Foundation

protocol NewPasswordPresenterProtocol {
    var view:NewPasswordView? {get set}
    var interactor: NewPasswordInteractor? {get set}
    var router: NewPasswordRouter?{get set}
    func interactorDidSentNewPassword()
    
}

class NewPasswordPresenter: NewPasswordPresenterProtocol{
    
    
    var view: NewPasswordView?
    var interactor: NewPasswordInteractor?
    var router: NewPasswordRouter?
    
    func interactorDidSentNewPassword() {
        view?.stopLoading()
        view?.showMessage(message: "Password set Succesfully)")
    }
    
    func setNewPassword(password: String)
    {
        view?.showLoading()
        //Todo : validations for password Rule
        interactor?.setNewPassword(password: password)
    }
    
    
}
