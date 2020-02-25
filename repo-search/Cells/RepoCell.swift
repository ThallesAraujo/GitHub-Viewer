//
//  RepoCell.swift
//  repo-search
//
//  Created by Thalles Araújo on 24/02/20.
//  Copyright © 2020 Thalles Araújo. All rights reserved.
//

import UIKit

class RepoCell: UITableViewCell {
    
    @IBOutlet weak var lblRepoName: UILabel!
    @IBOutlet weak var lblRepoLanguage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setup(repo: Repo){
        self.lblRepoName.text = repo.name
        self.lblRepoLanguage.text = repo.language
    }

}
