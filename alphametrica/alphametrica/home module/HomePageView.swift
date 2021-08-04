//
//  HomePageView.swift
//  alphametrica
//
//  Created by Vivek.Agar on 8/4/21.
//

import Foundation
import UIKit

protocol HomePageViewProtocol {
    var presenter: HomePagePresenter? {get set}
    func updateViewWithData(data : Any)
    func showErrorMsg(error: Error)
}



class HomePageView: UIViewController, HomePageViewProtocol{
    var presenter: HomePagePresenter?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View did load")
        print("View did load3")
        
    }

    
    
    func updateViewWithData(data: Any) {
        
    }
    
    func showErrorMsg(error: Error) {
        
    }
    
    

}
