//
//  LoginInteractor.swift
//  alphametrica
//
//  Created by Vivek.Agar on 8/2/21.
//

import Foundation

protocol LoginInteractorProtocol {

    var presenter: LoginPresenter? { get set }
    func performUserLogin(with userName: String, pasword: String)
}

class LoginInteractor: LoginInteractorProtocol{
    
    
    weak var presenter: LoginPresenter?
    
    func performUserLogin(with userName: String, pasword: String){
    //Can create a URLSession data task to perform login via backend api
    //for now we have fetched data from Model, kept default values in model
        
        let validUser: LoginUser = LoginUser(_userName:"test@luxpmsoft.com" , _password:"test1234!" )
        
        if (userName != validUser.userName){
            presenter?.interactorDidLoginfailed(message: "Invalid User Name !")
            return
        }
        else if (pasword != validUser.password){
            presenter?.interactorDidLoginfailed(message: "Incorrect Password !")
            return
        }
        else if (userName == validUser.userName && pasword == validUser.password)
        {
            presenter?.interactorDidLoginSuccess(user: validUser)
        }
    
    }

    
    
    
}
