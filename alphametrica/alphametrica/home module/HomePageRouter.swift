//
//  HomePageRouter.swift
//  alphametrica
//
//  Created by Vivek.Agar on 8/4/21.
//

import Foundation
import UIKit
protocol HomePageRouterProtocol{
    


var view:HomePageView?{ get set}
var navigationController: UINavigationController? {get set}
static func start()->HomePageRouterProtocol
}

class HomePageRouter: HomePageRouterProtocol{
    var view: HomePageView?
    var navigationController: UINavigationController?
    
    static func start() -> HomePageRouterProtocol {
        let router = HomePageRouter()
        let view: HomePageView = HomePageView.loadFromNib()
        let interactor: HomePageInteractor = HomePageInteractor()
        let presenter: HomePagePresenter = HomePagePresenter()
        
        interactor.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view

        view.presenter = presenter
        router.view =  view
        return router

    }
    
    
}
