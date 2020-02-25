//
//  UIImageExtension.swift
//  repo-search
//
//  Created by Thalles Araújo on 24/02/20.
//  Copyright © 2020 Thalles Araújo. All rights reserved.
//

import Foundation
import UIKit
extension UIImageView{
    
    func rounded(){
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.height / 2
    }
    
}
