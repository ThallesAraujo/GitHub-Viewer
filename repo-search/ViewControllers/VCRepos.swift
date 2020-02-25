//
//  VCRepos.swift
//  repo-search
//
//  Created by Thalles Araújo on 24/02/20.
//  Copyright © 2020 Thalles Araújo. All rights reserved.
//

import UIKit

class VCRepos: UIViewController, Storyboarded, UITableViewDelegate, UITableViewDataSource {
    
    var requestHandler: RequestHandler?
    
    @IBOutlet weak var tbvRepos: UITableView!
    private var repos: [Repo] = []
    private var user: User?
    @IBOutlet weak var userInfo: UserComponent!
    @IBOutlet weak var lblNoRepos: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tbvRepos.delegate = self
        self.tbvRepos.dataSource = self
        self.tbvRepos.reloadData()
        self.setupHeader()
        if self.repos.count > 0{
            self.tbvRepos.isHidden = false
            self.lblNoRepos.isHidden = true
        }else{
            self.tbvRepos.isHidden = true
            self.lblNoRepos.isHidden = false
        }
    }
    
    func setup(user: User?, repos: [Repo]){
        self.user = user
        self.repos = repos
    }
    
    func setupHeader(){
        self.userInfo.setup(user: self.user!)
        self.userInfo.setBottomBorder()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? self.repos.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "RepoCell") as? RepoCell{
            cell.setup(repo: self.repos[indexPath.row])
            return cell
        }else{
            return RepoCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    

}
