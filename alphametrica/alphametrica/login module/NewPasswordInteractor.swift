//
//  NewPasswordInteractor.swift
//  alphametrica
//
//  Created by Vivek.Agar on 8/4/21.
//

import Foundation
protocol NewPasswordInteractorProtocol{
    var presenter: NewPasswordPresenter? { get set }
    func setNewPassword(password: String)
    
}

class NewPasswordInteractor : NewPasswordInteractorProtocol{
    weak var presenter: NewPasswordPresenter?
    
    func setNewPassword(password: String) {
       
    }
    
    
    
    
}
