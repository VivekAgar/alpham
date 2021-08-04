//
//  EnterCodeRouter.swift
//  alphametrica
//
//  Created by Vivek.Agar on 8/4/21.
//

import Foundation
import UIKit

protocol EnterCodeRouterProtocol{
    var view:EnterCodeView?{ get set}
    var navigationController: UINavigationController? {get set}
    static func start()->EnterCodeRouterProtocol
    
}

class EnterCodeRouter: EnterCodeRouterProtocol{
    var view:EnterCodeView?
    
    var navigationController: UINavigationController?
    
    static func start() -> EnterCodeRouterProtocol {
        let router = EnterCodeRouter()
        let view: EnterCodeView = EnterCodeView.loadFromNib()
        let interactor: EnterCodeInteractor = EnterCodeInteractor()
        let presenter: EnterCodePresenter = EnterCodePresenter()
        
        interactor.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view

        view.presenter = presenter
        router.view =  view
        return router

    }
    
    
    func routeToNewPassword(){
        var router = NewPasswordRouter.start()
        router.navigationController = self.navigationController
        self.navigationController?.pushViewController(router.view!, animated: true)
        

    }
        
}
