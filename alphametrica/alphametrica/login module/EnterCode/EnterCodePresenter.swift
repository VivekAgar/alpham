//
//  EnterCodePresenter.swift
//  alphametrica
//
//  Created by Vivek.Agar on 8/4/21.
//

import Foundation

protocol EnterCodePresenterProtocol {
    
    var view:EnterCodeView? {get set}
    var interactor: EnterCodeInteractor? {get set}
    var router: EnterCodeRouter?{get set}
    func interactorDidsentCode()
    func interactorDidVerifiedCode()
    func interactorfaildToVerifyCode()
    
    
}


class EnterCodePresenter: EnterCodePresenterProtocol{
    var interactor: EnterCodeInteractor?
    var view: EnterCodeView?
    var router: EnterCodeRouter?
    
    func interactorDidsentCode() {
        
    }
    
    func verifyCode(submittedCode: String){
        interactor?.validateCode(code: submittedCode)
    }
    
    func interactorDidVerifiedCode(){
        //Code Verified
        router?.routeToNewPassword()
    }
    func interactorfaildToVerifyCode(){
        ////Code not Verified
        //show Error Message
        view?.showErrorMsg(message: "Invalid Code")
        
    }

        
}
