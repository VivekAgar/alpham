//
//  LoginRouter.swift
//  alphametrica
//
//  Created by Vivek.Agar on 8/2/21.
//

import Foundation
import UIKit

typealias Entry = LoginView & LoginViewProtocol

protocol LoginRouterProtocol{
    
    var entry: Entry? { get }
    var navigationController: UINavigationController? {get set}
    //This will be entry point
    static func start()->LoginRouterProtocol
    
}


class LoginRouter: LoginRouterProtocol{
    var navigationController: UINavigationController?
    var entry: Entry?
    
    
    static func start() -> LoginRouterProtocol {
        let router = LoginRouter()
        let view: LoginView = LoginView.loadFromNib()
        let interactor: LoginInteractor = LoginInteractor()
        let presenter: LoginPresenter = LoginPresenter()
        
        interactor.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view

        view.presenter = presenter
        router.entry =  view
        return router

    }
    
    func routToForgetPassword(){

        var router = ForgetPasswordRouter.start()
        router.navigationController = self.navigationController
        self.navigationController?.pushViewController(router.view!, animated: true)

    }
    
    func routToHomepage(user: LoginUser){
        var router = HomePageRouter.start()
        router.navigationController = self.navigationController
        self.navigationController?.pushViewController(router.view!, animated: true)
    }
}
