//
//  ForgetPasswordInteractor.swift
//  alphametrica
//
//  Created by Vivek.Agar on 8/3/21.
//

import Foundation
protocol ForgetPasswordInteractorProtocol {
    var presenter: ForgetPasswordPresenter? { get set }
    func performForgetPassword(userEmail:String)
}

class ForgetPasswordInteractor: ForgetPasswordInteractorProtocol{
    
    weak var presenter: ForgetPasswordPresenter?
    
    func performForgetPassword(userEmail: String) {
        //Check in API for a valid User email and send code
        //check api response if all ok
        if userEmail == "test@luxpmsoft.com"{
            presenter?.interactorDidsentCode()
        }
        else {
            presenter?.unknownuserEmail()
        }
    }

    
}
