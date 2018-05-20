//
//  ContactsTableViewCell.swift
//  Help
//
//  Created by Celina Martinez on 27/4/18.
//  Copyright © 2018 Jadapema. All rights reserved.
//

import UIKit

class ContactsTableViewCell: UITableViewCell {

    
    let icon = UIImageView()
    let name = UILabel()
    let parentesco = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = UIColor(red: 240/255, green: 233/255, blue: 224/255, alpha: 1)
        
        
        
        icon.translatesAutoresizingMaskIntoConstraints = false
        name.translatesAutoresizingMaskIntoConstraints = false
        parentesco.translatesAutoresizingMaskIntoConstraints = false
        
        name.textAlignment = .left
        name.textColor = UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 1)
        name.font = UIFont(name: "AvenirNext-Medium", size: 16)
        
        parentesco.textAlignment = .left
        parentesco.textColor = UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 1)
        parentesco.font = UIFont(name: "AvenirNext-Medium", size: 16)
        
        contentView.addSubview(icon)
        contentView.addSubview(name)
        contentView.addSubview(parentesco)
        
        let viewsDict = [
            "icon" : icon,
            "name" : name,
            "parentesco" : parentesco,
            ] as [String : Any]
        
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[icon(25)]-|", options: [], metrics: nil, views: viewsDict))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[name]-|", options: [], metrics: nil, views: viewsDict))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[parentesco]-|", options: [], metrics: nil, views: viewsDict))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[icon(20)]-[name(>=80)]-[parentesco(<=80)]-|", options: [], metrics: nil, views: viewsDict))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
