//
//  NewPasswordRoute.swift
//  alphametrica
//
//  Created by Vivek.Agar on 8/4/21.
//

import Foundation
import UIKit

protocol NewPasswordRouteProtocol{
    
    var view: NewPasswordView?{ get set}
    var navigationController: UINavigationController? {get set}
    static func start()->NewPasswordRouteProtocol

    
    
}


class NewPasswordRouter: NewPasswordRouteProtocol{
    var view: NewPasswordView?
    
    var navigationController: UINavigationController?
    
    static func start() -> NewPasswordRouteProtocol {
        let router = NewPasswordRouter()
        let view: NewPasswordView = NewPasswordView.loadFromNib()
        let interactor: NewPasswordInteractor = NewPasswordInteractor()
        let presenter: NewPasswordPresenter = NewPasswordPresenter()
        
        interactor.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view

        view.presenter = presenter
        router.view =  view
        return router

        
    }
    
    
    
    
    
}
