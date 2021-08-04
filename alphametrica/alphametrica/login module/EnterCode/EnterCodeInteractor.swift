//
//  EnterCodeInteractor.swift
//  alphametrica
//
//  Created by Vivek.Agar on 8/4/21.
//

import Foundation

protocol EnterCodeInteractorProtocol {
    var presenter: EnterCodePresenter? { get set }
    func validateCode(code: String) 
}

class EnterCodeInteractor: EnterCodeInteractorProtocol{
    
    
    
    
    
    weak var presenter: EnterCodePresenter?
    
    func performForgetPassword(userEmail: String) {
        //Check in API for a valid User email and send code
        //check api response if all ok
        presenter?.interactorDidsentCode()
    }

    func validateCode(code: String) {
        //Check Code against a default value 12345678
        if code == "12345678"
        {
            presenter?.interactorDidVerifiedCode()
        }
        else{
            presenter?.interactorfaildToVerifyCode()
        }
        
        
        
    }
    
    
    
    
    
}
