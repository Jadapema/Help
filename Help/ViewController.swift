//
//  ViewController.swift
//  Help
//
//  Created by Celina Martinez on 27/4/18.
//  Copyright © 2018 Jadapema. All rights reserved.
//

// #C23616 - 194 54 22 - Red
// #F0E9E0 - 240 233 224 - White
// #4A4A4A - 74 74 74 - Black
// #337180 - 51 113 128 - Green

import UIKit
import AudioToolbox
import Firebase
import UserNotifications
import MessageUI
import Mailgun_In_Swift
import MailgunSwift


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MFMailComposeViewControllerDelegate {
    
    override var prefersStatusBarHidden: Bool  {
       return true
    }
    
    var contactsArray = [Contact]()
    
    let mainButtonImageView : UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "MainButton"))
        imageView.layer.masksToBounds = false
        imageView.layer.cornerRadius = imageView.layer.bounds.height / 2
        imageView.clipsToBounds = true
        
        return  imageView
    }()
    
    let lblEmergency : UILabel = {
        let label = UILabel()
        label.text = "Presiona el boton si tienes una Emergencia"
        label.textAlignment = .center
        label.textColor = UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 1)
        label.font = UIFont(name: "AvenirNext-Medium", size: 12)
        return label
    }()

    let lblContacts : UILabel = {
        let label = UILabel()
        label.text = "Lista de Contactos de emergencia"
        label.textAlignment = .left
        label.textColor = UIColor(red: 194/255, green: 54/255, blue: 22/255, alpha: 1)
        label.font = UIFont(name: "AvenirNext-Medium", size: 20)
        return label
    }()
    
    let contactsTableView : UITableView = {
       let table = UITableView()
        table.backgroundColor = UIColor(red: 240/255, green: 233/255, blue: 224/255, alpha: 1)
        return table
    }()
    
    let separatorView : UIView = {
       let separator = UIView()
        separator.backgroundColor = UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 1)
        return separator
    }()
    
    let addContactImageView : UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "AddContact"))
        return  imageView
    }()
    
    let emergencyNotificationDiableImageView : UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "Contact"))
        return  imageView
    }()
    
    let emergencyNotificationActiveImageView : UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "ContactRed"))
        return  imageView
    }()
    
    let lblActiveNotification : UILabel = {
        let label = UILabel()
        label.text = "Alguien Necesita tu ayuda"
        label.textAlignment = .center
        label.textColor = UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 1)
        label.font = UIFont(name: "AvenirNext-Medium", size: 8)
        return label
    }()
    
    let editProfileImageView : UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "EditProfile"))
        return  imageView
    }()
    
    let lblEditProfile : UILabel = {
        let label = UILabel()
        label.text = "Editar Perfil"
        label.textAlignment = .center
        label.textColor = UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 1)
        label.font = UIFont(name: "AvenirNext-Medium", size: 8)
        return label
    }()
    
    let ubicacionImageView : UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "Ubicacion"))
        return  imageView
    }()
    
    let lblLongitud : UILabel = {
        let label = UILabel()
        label.text = "Longitud: -86.34567"
        label.textAlignment = .right
        label.textColor = UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 1)
        label.font = UIFont(name: "AvenirNext-Medium", size: 8)
        return label
    }()
    
    let lblLatitud : UILabel = {
        let label = UILabel()
        label.text = "Latitud: 11.83456"
        label.textAlignment = .right
        label.textColor = UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 1)
        label.font = UIFont(name: "AvenirNext-Medium", size: 8)
        return label
    }()
    
    
    let popUpBackView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 0.7)
        return view
    }()
    
    let popUpView : UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9137254902, blue: 0.8784313725, alpha: 1)
        view.layer.masksToBounds = false
        view.layer.cornerRadius = 3
        view.clipsToBounds = true
        return view
    }()
    
    let popUpTopView : UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.7607843137, green: 0.2117647059, blue: 0.0862745098, alpha: 1)
        return view
    }()
    
    let lblTopView : UILabel = {
        let label = UILabel()
        label.text = "Nuevo Contacto"
        label.textAlignment = .left
        label.textColor = UIColor(red: 240/255, green: 233/255, blue: 224/255, alpha: 1)
        label.font = UIFont(name: "AvenirNext-Bold", size: 20)
        return label
    }()
    
    let logoGreenImageView : UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "AddContact"))
        return  imageView
    }()
    
    let nameTextFielf : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Ingresar nombre"
        textField.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
        textField.layer.borderWidth = 1
        textField.layer.borderColor = #colorLiteral(red: 0.7607843137, green: 0.2117647059, blue: 0.0862745098, alpha: 1)
        textField.layer.masksToBounds = false
        textField.layer.cornerRadius = 5
        textField.clipsToBounds = true
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = UITextFieldViewMode.always
        return textField
    }()
    
    let givenNameTextFielf : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Ingresar apellido"
        textField.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
        textField.layer.borderWidth = 1
        textField.layer.borderColor = #colorLiteral(red: 0.7607843137, green: 0.2117647059, blue: 0.0862745098, alpha: 1)
        textField.layer.masksToBounds = false
        textField.layer.cornerRadius = 5
        textField.clipsToBounds = true
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = UITextFieldViewMode.always
        return textField
    }()
    
    let phoneTextFielf : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Ingresar numero de telefono"
        textField.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
        textField.layer.borderWidth = 1
        textField.layer.borderColor = #colorLiteral(red: 0.7607843137, green: 0.2117647059, blue: 0.0862745098, alpha: 1)
        textField.layer.masksToBounds = false
        textField.layer.cornerRadius = 5
        textField.clipsToBounds = true
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = UITextFieldViewMode.always
        return textField
    }()
    
    let emailTextFielf : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Ingresar correo electronico"
        textField.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
        textField.layer.borderWidth = 1
        textField.layer.borderColor = #colorLiteral(red: 0.7607843137, green: 0.2117647059, blue: 0.0862745098, alpha: 1)
        textField.layer.masksToBounds = false
        textField.layer.cornerRadius = 5
        textField.clipsToBounds = true
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = UITextFieldViewMode.always
        return textField
    }()
    
    let parentescoTextFielf : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Que es de usted?"
        textField.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
        textField.layer.borderWidth = 1
        textField.layer.borderColor = #colorLiteral(red: 0.7607843137, green: 0.2117647059, blue: 0.0862745098, alpha: 1)
        textField.layer.masksToBounds = false
        textField.layer.cornerRadius = 5
        textField.clipsToBounds = true
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = UITextFieldViewMode.always
        return textField
    }()
    
    let addView : UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.7607843137, green: 0.2117647059, blue: 0.0862745098, alpha: 1)
        view.layer.masksToBounds = false
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        return view
    }()
    
    let lblAdd : UILabel = {
        let label = UILabel()
        label.text = "Agregar"
        label.textAlignment = .center
        label.textColor = UIColor(red: 240/255, green: 233/255, blue: 224/255, alpha: 1)
        label.font = UIFont(name: "AvenirNext-Bold", size: 20)
        return label
    }()
    
    
    
    var fir = FirebaseController()
    
    
    let generator = UIImpactFeedbackGenerator(style: .heavy)
    
    override func viewWillAppear(_ animated: Bool) {
        self.view.backgroundColor = UIColor(red: 240/255, green: 233/255, blue: 224/255, alpha: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fir.Configuration()
        
        if Auth.auth().currentUser == nil {
            let modalStyle = UIModalTransitionStyle.crossDissolve
            let vc = EntryViewController()
            vc.modalTransitionStyle = modalStyle
            self.present(vc, animated: true, completion: nil)
        }
        
        
       
        
        self.view.addSubview(mainButtonImageView)
        self.view.addSubview(lblEmergency)
        self.view.addSubview(lblContacts)
        self.view.addSubview(contactsTableView)
        contactsTableView.delegate = self
        contactsTableView.dataSource = self
        contactsTableView.register(ContactsTableViewCell.self, forCellReuseIdentifier: "contactsMain")
        self.view.addSubview(separatorView)
        mainButtonImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(mainButtonHandler)))
        mainButtonImageView.isUserInteractionEnabled = true
        self.view.addSubview(addContactImageView)
        addContactImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(addContactButtonHandler)))
        addContactImageView.isUserInteractionEnabled = true
        self.view.addSubview(emergencyNotificationDiableImageView)
        self.view.addSubview(emergencyNotificationActiveImageView)
        emergencyNotificationActiveImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(activeNotificationButtonHandler)))
        emergencyNotificationActiveImageView.isUserInteractionEnabled = true
        self.view.addSubview(lblActiveNotification)
        self.lblActiveNotification.isHidden = true
        self.emergencyNotificationActiveImageView.isHidden = true
        self.view.addSubview(editProfileImageView)
        editProfileImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(editProfileButtonHandler)))
        editProfileImageView.isUserInteractionEnabled = true
        self.view.addSubview(lblEditProfile)
        self.view.addSubview(ubicacionImageView)
        ubicacionImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ubicacionButtonHandler)))
        ubicacionImageView.isUserInteractionEnabled = true
        self.view.addSubview(lblLatitud)
        self.view.addSubview(lblLongitud)
        
        
        
        
        self.view.addSubview(popUpBackView)
        popUpBackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(popUpBackButtonHandler)))
        popUpBackView.isUserInteractionEnabled = true
        popUpBackView.isHidden = true
        self.view.addSubview(popUpView)
        popUpView.isHidden = true
        popUpView.addSubview(popUpTopView)
        popUpTopView.addSubview(lblTopView)
        popUpView.addSubview(logoGreenImageView)
        
        popUpView.addSubview(nameTextFielf)
        nameTextFielf.delegate = self
        nameTextFielf.returnKeyType = .done
        popUpView.addSubview(givenNameTextFielf)
        givenNameTextFielf.delegate = self
        givenNameTextFielf.returnKeyType = .done
        popUpView.addSubview(phoneTextFielf)
        phoneTextFielf.delegate = self
        phoneTextFielf.returnKeyType = .done
        popUpView.addSubview(emailTextFielf)
        emailTextFielf.delegate = self
        emailTextFielf.returnKeyType = .done
        popUpView.addSubview(parentescoTextFielf)
        parentescoTextFielf.delegate = self
        parentescoTextFielf.returnKeyType = .done
        
        popUpView.addSubview(addView)
        addView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(addButtonHandler)))
        addView.isUserInteractionEnabled = true
        addView.addSubview(lblAdd)
        
