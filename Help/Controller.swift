//
//  Controller.swift
//  Help
//
//  Created by Celina Martinez on 5/5/18.
//  Copyright © 2018 Jadapema. All rights reserved.
//

import Foundation
import Firebase

class FirebaseController {
    
    var myId : String!
    
    var UtilitiesRef = Utilities()
    
    // Main Reference to Firebase Database
    var mainDbRef : DatabaseReference {
        return Database.database().reference()
    }
    // Main reference to Firebase Storage
    var mainStRef : StorageReference {
        return Storage.storage().reference(forURL: "gs://classroom-19991.appspot.com/")
    }
    
    public func Configuration () {
        myId = (Auth.auth().currentUser?.uid)!
    }
    
    public func isAnyContactInEmergency () {
        
    }
    
    public func getUserIdFromPhoneNumber (phone: String, completion : @escaping (_ : String) -> Void) {
        Database.database().reference().observeSingleEvent(of: .value, with: { (snapshot) in
            //Creamos un diccionario con la base de datos completa
            if let dictionary = snapshot.value as? [String:AnyObject] {
                //Creamos un diccionario con la seccion de los Usuarios
                if let usersPhones = dictionary["UsersPhones"] as? Dictionary<String,AnyObject> {
                    //Recorremos la seccion de usuarios con un ciclo para obtener el valor de cada uno
                    var helper = ""
                    for (id,value) in usersPhones {
                        if let eachPhone = value as? String {
                            if eachPhone == phone {
                                helper = id
                            }
                        }
                    }
                    completion(helper)
                }
            }
        })
    }
    
