//
//  HomePageInteractor.swift
//  alphametrica
//
//  Created by Vivek.Agar on 8/4/21.
//

import Foundation

protocol HomePageInteractorProtocol {
    var presenter: HomePagePresenter? { get set }
}



class HomePageInteractor : HomePageInteractorProtocol{
    weak var presenter: HomePagePresenter?
    
    
}
