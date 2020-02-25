//
//  CoordinatorExtension.swift
//  repo-search
//
//  Created by Thalles Araújo on 24/02/20.
//  Copyright © 2020 Thalles Araújo. All rights reserved.
//

import Foundation
import UIKit
extension Coordinator{
    
    func getCurrentVC() -> UIViewController{
        return self.navigationController.viewControllers[0]
    }
    
}