    public func GetAllMyContacts (completion : @escaping (_ : [Contact]) -> Void) {
        // Call of firebase Database
        Database.database().reference().observe(.value, with: { snapshot in
            var allContacts = [Contact]()
            // Create a Dictionary with all the snapshot
            if let dictionary = snapshot.value as? [String:AnyObject] {
                // Create a Dictionary only with the books
                if let users = dictionary["Users"] as? Dictionary<String,AnyObject> {
                    for (k,v) in users {
                        if k == self.myId {
                            if let _ = users[k] as? Dictionary<String,AnyObject> {
                                if let myContacts = v["Contacts"] as? Dictionary<String,AnyObject> {
                                    for (phone, value) in  myContacts {
                                        let contact = Contact()
                                        contact.phone = phone
                                        if let email = value["Phone"] as? String {
                                            contact.email = email
                                        }
                                        if let name = value["Name"] as? String {
                                            contact.name = name
                                        }
                                        if let givenName = value["GivenName"] as? String {
                                            contact.givenName = givenName
                                        }
                                        if let parentesco = value["Parentesco"] as? String {
                                            contact.parentesco = parentesco
                                        }
                                        if let isEmergencyActive = value["IsEmergencyActive"] as? Bool {
                                            contact.isEmergencyActive = isEmergencyActive
                                        }
                                        if let haveAcount = value["HaveAcount"] as? Bool {
                                            contact.haveAcount = haveAcount
                                        }
                                        
                                        allContacts.append(contact)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            completion(allContacts)
        })
    }
    
    
    public func getMyUserInfo (completion : @escaping (_ : User) -> Void) {
        // Call of firebase Database
        Database.database().reference().observe(.value, with: { snapshot in
            // Create a Dictionary with all the snapshot
            if let dictionary = snapshot.value as? [String:AnyObject] {
                // Create a Dictionary only with the books
                if let users = dictionary["Users"] as? Dictionary<String,AnyObject> {
                    for (k,v) in users {
                        if k == self.myId {
                            if let _ = users[k] as? Dictionary<String,AnyObject> {
                                if let profile = v["Profile"] as? Dictionary<String,AnyObject> {
                                    let user = User()
                                    if let name = profile["Name"] as? String {
                                        user.name = name
                                    }
                                    if let givenName = profile["GivenName"] as? String {
                                        user.givenName = givenName
                                    }
                                    if let email = profile["Email"] as? String {
                                        user.email = email
                                    }
                                    if let bloodType = profile["BloodType"] as? String {
                                        user.bloodType = bloodType
                                    }
                                    if let note = profile["AditionalNote"] as? String {
                                        user.aditionalNote = note
                                    }
                                    if let diseases = profile["Diseases"] as? Dictionary<String,String> {
                                        var sick = [String]()
                                        for (_,sickness) in diseases {
                                           sick.append(sickness)
                                        }
                                        user.diseases = sick
                                    }
                                    completion(user)
                                }
                            }
                        }
                    }
                }
            }
        })
    }
    
    public func addContact (contact : Contact, completion : @escaping (_ : Bool) -> Void) {
        let ref =  Database.database().reference().child("Users").child("\(myId!)").child("Contacts").child("\(contact.phone!)")
        ref.child("Name").setValue(contact.name)
        ref.child("GivenName").setValue(contact.givenName)
        ref.child("Email").setValue(contact.email)
        ref.child("Parentesco").setValue(contact.parentesco)
        ref.child("IsEmergencyActive").setValue(false)
        checkIfContactExist(phone: contact.phone!) { (contactExist) in
            ref.child("HaveAcount").setValue(contactExist)
            completion(true)
        }
    }
    
    public func addSickness (sick : String) {
        let ref =  Database.database().reference().child("Users").child("\(myId!)").child("Profile").child("Diseases").child("\(UtilitiesRef.randomAlphaNumericString(length: 10))")
        ref.setValue(sick)
    }

    //Set phone number in "UsersPhones"-UserId:Phone and "Users"-UserId-"Phone":Phone (Database)
    
    public func addPhone (phone : String) {
        Database.database().reference().child("Users").child("\(myId!)").child("Profile").child("Phone").setValue(phone)
        Database.database().reference().child("UsersPhones").child("\(myId!)").setValue(phone)
    }
    
    // add to "Users"-UserID-"Profile" -> "Name","GivenName", "Email", "BloodType", "Diseases"
    
    public func addProfileInfo (myUser : User) {
        let ref =  Database.database().reference().child("Users").child("\(myId!)").child("Profile")
        ref.child("Name").setValue(myUser.name!)
        ref.child("GivenName").setValue(myUser.givenName!)
        ref.child("Email").setValue(myUser.email!)
        ref.child("BloodType").setValue(myUser.bloodType!)
        for s in myUser.diseases! {
            addSickness(sick: s)
        }
        ref.child("AditionalNote").setValue(myUser.aditionalNote!)
    }
    
    public func updateProfile (myUser : User) {
        let ref =  Database.database().reference().child("Users").child("\(myId!)").child("Profile")
        ref.child("Name").setValue(myUser.name!)
        ref.child("GivenName").setValue(myUser.givenName!)
        ref.child("Email").setValue(myUser.email!)
        ref.child("BloodType").setValue(myUser.bloodType!)
        for s in myUser.diseases! {
            addSickness(sick: s)
        }
        ref.child("AditionalNote").setValue(myUser.aditionalNote!)
    }
    
    public func checkIfContactExist (phone : String, completion : @escaping (_ : Bool) -> Void ) {
        Database.database().reference().observeSingleEvent(of: .value, with: { (snapshot) in
            //Creamos un diccionario con la base de datos completa
            if let dictionary = snapshot.value as? [String:AnyObject] {
                //Creamos un diccionario con la seccion de los Usuarios
                if let usersPhones = dictionary["UsersPhones"] as? Dictionary<String,AnyObject> {
                    //Recorremos la seccion de usuarios con un ciclo para obtener el valor de cada uno
                    var helper = false
                    for (_,value) in usersPhones {
                        if let eachPhone = value as? String {
                            if eachPhone == phone {
                                helper = true
                            }
                        }
                    }
                    completion(helper)
                }
            }
        })
    }
    
    public func removeMyDiseases (completion : @escaping (_ : Bool) -> Void) {
        Database.database().reference().child("Users").child("\(myId!)").child("Profile").child("Diseases").removeValue { (error, dbRef) in
            if error == nil {
                completion(true)
                print(dbRef)
            } else {
                completion(false)
            }
        }
    }
    
}

class Utilities {
    
    //Return a random Alphanumeric Number With a length
    public func randomAlphaNumericString(length: Int) -> String {
        let allowedChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let allowedCharsCount = UInt32(allowedChars.characters.count)
        var randomString = ""
        for _ in 0..<length {
            let randomNum = Int(arc4random_uniform(allowedCharsCount))
            let randomIndex = allowedChars.index(allowedChars.startIndex, offsetBy: randomNum)
            let newCharacter = allowedChars[randomIndex]
            randomString += String(newCharacter)
        }
        return randomString
    }
    
    public func littleDownMovement (view : UIView) {
        let time = 0.2
        UIView.animate(withDuration: time, animations: {
            view.center.y += 5
        }) { (finished) in
            UIView.animate(withDuration: time, animations: {
                view.center.y -= 5
            })
        }
    }
    
    
    // validate an email for the right format
    public func isValidEmail(email:String?) -> Bool {
        
        guard email != nil else { return false }
        
        let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let pred = NSPredicate(format:"SELF MATCHES %@", regEx)
        return pred.evaluate(with: email)
    }

}
