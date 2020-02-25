//
//  ReposCoordinator.swift
//  repo-search
//
//  Created by Thalles Araújo on 24/02/20.
//  Copyright © 2020 Thalles Araújo. All rights reserved.
//

import Foundation
import UIKit
class ReposCoordinator: Coordinator{
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = VCRepos.instantiate()
        let requestHandler = MainRequestHandler()
        requestHandler.coordinator = self
        requestHandler.getData(completion: {user, repos in
            vc.setup(user: user, repos: repos)
            self.navigationController.pushViewController(vc, animated: true)
        })
    }
    
    
    
    
}
