//
//  MainRequestHandler.swift
//  repo-search
//
//  Created by Thalles Araújo on 24/02/20.
//  Copyright © 2020 Thalles Araújo. All rights reserved.
//

import Foundation
import UIKit
class MainRequestHandler : RequestHandler{
    
    var coordinator: Coordinator?
    private var user: User?
    private var repos : [Repo] = []
    
    
    func getData(completion: @escaping (User?, [Repo]) -> Void ){
        
        if let currentVC = self.coordinator?.getCurrentVC() as? VCMain{
            currentVC.spinner.isHidden = false
            currentVC.spinner.startAnimating()
            
            let dispatcher = DispatchGroup()
            dispatcher.enter()
            self.getUser(completion: {
              dispatcher.leave()
            }, failure: { error in
                self.handleError(error: error)
            })
            dispatcher.enter()
            self.getRepos(completion: {
                dispatcher.leave()
            }) { (error) in
                self.handleError(error: error)
            }
            dispatcher.notify(queue: .main, execute: {
                currentVC.spinner.stopAnimating()
                currentVC.spinner.isHidden = true
                completion(self.user, self.repos)
            })
        }
    }
    
    func handleError(error: String){
        if let vc = self.coordinator?.getCurrentVC() as? VCMain{
            if error.lowercased().contains("not found"){
                vc.spinner.stopAnimating()
                vc.spinner.isHidden = true
                vc.showErrorAlert(error: "User not found. Please enter another name")
            }else{
                vc.showErrorAlert(error: error)
            }
        }
    }
    
    
    func getUser(completion: @escaping () -> Void, failure: @escaping (String) -> Void){
        
        if let vc = self.coordinator?.getCurrentVC() as? VCMain{
            RepoService.getUser(username: vc.tfSearch.text! , success: { (user) in
                self.user = user
                completion()
            }) { (error) in
                failure(error)
            }
        }
    }
    
    func getRepos(completion : @escaping () -> Void, failure: @escaping (String) -> Void){
        if let vc = self.coordinator?.getCurrentVC() as? VCMain{
            RepoService.getRepos(username: vc.tfSearch.text! , success: { (repos) in
                self.repos = repos
                completion()
            }) { (error) in
                failure(error)
            }
        }
    }
    
}
