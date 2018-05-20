//
//  Models.swift
//  Help
//
//  Created by Celina Martinez on 5/5/18.
//  Copyright © 2018 Jadapema. All rights reserved.
//

import Foundation
import UIKit

class Contact : NSObject {
    var name : String!
    var givenName : String!
    var parentesco : String!
    var isEmergencyActive : Bool!
    var haveAcount : Bool!
    var phone : String!
    var email : String!
    
    override init() {}
    
    init(name : String,givenName : String, parentesco: String, isEmergencyActive: Bool, haveAcount: Bool, phone: String, email : String!) {
        self.name = name
        self.givenName = givenName
        self.parentesco = parentesco
        self.isEmergencyActive = isEmergencyActive
        self.haveAcount = haveAcount
        self.phone = phone
        self.email = email
    }
}

class User : NSObject {
    var name : String!
    var givenName : String!
    var phone : String?
    var email : String!
    var bloodType : String!
    var aditionalNote : String?
    var diseases : [String]?
    var contacts : [Contact]?
    
    override init() {}
    
}

extension UIView {
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
}
