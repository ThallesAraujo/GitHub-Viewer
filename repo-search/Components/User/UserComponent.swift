//
//  UserComponent.swift
//  repo-search
//
//  Created by Thalles Araújo on 24/02/20.
//  Copyright © 2020 Thalles Araújo. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class UserComponent: UIView{
    
    @IBOutlet weak var userPhoto: UIImageView?

    @IBOutlet weak var lblUsername: UILabel?
    @IBOutlet var containerView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        let name = String(describing: type(of: self))
        let nib = UINib(nibName: name, bundle: .main)
        nib.instantiate(withOwner: self, options: nil)
        
        self.addSubview(self.containerView)
        self.containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.containerView.topAnchor.constraint(equalTo: self.topAnchor),
            self.containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            ])
    }
    
    func setup(user: User){
        self.userPhoto!.kf.setImage(with: URL.init(string: user.profilePhoto ), placeholder: UIImage.init(named: "user_placeholder"), options: [.forceRefresh], progressBlock: nil, completionHandler: nil)
        self.userPhoto?.rounded()
        self.lblUsername?.text = user.name.count > 0 ? user.name : "Unnamed"
    }
    
    func setBottomBorder() {
        let lineView = UIView()
        lineView.backgroundColor = UIColor.init(hex: "#C8C7CC")
        lineView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(lineView)
        
        
        let metrics = ["width" : NSNumber(value: 0.5)]
        let views = ["lineView" : lineView]
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[lineView]|", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))
        
        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[lineView(width)]|", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))
    }
    
}

