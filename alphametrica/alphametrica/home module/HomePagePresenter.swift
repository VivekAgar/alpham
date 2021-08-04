//
//  HomePagePresenter.swift
//  alphametrica
//
//  Created by Vivek.Agar on 8/4/21.
//

import Foundation


protocol HomePagePresenterProtocol {
    var view:HomePageView? {get set}
    var interactor: HomePageInteractor? {get set}
    var router: HomePageRouter?{get set}
    func interactorDidFetchedData(With result: Result<Any, Error>)
    func interactordidLoginSuccess(user:LoginUser)

}




class HomePagePresenter: HomePagePresenterProtocol{
    var view: HomePageView?
    
    var interactor: HomePageInteractor?
    
    var router: HomePageRouter?
    
    func interactorDidFetchedData(With result: Result<Any, Error>) {
        
    }
    
    func interactordidLoginSuccess(user: LoginUser) {
        
    }
    
    
    
}
