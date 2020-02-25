//
//  MainCoordinator.swift
//
//  Created by Thalles Araújo on 08/02/20.
//  Copyright © 2020 Thalles Araújo. All rights reserved.
//

//Default implementation for Coordinator Pattern
//IMPORTANT: All view controllers identifiers should be setted properly!

import UIKit

class MainCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = VCMain.instantiate()
        let requestHandler = MainRequestHandler.init()
        requestHandler.coordinator = ReposCoordinator(navigationController: self.navigationController)
        vc.requestHandler = requestHandler
        self.navigationController.pushViewController(vc, animated: false)
    }
    

}
