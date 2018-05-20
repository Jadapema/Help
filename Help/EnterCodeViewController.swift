//
//  EnterCodeViewController.swift
//  Help
//
//  Created by Celina Martinez on 7/5/18.
//  Copyright © 2018 Jadapema. All rights reserved.
//

import UIKit
import Firebase

class EnterCodeViewController: UIViewController {

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    let logoImageView : UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "MainButton"))
        return  imageView
    }()
    
    let lblTop : UILabel = {
        let label = UILabel()
        label.text = "Ingresa el codigo que se ha enviado a tu telefono"
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.7607843137, green: 0.2117647059, blue: 0.0862745098, alpha: 1)
        label.font = UIFont(name: "AvenirNext-Medium", size: 16)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    let lblPhoneTop : UILabel = {
        let label = UILabel()
        label.text = "+50586900863"
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.7607843137, green: 0.2117647059, blue: 0.0862745098, alpha: 1)
        label.font = UIFont(name: "AvenirNext-Bold", size: 16)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    let lblWrongNumber : UILabel = {
        let label = UILabel()
        label.text = "+50586900863 \n no es tu numero?"
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.9411764706, green: 0.9137254902, blue: 0.8784313725, alpha: 1)
        label.font = UIFont(name: "AvenirNext-Medium", size: 14)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    let lblResend : UILabel = {
        let label = UILabel()
        label.text = "Reenviar Codigo"
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.9411764706, green: 0.9137254902, blue: 0.8784313725, alpha: 1)
        label.font = UIFont(name: "AvenirNext-Medium", size: 16)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    let codeTextFielf : UITextField = {
        let textField = UITextField()
        textField.backgroundColor = #colorLiteral(red: 0.7607843137, green: 0.2117647059, blue: 0.0862745098, alpha: 1)
        textField.attributedPlaceholder = NSAttributedString(string: "Ingresa el codigo",
                                                             attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.9411764706, green: 0.9137254902, blue: 0.8784313725, alpha: 1)])
        textField.textColor = #colorLiteral(red: 0.9411764706, green: 0.9137254902, blue: 0.8784313725, alpha: 1)
        textField.textAlignment = .center
        textField.keyboardType = .numberPad
        textField.keyboardAppearance = .dark
        textField.font = UIFont(name: "AvenirNext-Bold", size: 20)
        textField.layer.borderWidth = 2
        textField.layer.borderColor = #colorLiteral(red: 0.9411764706, green: 0.9137254902, blue: 0.8784313725, alpha: 1)
        textField.layer.masksToBounds = false
        textField.layer.cornerRadius = 5
        textField.clipsToBounds = true
