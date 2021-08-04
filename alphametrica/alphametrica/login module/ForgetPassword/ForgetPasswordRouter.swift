//
//  ForgetPasswordRouter.swift
//  alphametrica
//
//  Created by Vivek.Agar on 8/3/21.
//

import Foundation
import UIKit
protocol ForgetPasswordRouterProtocol{
    
    var view:ForgetPasswordView?{ get set}
    var navigationController: UINavigationController? {get set}
    static func start()->ForgetPasswordRouterProtocol
    
}

class ForgetPasswordRouter: ForgetPasswordRouterProtocol{
    var view:ForgetPasswordView?
    
    var navigationController: UINavigationController?
    
    static func start() -> ForgetPasswordRouterProtocol {
        let router = ForgetPasswordRouter()
        let view: ForgetPasswordView = ForgetPasswordView.loadFromNib()
        let interactor: ForgetPasswordInteractor = ForgetPasswordInteractor()
        let presenter: ForgetPasswordPresenter = ForgetPasswordPresenter()
        
        interactor.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view

        view.presenter = presenter
        router.view =  view
        return router

    }
    
    
    func loadCodeEnterScreen(){
    
        var router = EnterCodeRouter.start()
        router.navigationController = self.navigationController
        self.navigationController?.pushViewController(router.view!, animated: true)
        
    }
    

}
