//
//  VCMain.swift
//  repo-search
//
//  Created by Thalles Araújo on 24/02/20.
//  Copyright © 2020 Thalles Araújo. All rights reserved.
//

import UIKit

class VCMain: UIViewController, Storyboarded {
    
    var requestHandler: RequestHandler?
    
    @IBOutlet weak var tfSearch: UITextField!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "GitHub Viewer"
        self.spinner.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.backIndicatorImage = nil
        self.navigationController?.navigationBar.shadowImage = nil
    }
    
    @IBAction func didTapSearchButton(_ sender: UIButton) {
       self.requestHandler?.coordinator?.start()
    }
    
    

}