//        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
//        textField.leftView = paddingView
//        textField.leftViewMode = UITextFieldViewMode.always
        return textField
    }()
    
    let bgView : UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.7607843137, green: 0.2117647059, blue: 0.0862745098, alpha: 1)
        return view
    }()
    
    
    let indicatorStackView : UIStackView = {
        let stack = UIStackView()
        stack.axis = UILayoutConstraintAxis.horizontal
        stack.distribution = UIStackViewDistribution.equalSpacing
        stack.alignment = UIStackViewAlignment.center
        stack.spacing = 10
        
        for i in 0...2 {
            if i == 1 {
                let view = UIView()
                view.backgroundColor = #colorLiteral(red: 0.2, green: 0.4431372549, blue: 0.5019607843, alpha: 1)
                view.layer.borderWidth = 1
                view.layer.borderColor = #colorLiteral(red: 0.9411764706, green: 0.9137254902, blue: 0.8784313725, alpha: 1)
                view.layer.masksToBounds = false
                view.layer.cornerRadius = 5
                view.clipsToBounds = true
                view.heightAnchor.constraint(equalToConstant: 10).isActive = true
                view.widthAnchor.constraint(equalToConstant: 10).isActive = true
                stack.addArrangedSubview(view)
                
            } else {
                let view = UIView()
                view.layer.borderWidth = 1
                view.layer.borderColor = #colorLiteral(red: 0.9411764706, green: 0.9137254902, blue: 0.8784313725, alpha: 1)
                view.layer.masksToBounds = false
                view.layer.cornerRadius = 5
                view.clipsToBounds = true
                view.heightAnchor.constraint(equalToConstant: 10).isActive = true
                view.widthAnchor.constraint(equalToConstant: 10).isActive = true
                view.backgroundColor = #colorLiteral(red: 0.7607843137, green: 0.2117647059, blue: 0.0862745098, alpha: 1)
                stack.addArrangedSubview(view)
                
            }
        }
        
        return stack
    }()
    
    let continueLabel : UILabel = {
        let label = UILabel()
        label.backgroundColor = #colorLiteral(red: 0.7607843137, green: 0.2117647059, blue: 0.0862745098, alpha: 1)
        label.text = "Continuar"
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.9411764706, green: 0.9137254902, blue: 0.8784313725, alpha: 1)
        label.font = UIFont(name: "AvenirNext-Bold", size: 16)
        label.layer.borderWidth = 2
        label.layer.borderColor = #colorLiteral(red: 0.9411764706, green: 0.9137254902, blue: 0.8784313725, alpha: 1)
        label.layer.masksToBounds = false
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        return label
    }()
    
    let fir = FirebaseController()
    let phone = UserDefaults.standard.string(forKey: "phone")
    var UtilitiesRef = Utilities()
    
    override func viewWillAppear(_ animated: Bool) {
        self.view.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9137254902, blue: 0.8784313725, alpha: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fir.Configuration()
        self.view.addSubview(logoImageView)
        self.view.addSubview(lblTop)
        self.view.addSubview(lblPhoneTop)
        lblPhoneTop.text = "\(phone!)"
        self.view.addSubview(bgView)
        bgView.addSubview(lblWrongNumber)
        lblWrongNumber.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(wrongNumberButtonHandler)))
        lblWrongNumber.isUserInteractionEnabled = true
        lblWrongNumber.text = "\(phone!) \n no es tu numero?"
        bgView.addSubview(lblResend)
        lblResend.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(resendButtonHandler)))
        lblResend.isUserInteractionEnabled = true
        bgView.addSubview(indicatorStackView)
        bgView.addSubview(continueLabel)
        continueLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(continueButtonHandler)))
        continueLabel.isUserInteractionEnabled = true
        bgView.addSubview(codeTextFielf)
        setupLayout()
    }
    private func setupLayout () {
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 12).isActive = true
        logoImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 61).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 61).isActive = true
        
        lblTop.translatesAutoresizingMaskIntoConstraints = false
        lblTop.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 5).isActive = true
        lblTop.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        lblTop.heightAnchor.constraint(equalToConstant: 25).isActive = true
        lblTop.widthAnchor.constraint(equalToConstant: self.view.frame.width * 0.95).isActive = true
        
        lblPhoneTop.translatesAutoresizingMaskIntoConstraints = false
        lblPhoneTop.topAnchor.constraint(equalTo: lblTop.bottomAnchor, constant: 0).isActive = true
        lblPhoneTop.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        lblPhoneTop.heightAnchor.constraint(equalToConstant: 25).isActive = true
        lblPhoneTop.widthAnchor.constraint(equalToConstant: self.view.frame.width * 0.95).isActive = true
        
        bgView.translatesAutoresizingMaskIntoConstraints = false
        bgView.topAnchor.constraint(equalTo: lblPhoneTop.bottomAnchor, constant: 20).isActive = true
        bgView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        bgView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        bgView.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        
        indicatorStackView.translatesAutoresizingMaskIntoConstraints = false
        indicatorStackView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -15).isActive = true
        indicatorStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        indicatorStackView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        indicatorStackView.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        continueLabel.translatesAutoresizingMaskIntoConstraints = false
        continueLabel.bottomAnchor.constraint(equalTo: indicatorStackView.topAnchor, constant: -15).isActive = true
        continueLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        continueLabel.rightAnchor.constraint(equalTo: bgView.rightAnchor, constant: -20).isActive = true
        continueLabel.leftAnchor.constraint(equalTo: bgView.leftAnchor, constant: 20).isActive = true
        continueLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        lblWrongNumber.translatesAutoresizingMaskIntoConstraints = false
        lblWrongNumber.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 20).isActive = true
        lblWrongNumber.leftAnchor.constraint(equalTo: bgView.leftAnchor, constant: 20).isActive = true
        lblWrongNumber.heightAnchor.constraint(equalToConstant: 50).isActive = true
        lblWrongNumber.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        lblResend.translatesAutoresizingMaskIntoConstraints = false
        lblResend.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 20).isActive = true
        lblResend.rightAnchor.constraint(equalTo: bgView.rightAnchor, constant: -20).isActive = true
        lblResend.heightAnchor.constraint(equalToConstant: 30).isActive = true
        lblResend.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        codeTextFielf.translatesAutoresizingMaskIntoConstraints = false
        codeTextFielf.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        codeTextFielf.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0).isActive = true
        codeTextFielf.leftAnchor.constraint(equalTo: bgView.leftAnchor, constant: 10).isActive = true
        codeTextFielf.rightAnchor.constraint(equalTo: bgView.rightAnchor, constant: -10).isActive = true
        codeTextFielf.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
    
    @objc func continueButtonHandler () {
        print("Continue")
        guard self.codeTextFielf.text != nil && self.codeTextFielf.text != "" else {
            UtilitiesRef.littleDownMovement(view: self.codeTextFielf)
            return
        }
        
//        let verificationID = UserDefaults.standard.string(forKey: "authVerificationID")
//
//        let credential = PhoneAuthProvider.provider().credential(
//            withVerificationID: verificationID!,
//            verificationCode: codeTextFielf.text!)
//
//        Auth.auth().signIn(with: credential) { (user, error) in
//            if let error = error {
//                // ...
//                print("Error Singing : \(error.localizedDescription)")
//                return
//            }
//
//            print("User Signed")
//
//            let phone = UserDefaults.standard.string(forKey: "phone")
//            self.fir.checkIfContactExist(phone: "\(phone!)", completion: { (exist) in
//                if exist {
//                    let modalStyle = UIModalTransitionStyle.crossDissolve
//                    let vc = ViewController()
//                    vc.modalTransitionStyle = modalStyle
//                    self.present(vc, animated: true, completion: nil)
//                } else {
        
        //Set phone number in "UsersPhones"-UserId:Phone and "Users"-UserId-"Phone":Phone (Database)
//        fir.addPhone(phone: "\(phone!)")
        
//                    let modalStyle = UIModalTransitionStyle.crossDissolve
//                    let vc = EntryViewController()
//                    vc.modalTransitionStyle = modalStyle
//                    self.present(vc, animated: true, completion: nil)
//                }
//            })
//    }
        
            let modalStyle = UIModalTransitionStyle.crossDissolve
            let vc = EntryViewController()
            vc.modalTransitionStyle = modalStyle
            self.present(vc, animated: true, completion: nil)

        
        
    }
    
    @objc func wrongNumberButtonHandler () {
        let modalStyle = UIModalTransitionStyle.crossDissolve
        let vc = EnterPhoneViewController()
        vc.modalTransitionStyle = modalStyle
        self.present(vc, animated: true, completion: nil)
    }
    @objc func resendButtonHandler () {
        print("resend \(phone!)")
        PhoneAuthProvider.provider().verifyPhoneNumber(phone!, uiDelegate: nil) { (verificationID, error) in
            if let error = error {
                print("Error: \(String(error.localizedDescription))")
                return
            }
            UserDefaults.standard.set(verificationID, forKey: "authVerificationID")
            print("VerificationId: \(String(describing: verificationID!))")
            // Sign in using the verificationID and the code sent to the user
            // ...
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.codeTextFielf.resignFirstResponder()
    }
}

extension EnterCodeViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        codeTextFielf.resignFirstResponder()
        return true
    }
}