//        var cont = Contact(name: "Jacob", parentesco: "Amigo", isEmergencyActive: false, haveAcount: false,phone : "50505050", email: "jacob@hotmail.com")
//        contactsArray.append(cont)
//        cont = Contact(name: "Alyson", parentesco: "Esposa", isEmergencyActive: true, haveAcount: true)
//        contactsArray.append(cont)
//        cont = Contact(name: "Mama", parentesco: "Madre", isEmergencyActive: false, haveAcount: true)
//        contactsArray.append(cont)
        
        fir.GetAllMyContacts { (contacts) in
            print("Hello")
            self.contactsArray = contacts
            DispatchQueue.main.async(execute: {
                self.contactsTableView.reloadData()
            })
            
            for c in contacts {
                if c.isEmergencyActive == true && c.haveAcount == true {
//                    self.showNotification()
                    self.lblActiveNotification.isHidden = false
                    self.emergencyNotificationActiveImageView.isHidden = false
                } else {
                    self.lblActiveNotification.isHidden = true
                    self.emergencyNotificationActiveImageView.isHidden = true
                }
            }
            
            
        }
        DispatchQueue.global(qos: .background).async {
            print("This is run on the background queue")
            
            self.fir.GetAllMyContacts { (contacts) in
                for c in contacts {
                    if c.isEmergencyActive == true && c.haveAcount == true {
                        print("show")
                        self.showNotification()
                    }
                }
            
            }
            
//
//            DispatchQueue.main.async {
//                print("This is run on the main queue, after the previous code in outer block")
//
//            }
        }
        
        setupLayout()
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge]) { (didAllow, error) in
            
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
    }
    
    
    @objc func popUpBackButtonHandler() {
        popUpBackView.isHidden = true
        popUpView.isHidden = true
    }
    
    @objc func addButtonHandler() {
        
        print("add")
        
        
        guard nameTextFielf.text! != "" && nameTextFielf.text != nil else {
            print("Ingresar nombre")
            return
        }
        guard givenNameTextFielf.text! != "" && givenNameTextFielf.text != nil else {
            print("Ingresar apellido")
            return
        }
        guard phoneTextFielf.text! != "" && phoneTextFielf.text != nil else {
            print("Ingresar Phone")
            return
        }
        guard emailTextFielf.text! != "" && emailTextFielf.text != nil else {
            print("Ingresar email")
            return
        }
        guard parentescoTextFielf.text! != "" && parentescoTextFielf.text != nil else {
            print("Ingresar parentesco")
            return
        }
        
        
        let contact = Contact(name: nameTextFielf.text!, givenName: givenNameTextFielf.text!, parentesco: parentescoTextFielf.text!, isEmergencyActive: false, haveAcount: false, phone: phoneTextFielf.text!, email: emailTextFielf.text!)
        fir.addContact(contact: contact) { (isContactAdded) in
            if isContactAdded {
                print("Contact Added")
                self.nameTextFielf.text = nil
                self.givenNameTextFielf.text = nil
                self.phoneTextFielf.text = nil
                self.emailTextFielf.text = nil
                self.parentescoTextFielf.text = nil
                self.popUpBackView.isHidden = true
                self.popUpView.isHidden = true
            }
        }
        
    }
    
    @objc func mainButtonHandler () {
        print("Main Button")
        
//        sendEmail()
        test()
        
      
        
//        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
//        let modalStyle = UIModalTransitionStyle.crossDissolve
//        let vc = EmergencyStateViewController()
//        vc.modalTransitionStyle = modalStyle
//        self.present(vc, animated: true, completion: nil)
//        showNotification()
//        let content = UNMutableNotificationContent()
//        content.title = "Alguien necesita ayuda!"
//        content.subtitle = "Porfavor ve a ayudarlo!"
//        content.body = "Este es el cuerpo de la notificacion"
//        content.badge = 1
//
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
//        let request = UNNotificationRequest(identifier: "timerDone", content: content, trigger: trigger)
//        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
    }
    
    func test() {
        
//        let mailgun = MailgunAPI(apiKey: "37252008be46ee3f296209929597b9f7", clientDomain: "sandboxc6ae7cab44824c12b8bb5c7f42ef213e.mailgun.org")
//
//        mailgun.sendEmail(to: "jadapema@gmail.com", from: "Help <jadapema@hotmail.com>", subject: "Alguien necesita tu ayuda", bodyHTML: "Jacob!, Un contacto tuyo necesita de tu ayuda, ingresa a la aplicaion para ver su ubicacion!") { mailgunResult in
//
//            if mailgunResult.success{
//                print("Email was sent")
//            }
//
//        }
        
        let message = MailgunMessage(from:"Excited User <jadapema@hotmail.org>",
                                     to:"Jay Baird <jadapema@gmail.com>",
                                     message:"Mailgun is awesome!",
                                     body:"Mailgun is great, here is a picture of a cat.")
//        message.add(image: someImage, named: "image01", type: .jpeg)

        let mailgun = Mailgun(apiKey: "key-37252008be46ee3f296209929597b9f7", domain: "mg.jadapema.com")
        mailgun.send(message: message) { result in
            switch result {
            case .success(let messageId):
                print("Success")
                print(messageId)
            case .failure(let error):
                print("Fail")
                print(error)
            }
        }
        
//        let session = URLSession.shared
//        let request = NSMutableURLRequest(url: NSURL(string: "https://api.mailgun.net/v3/sandboxc6ae7cab44824c12b8bb5c7f42ef213e.mailgun.org/messages")! as URL)
//
//        request.httpMethod = "POST"
//        let credentials = "api:key-37252008be46ee3f296209929597b9f7"
//        request.setValue("Basic \(credentials.toBase64())", forHTTPHeaderField: "Authorization")
//
//        let data = "from:'Mailgun Sandbox <postmaster@sandboxc6ae7cab44824c12b8bb5c7f42ef213e.mailgun.org>'&to:'jacob <jadapema@hotmail.com>'&subject:'Alguien necesita tu ayuda'&text:'Jacob!, Un contacto tuyo necesita de tu ayuda, ingresa a la aplicaion para ver su ubicacion!'"
//        request.httpBody = data.data(using: String.Encoding.ascii)
//
//        let task = session.dataTask(with: request as URLRequest, completionHandler: {(data, response, error) in
//            if let error = error {
//                print(error.localizedDescription)
//            }
//            if let response = response {
//                print("url = \(response.url!)")
//                print("response = \(response)")
//                let httpResponse = response as! HTTPURLResponse
//                print("response code = \(httpResponse.statusCode)")
//            }
//        })
//        task.resume()
    }
    
    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["jadapema@gmail.com"])
            mail.setMessageBody("<p>You're so awesome!</p>", isHTML: true)
            
            present(mail, animated: true)
        } else {
            // show failure alert
            print("error sending the email")
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    
    func showNotification () {
        let content = UNMutableNotificationContent()
        content.title = "Alguien necesita ayuda!"
        content.subtitle = "Porfavor ve a ayudarlo!"
        content.body = "Este es el cuerpo de la notificacion"
        content.sound = UNNotificationSound.default()
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "repeating", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)

    }
    
    @objc func addContactButtonHandler() {
        print("Add Contact")
        popUpBackView.isHidden = false
        popUpView.isHidden = false
        generator.impactOccurred()
       
    }
    
    @objc func editProfileButtonHandler() {
        print("Edit Profile")
        generator.impactOccurred()
        
        UIView.animate(withDuration: 1, animations: {
            let y = self.mainButtonImageView.frame.width
            let th = self.contactsTableView.frame.height
            self.mainButtonImageView.frame.size.height = 0
            self.mainButtonImageView.frame.size.width = 0
            self.mainButtonImageView.center.y += y/2
            self.mainButtonImageView.center.x += y/2
            self.mainButtonImageView.layer.masksToBounds = false
            self.mainButtonImageView.layer.cornerRadius = self.mainButtonImageView.layer.bounds.height / 2
            self.mainButtonImageView.clipsToBounds = true
            self.addContactImageView.center.x += 100
            self.lblContacts.center.x -= 400
            self.lblEmergency.frame.size.height = 0
            self.contactsTableView.center.y += th + 50
            self.emergencyNotificationDiableImageView.center.y -= 200
            self.emergencyNotificationActiveImageView.center.y -= 200
            self.lblActiveNotification.frame.size.height = 0
            self.editProfileImageView.center.x += 200
            self.lblEditProfile.center.x += 200
            self.ubicacionImageView.center.x -= 200
            self.lblLatitud.center.x -= 200
            self.lblLongitud.center.x -= 200
            self.separatorView.center.y += th + 50
        }, completion: { (finish) in
            if finish {
                let modalStyle = UIModalTransitionStyle.crossDissolve
                let vc = EditProfileViewController()
                vc.modalTransitionStyle = modalStyle
                self.present(vc, animated: true, completion: nil)
                for v in self.view.subviews {
                    v.isHidden = true
                }
            }
        })
        
        
    }
    
    @objc func ubicacionButtonHandler() {
        print("Ubicacion")
//        generator.impactOccurred()
    }
    
    @objc func activeNotificationButtonHandler() {
        print("Active!")
        generator.impactOccurred()
        let modalStyle = UIModalTransitionStyle.crossDissolve
        let vc = contactEmergencyViewController()
        vc.modalTransitionStyle = modalStyle
        self.present(vc, animated: true, completion: nil)
    }
    
    private func setupLayout () {
        
        ubicacionImageView.translatesAutoresizingMaskIntoConstraints = false
        ubicacionImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20).isActive = true
        ubicacionImageView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30).isActive = true
        ubicacionImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        ubicacionImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        lblLongitud.translatesAutoresizingMaskIntoConstraints = false
        lblLongitud.topAnchor.constraint(equalTo: lblLatitud.bottomAnchor, constant: 0).isActive = true
        lblLongitud.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
        
        lblLatitud.translatesAutoresizingMaskIntoConstraints = false
        lblLatitud.topAnchor.constraint(equalTo: ubicacionImageView.bottomAnchor, constant: 5).isActive = true
        lblLatitud.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
        
        emergencyNotificationDiableImageView.translatesAutoresizingMaskIntoConstraints = false
        emergencyNotificationDiableImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20).isActive = true
        emergencyNotificationDiableImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        emergencyNotificationDiableImageView.heightAnchor.constraint(equalToConstant: 45).isActive = true
        emergencyNotificationDiableImageView.widthAnchor.constraint(equalToConstant: 35).isActive = true
        
        emergencyNotificationActiveImageView.translatesAutoresizingMaskIntoConstraints = false
        emergencyNotificationActiveImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20).isActive = true
        emergencyNotificationActiveImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        emergencyNotificationActiveImageView.heightAnchor.constraint(equalToConstant: 45).isActive = true
        emergencyNotificationActiveImageView.widthAnchor.constraint(equalToConstant: 35).isActive = true
        
        lblActiveNotification.translatesAutoresizingMaskIntoConstraints = false
        lblActiveNotification.topAnchor.constraint(equalTo: emergencyNotificationActiveImageView.bottomAnchor, constant: 0).isActive = true
        lblActiveNotification.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        
        editProfileImageView.translatesAutoresizingMaskIntoConstraints = false
        editProfileImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 17).isActive = true
        editProfileImageView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30).isActive = true
        editProfileImageView.heightAnchor.constraint(equalToConstant: 55).isActive = true
        editProfileImageView.widthAnchor.constraint(equalToConstant: 35).isActive = true
        
        lblEditProfile.translatesAutoresizingMaskIntoConstraints = false
        lblEditProfile.topAnchor.constraint(equalTo: editProfileImageView.bottomAnchor, constant: 0).isActive = true
        lblEditProfile.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -25).isActive = true
        
        mainButtonImageView.translatesAutoresizingMaskIntoConstraints = false
        mainButtonImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        mainButtonImageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -100).isActive = true
        mainButtonImageView.widthAnchor.constraint(equalToConstant: 186).isActive = true
        mainButtonImageView.heightAnchor.constraint(equalToConstant: 186).isActive = true
        
        lblEmergency.translatesAutoresizingMaskIntoConstraints = false
        lblEmergency.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        lblEmergency.topAnchor.constraint(equalTo: mainButtonImageView.bottomAnchor, constant: 0).isActive = true
        lblEmergency.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        lblEmergency.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        lblEmergency.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        lblContacts.translatesAutoresizingMaskIntoConstraints = false
        lblContacts.bottomAnchor.constraint(equalTo: separatorView.topAnchor, constant: 0).isActive = true
        lblContacts.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10).isActive = true
        lblContacts.rightAnchor.constraint(equalTo: addContactImageView.leftAnchor, constant: 0).isActive = true
        lblContacts.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        addContactImageView.translatesAutoresizingMaskIntoConstraints = false
        addContactImageView.bottomAnchor.constraint(equalTo: separatorView.topAnchor, constant: -5).isActive = true
        addContactImageView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -10).isActive = true
        addContactImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        addContactImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        separatorView.bottomAnchor.constraint(equalTo: contactsTableView.topAnchor, constant: 0).isActive = true
        separatorView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 5).isActive = true
        separatorView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -5).isActive = true
        separatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        contactsTableView.translatesAutoresizingMaskIntoConstraints = false
        contactsTableView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        contactsTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        contactsTableView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10).isActive = true
        contactsTableView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -10).isActive = true
        contactsTableView.heightAnchor.constraint(equalToConstant: (self.view.bounds.height * 0.25)).isActive = true
        
        popUpBackView.translatesAutoresizingMaskIntoConstraints = false
        popUpBackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0).isActive = true
        popUpBackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        popUpBackView.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        popUpBackView.heightAnchor.constraint(equalToConstant: self.view.frame.height).isActive = true
        
        popUpView.translatesAutoresizingMaskIntoConstraints = false
        popUpView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0).isActive = true
        popUpView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        popUpView.widthAnchor.constraint(equalToConstant: self.view.frame.width - 20).isActive = true
        popUpView.heightAnchor.constraint(equalToConstant: self.view.frame.height * 0.56).isActive = true
        
        popUpTopView.translatesAutoresizingMaskIntoConstraints = false
        popUpTopView.topAnchor.constraint(equalTo: popUpView.topAnchor, constant: 0).isActive = true
        popUpTopView.leftAnchor.constraint(equalTo: popUpView.leftAnchor, constant: 0).isActive = true
        popUpTopView.rightAnchor.constraint(equalTo: popUpView.rightAnchor, constant: 0).isActive = true
        popUpTopView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        lblTopView.translatesAutoresizingMaskIntoConstraints = false
        lblTopView.topAnchor.constraint(equalTo: popUpTopView.topAnchor, constant: 7).isActive = true
        lblTopView.leftAnchor.constraint(equalTo: popUpTopView.leftAnchor, constant: 10).isActive = true
        
        logoGreenImageView.translatesAutoresizingMaskIntoConstraints = false
        logoGreenImageView.topAnchor.constraint(equalTo: popUpTopView.bottomAnchor, constant: 10).isActive = true
        logoGreenImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        logoGreenImageView.widthAnchor.constraint(equalToConstant: 55).isActive = true
        logoGreenImageView.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
        nameTextFielf.translatesAutoresizingMaskIntoConstraints = false
        nameTextFielf.topAnchor.constraint(equalTo: logoGreenImageView.bottomAnchor, constant: 12).isActive = true
        nameTextFielf.leftAnchor.constraint(equalTo: popUpView.leftAnchor, constant: 10).isActive = true
        nameTextFielf.rightAnchor.constraint(equalTo: popUpView.rightAnchor, constant: -10).isActive = true
        nameTextFielf.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        givenNameTextFielf.translatesAutoresizingMaskIntoConstraints = false
        givenNameTextFielf.topAnchor.constraint(equalTo: nameTextFielf.bottomAnchor, constant: 10).isActive = true
        givenNameTextFielf.leftAnchor.constraint(equalTo: popUpView.leftAnchor, constant: 10).isActive = true
        givenNameTextFielf.rightAnchor.constraint(equalTo: popUpView.rightAnchor, constant: -10).isActive = true
        givenNameTextFielf.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        phoneTextFielf.translatesAutoresizingMaskIntoConstraints = false
        phoneTextFielf.topAnchor.constraint(equalTo: givenNameTextFielf.bottomAnchor, constant: 10).isActive = true
        phoneTextFielf.leftAnchor.constraint(equalTo: popUpView.leftAnchor, constant: 10).isActive = true
        phoneTextFielf.rightAnchor.constraint(equalTo: popUpView.rightAnchor, constant: -10).isActive = true
        phoneTextFielf.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        emailTextFielf.translatesAutoresizingMaskIntoConstraints = false
        emailTextFielf.topAnchor.constraint(equalTo: phoneTextFielf.bottomAnchor, constant: 10).isActive = true
        emailTextFielf.leftAnchor.constraint(equalTo: popUpView.leftAnchor, constant: 10).isActive = true
        emailTextFielf.rightAnchor.constraint(equalTo: popUpView.rightAnchor, constant: -10).isActive = true
        emailTextFielf.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        parentescoTextFielf.translatesAutoresizingMaskIntoConstraints = false
        parentescoTextFielf.topAnchor.constraint(equalTo: emailTextFielf.bottomAnchor, constant: 10).isActive = true
        parentescoTextFielf.leftAnchor.constraint(equalTo: popUpView.leftAnchor, constant: 10).isActive = true
        parentescoTextFielf.rightAnchor.constraint(equalTo: popUpView.rightAnchor, constant: -10).isActive = true
        parentescoTextFielf.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        addView.translatesAutoresizingMaskIntoConstraints = false
        addView.bottomAnchor.constraint(equalTo: popUpView.bottomAnchor, constant: -10).isActive = true
        addView.leftAnchor.constraint(equalTo: popUpView.leftAnchor, constant: 20).isActive = true
        addView.rightAnchor.constraint(equalTo: popUpView.rightAnchor, constant: -20).isActive = true
        addView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        lblAdd.translatesAutoresizingMaskIntoConstraints = false
        lblAdd.topAnchor.constraint(equalTo: addView.topAnchor, constant: 7).isActive = true
        lblAdd.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = contactsTableView.dequeueReusableCell(withIdentifier: "contactsMain") as! ContactsTableViewCell
        let haveAccount = contactsArray[indexPath.row].haveAcount
        let isEmergencyActive = contactsArray[indexPath.row].isEmergencyActive
        if (isEmergencyActive != nil && haveAccount != nil && contactsArray[indexPath.row].parentesco != nil && contactsArray[indexPath.row].name != nil) {
            if isEmergencyActive! {
                cell.icon.image = #imageLiteral(resourceName: "ContactRed")
            } else if haveAccount! {
                cell.icon.image = #imageLiteral(resourceName: "ContactYellow")
            } else {
                cell.icon.image = #imageLiteral(resourceName: "Contact")
            }
            cell.name.text = contactsArray[indexPath.row].name
            cell.parentesco.text = "(\(contactsArray[indexPath.row].parentesco!))"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        nameTextFielf.resignFirstResponder()
        givenNameTextFielf.resignFirstResponder()
        phoneTextFielf.resignFirstResponder()
        emailTextFielf.resignFirstResponder()
        parentescoTextFielf.resignFirstResponder()
    }
    
}


extension ViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextFielf.resignFirstResponder()
        givenNameTextFielf.resignFirstResponder()
        phoneTextFielf.resignFirstResponder()
        emailTextFielf.resignFirstResponder()
        parentescoTextFielf.resignFirstResponder()
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == parentescoTextFielf {
            UIView.animate(withDuration: 0.21) {
                self.view.frame.origin.y -= 50
            }
        } else if textField == emailTextFielf {
            UIView.animate(withDuration: 0.21) {
                self.view.frame.origin.y -= 50
            }
        }
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == parentescoTextFielf {
            UIView.animate(withDuration: 0.21) {
                self.view.frame.origin.y += 50
            }
        } else if textField == emailTextFielf {
            UIView.animate(withDuration: 0.21) {
                self.view.frame.origin.y += 50
            }
        }
    }

}

extension String {
    
    func fromBase64() -> String? {
        guard let data = Data(base64Encoded: self) else {
            return nil
        }
        
        return String(data: data, encoding: .utf8)
    }
    
    func toBase64() -> String {
        return Data(self.utf8).base64EncodedString()
    }
}


