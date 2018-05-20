//
//  EntryViewController.swift
//  Help
//
//  Created by Celina Martinez on 29/4/18.
//  Copyright © 2018 Jadapema. All rights reserved.
//

// #C23616 - 194 54 22 - Red
// #F0E9E0 - 240 233 224 - White
// #4A4A4A - 74 74 74 - Black
// #337180 - 51 113 128 - Green

import UIKit
import Firebase

class EntryViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    let logoImageView : UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "MainButton"))
        return  imageView
    }()
    
    let lblTop : UILabel = {
        let label = UILabel()
        label.text = "Es necesario que ingreses estos datos para continuar"
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.7607843137, green: 0.2117647059, blue: 0.0862745098, alpha: 1)
        label.font = UIFont(name: "AvenirNext-Medium", size: 16)
        return label
    }()
    
    let nameTextFielf : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Ingresa tu nombre"
        textField.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
        textField.layer.borderWidth = 1
        textField.layer.borderColor = #colorLiteral(red: 0.7607843137, green: 0.2117647059, blue: 0.0862745098, alpha: 1)
        textField.layer.masksToBounds = false
        textField.layer.cornerRadius = 5
        textField.clipsToBounds = true
        textField.keyboardType = .alphabet
        textField.keyboardAppearance = .dark
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = UITextFieldViewMode.always
        return textField
    }()
    
    let givenNameTextFielf : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Ingresa tu apellido"
        textField.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
        textField.layer.borderWidth = 1
        textField.layer.borderColor = #colorLiteral(red: 0.7607843137, green: 0.2117647059, blue: 0.0862745098, alpha: 1)
        textField.layer.masksToBounds = false
        textField.layer.cornerRadius = 5
        textField.clipsToBounds = true
        textField.keyboardType = .alphabet
        textField.keyboardAppearance = .dark
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = UITextFieldViewMode.always
        return textField
    }()
    
    let emailTextFielf : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Ingresa tu correo electronico"
        textField.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
        textField.layer.borderWidth = 1
        textField.layer.borderColor = #colorLiteral(red: 0.7607843137, green: 0.2117647059, blue: 0.0862745098, alpha: 1)
        textField.layer.masksToBounds = false
        textField.layer.cornerRadius = 5
        textField.clipsToBounds = true
        textField.keyboardType = .emailAddress
        textField.keyboardAppearance = .dark
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = UITextFieldViewMode.always
        return textField
    }()
    
    let lblTypeBlood : UILabel = {
        let label = UILabel()
        label.text = "Tipo de Sangre"
        label.textAlignment = .left
        label.textColor = #colorLiteral(red: 0.7607843137, green: 0.2117647059, blue: 0.0862745098, alpha: 1)
        label.font = UIFont(name: "AvenirNext-Medium", size: 18)
        return label
    }()
    
    let bloodStackView : UIStackView = {
        let types = ["O-","O+","A-","A+","B-","B+","AB-","AB+"]
        let stack = UIStackView()
        stack.axis = UILayoutConstraintAxis.horizontal
        stack.distribution = UIStackViewDistribution.equalSpacing
        stack.alignment = UIStackViewAlignment.center
        stack.spacing = 10
        
        for t in types {
            let label = UILabel()
            label.text = t
            label.textAlignment = .center
            label.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
            label.backgroundColor = UIColor(red: 240/255, green: 233/255, blue: 224/255, alpha: 1)
            label.font = UIFont(name: "AvenirNext-Medium", size: 18)
            label.layer.borderWidth = 2
            label.layer.borderColor = #colorLiteral(red: 0.7607843137, green: 0.2117647059, blue: 0.0862745098, alpha: 1)
            label.layer.masksToBounds = false
            label.layer.cornerRadius = 5
            label.clipsToBounds = true
            label.heightAnchor.constraint(equalToConstant: 35).isActive = true
            if t == "AB-" || t == "AB+" {
                label.widthAnchor.constraint(equalToConstant: 43).isActive = true
            } else {
                label.widthAnchor.constraint(equalToConstant: 35).isActive = true
            }
            stack.addArrangedSubview(label)
        }
        return stack
    }()
    
    let lblEnfermedades : UILabel = {
        let label = UILabel()
        label.text = "Enfermedades o Alergias (Opcional)"
        label.textAlignment = .left
        label.textColor = #colorLiteral(red: 0.7607843137, green: 0.2117647059, blue: 0.0862745098, alpha: 1)
        label.font = UIFont(name: "AvenirNext-Medium", size: 18)
        return label
    }()
    
    let addSicknessImageView : UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "AddSickness"))
        return  imageView
    }()
    
    let sicknessTableView : UITableView = {
        let table = UITableView()
        table.backgroundColor = UIColor(red: 240/255, green: 233/255, blue: 224/255, alpha: 1)
        return table
    }()
    
    let lblNota : UILabel = {
        let label = UILabel()
        label.text = "Nota Adicional (Opcional)"
        label.textAlignment = .left
        label.textColor = #colorLiteral(red: 0.7607843137, green: 0.2117647059, blue: 0.0862745098, alpha: 1)
        label.font = UIFont(name: "AvenirNext-Medium", size: 18)
        return label
    }()
    
    let separatorView1 : UIView = {
        let separator = UIView()
        separator.backgroundColor = #colorLiteral(red: 0.7607843137, green: 0.2117647059, blue: 0.0862745098, alpha: 1)
        return separator
    }()
    
    let noteTextView : UITextView = {
        let textView = UITextView()
        textView.backgroundColor = UIColor(red: 240/255, green: 233/255, blue: 224/255, alpha: 1)
        textView.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
        textView.keyboardAppearance = .dark
        textView.font = UIFont(name: "AvenirNext-Medium", size: 14)
        return textView
    }()
    
    let separatorView2 : UIView = {
        let separator = UIView()
        separator.backgroundColor = #colorLiteral(red: 0.7607843137, green: 0.2117647059, blue: 0.0862745098, alpha: 1)
        return separator
    }()
    
    let saveView : UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.7607843137, green: 0.2117647059, blue: 0.0862745098, alpha: 1)
        view.layer.masksToBounds = false
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        return view
    }()
    
    let lblSave : UILabel = {
        let label = UILabel()
        label.text = "Usar App!"
        label.textAlignment = .center
        label.textColor = UIColor(red: 240/255, green: 233/255, blue: 224/255, alpha: 1)
        label.font = UIFont(name: "AvenirNext-Bold", size: 20)
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
        label.text = "Nueva Enfermedad"
        label.textAlignment = .left
        label.textColor = UIColor(red: 240/255, green: 233/255, blue: 224/255, alpha: 1)
        label.font = UIFont(name: "AvenirNext-Bold", size: 20)
        return label
    }()
    
    let logoGreenImageView : UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "LogoGreen"))
        return  imageView
    }()
    
    let lblSickness : UILabel = {
        let label = UILabel()
        label.text = "Si eres alergico a algun medicamento o padeces de una enfermedad describela aquí."
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.7607843137, green: 0.2117647059, blue: 0.0862745098, alpha: 1)
        label.font = UIFont(name: "AvenirNext-Medium", size: 16)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    let separatorView3 : UIView = {
        let separator = UIView()
        separator.backgroundColor = #colorLiteral(red: 0.7607843137, green: 0.2117647059, blue: 0.0862745098, alpha: 1)
        return separator
    }()
    
    let sickTextView : UITextView = {
        let textView = UITextView()
        textView.backgroundColor = UIColor(red: 240/255, green: 233/255, blue: 224/255, alpha: 1)
        textView.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
        textView.keyboardAppearance = .dark
        textView.font = UIFont(name: "AvenirNext-Medium", size: 14)
        return textView
    }()
    
    let separatorView4 : UIView = {
        let separator = UIView()
        separator.backgroundColor = #colorLiteral(red: 0.7607843137, green: 0.2117647059, blue: 0.0862745098, alpha: 1)
        return separator
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
    
    let indicatorStackView : UIStackView = {
        let stack = UIStackView()
        stack.axis = UILayoutConstraintAxis.horizontal
        stack.distribution = UIStackViewDistribution.equalSpacing
        stack.alignment = UIStackViewAlignment.center
        stack.spacing = 10
        
        for i in 0...2 {
            if i == 2 {
                let view = UIView()
                view.backgroundColor = #colorLiteral(red: 0.2, green: 0.4431372549, blue: 0.5019607843, alpha: 1)
                view.layer.masksToBounds = false
                view.layer.cornerRadius = 5
                view.clipsToBounds = true
                view.heightAnchor.constraint(equalToConstant: 10).isActive = true
                view.widthAnchor.constraint(equalToConstant: 10).isActive = true
                stack.addArrangedSubview(view)
                
            } else {
                let view = UIView()
                view.layer.borderWidth = 1
                view.layer.borderColor = #colorLiteral(red: 0.7607843137, green: 0.2117647059, blue: 0.0862745098, alpha: 1)
                view.layer.masksToBounds = false
                view.layer.cornerRadius = 5
                view.clipsToBounds = true
                view.heightAnchor.constraint(equalToConstant: 10).isActive = true
                view.widthAnchor.constraint(equalToConstant: 10).isActive = true
                view.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9137254902, blue: 0.8784313725, alpha: 1)
                stack.addArrangedSubview(view)
                
            }
        }
        return stack
    }()
    
    let phone = UserDefaults.standard.string(forKey: "phone")
    var diseases = [String]()
    var fir = FirebaseController()
    var bloodType = ""
    var UtilitiesRef = Utilities()
    
    override func viewWillAppear(_ animated: Bool) {
        self.view.backgroundColor = UIColor(red: 240/255, green: 233/255, blue: 224/255, alpha: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fir.Configuration()
        self.view.addSubview(logoImageView)
        self.view.addSubview(lblTop)
        self.view.addSubview(nameTextFielf)
        nameTextFielf.delegate = self
        nameTextFielf.returnKeyType = .done
        self.view.addSubview(givenNameTextFielf)
        givenNameTextFielf.delegate = self
        givenNameTextFielf.returnKeyType = .done
        self.view.addSubview(emailTextFielf)
        emailTextFielf.delegate = self
        emailTextFielf.returnKeyType = .done
        self.view.addSubview(lblTypeBlood)
        self.view.addSubview(bloodStackView)
        self.view.addSubview(lblEnfermedades)
        self.view.addSubview(addSicknessImageView)
        addSicknessImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(addSicknessButtonHandler)))
        addSicknessImageView.isUserInteractionEnabled = true
        self.view.addSubview(sicknessTableView)
        sicknessTableView.delegate = self
        sicknessTableView.dataSource = self
        sicknessTableView.register(UITableViewCell.self, forCellReuseIdentifier: "sick")
        sicknessTableView.rowHeight = UITableViewAutomaticDimension
        sicknessTableView.estimatedRowHeight = 44
        self.view.addSubview(lblNota)
        self.view.addSubview(separatorView1)
        self.view.addSubview(noteTextView)
        noteTextView.delegate = self
        self.view.addSubview(separatorView2)
        self.view.addSubview(saveView)
        saveView.addSubview(lblSave)
        saveView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(saveButtonHandler)))
        saveView.isUserInteractionEnabled = true
        bloodStackView.arrangedSubviews[0].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(bloodSelectionHandler0)))
        bloodStackView.arrangedSubviews[0].isUserInteractionEnabled = true
        bloodStackView.arrangedSubviews[1].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(bloodSelectionHandler1)))
        bloodStackView.arrangedSubviews[1].isUserInteractionEnabled = true
        bloodStackView.arrangedSubviews[2].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(bloodSelectionHandler2)))
        bloodStackView.arrangedSubviews[2].isUserInteractionEnabled = true
        bloodStackView.arrangedSubviews[3].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(bloodSelectionHandler3)))
        bloodStackView.arrangedSubviews[3].isUserInteractionEnabled = true
        bloodStackView.arrangedSubviews[4].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(bloodSelectionHandler4)))
        bloodStackView.arrangedSubviews[4].isUserInteractionEnabled = true
        bloodStackView.arrangedSubviews[5].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(bloodSelectionHandler5)))
        bloodStackView.arrangedSubviews[5].isUserInteractionEnabled = true
        bloodStackView.arrangedSubviews[6].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(bloodSelectionHandler6)))
        bloodStackView.arrangedSubviews[6].isUserInteractionEnabled = true
        bloodStackView.arrangedSubviews[7].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(bloodSelectionHandler7)))
        bloodStackView.arrangedSubviews[7].isUserInteractionEnabled = true
        
        print("Hello World")
        self.view.addSubview(indicatorStackView)
        self.view.addSubview(popUpBackView)
        popUpBackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(popUpBackButtonHandler)))
        popUpBackView.isUserInteractionEnabled = true
        popUpBackView.isHidden = true
        self.view.addSubview(popUpView)
        popUpView.isHidden = true
        popUpView.addSubview(popUpTopView)
        popUpTopView.addSubview(lblTopView)
        popUpView.addSubview(logoGreenImageView)
        popUpView.addSubview(lblSickness)
        popUpView.addSubview(separatorView3)
        popUpView.addSubview(sickTextView)
        popUpView.addSubview(separatorView4)
        popUpView.addSubview(addView)
        addView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(addButtonHandler)))
        addView.isUserInteractionEnabled = true
        addView.addSubview(lblAdd)
        
        
        
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
        
        nameTextFielf.translatesAutoresizingMaskIntoConstraints = false
        nameTextFielf.topAnchor.constraint(equalTo: lblTop.bottomAnchor, constant: 12).isActive = true
        nameTextFielf.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10).isActive = true
        nameTextFielf.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -10).isActive = true
        nameTextFielf.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        givenNameTextFielf.translatesAutoresizingMaskIntoConstraints = false
        givenNameTextFielf.topAnchor.constraint(equalTo: nameTextFielf.bottomAnchor, constant: 10).isActive = true
        givenNameTextFielf.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10).isActive = true
        givenNameTextFielf.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -10).isActive = true
        givenNameTextFielf.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        emailTextFielf.translatesAutoresizingMaskIntoConstraints = false
        emailTextFielf.topAnchor.constraint(equalTo: givenNameTextFielf.bottomAnchor, constant: 10).isActive = true
        emailTextFielf.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10).isActive = true
        emailTextFielf.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -10).isActive = true
        emailTextFielf.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        lblTypeBlood.translatesAutoresizingMaskIntoConstraints = false
        lblTypeBlood.topAnchor.constraint(equalTo: emailTextFielf.bottomAnchor, constant: 5).isActive = true
        lblTypeBlood.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 15).isActive = true
        lblTypeBlood.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        bloodStackView.translatesAutoresizingMaskIntoConstraints = false
        bloodStackView.topAnchor.constraint(equalTo: lblTypeBlood.bottomAnchor, constant: 5).isActive = true
        bloodStackView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
        bloodStackView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20).isActive = true
        bloodStackView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        lblEnfermedades.translatesAutoresizingMaskIntoConstraints = false
        lblEnfermedades.topAnchor.constraint(equalTo: bloodStackView.bottomAnchor, constant: 10).isActive = true
        lblEnfermedades.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 15).isActive = true
        lblEnfermedades.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        addSicknessImageView.translatesAutoresizingMaskIntoConstraints = false
        addSicknessImageView.topAnchor.constraint(equalTo: bloodStackView.bottomAnchor, constant: 10).isActive = true
        addSicknessImageView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -10).isActive = true
        addSicknessImageView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        addSicknessImageView.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
        sicknessTableView.translatesAutoresizingMaskIntoConstraints = false
        sicknessTableView.topAnchor.constraint(equalTo:lblEnfermedades.bottomAnchor, constant: 0).isActive = true
        sicknessTableView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -10).isActive = true
        sicknessTableView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10).isActive = true
        sicknessTableView.heightAnchor.constraint(equalToConstant: self.view.frame.height * 0.18).isActive = true
        
        lblNota.translatesAutoresizingMaskIntoConstraints = false
        lblNota.topAnchor.constraint(equalTo: sicknessTableView.bottomAnchor, constant: 0).isActive = true
        lblNota.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 15).isActive = true
        lblNota.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        separatorView1.translatesAutoresizingMaskIntoConstraints = false
        separatorView1.topAnchor.constraint(equalTo: lblNota.bottomAnchor, constant: 0).isActive = true
        separatorView1.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        separatorView1.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        separatorView1.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        noteTextView.translatesAutoresizingMaskIntoConstraints = false
        noteTextView.topAnchor.constraint(equalTo: separatorView1.bottomAnchor, constant: 5).isActive = true
        noteTextView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        noteTextView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        noteTextView.heightAnchor.constraint(equalToConstant: self.view.frame.height * 0.18).isActive = true
        
        separatorView2.translatesAutoresizingMaskIntoConstraints = false
        separatorView2.topAnchor.constraint(equalTo: noteTextView.bottomAnchor, constant: 0).isActive = true
        separatorView2.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        separatorView2.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        separatorView2.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        saveView.translatesAutoresizingMaskIntoConstraints = false
        saveView.bottomAnchor.constraint(equalTo: indicatorStackView.topAnchor, constant: -15).isActive = true
        saveView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
        saveView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20).isActive = true
        saveView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        lblSave.translatesAutoresizingMaskIntoConstraints = false
        lblSave.topAnchor.constraint(equalTo: saveView.topAnchor, constant: 7).isActive = true
        lblSave.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        
        
        popUpBackView.translatesAutoresizingMaskIntoConstraints = false
        popUpBackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0).isActive = true
        popUpBackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        popUpBackView.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        popUpBackView.heightAnchor.constraint(equalToConstant: self.view.frame.height).isActive = true
        
        popUpView.translatesAutoresizingMaskIntoConstraints = false
        popUpView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0).isActive = true
        popUpView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        popUpView.widthAnchor.constraint(equalToConstant: self.view.frame.width - 20).isActive = true
        popUpView.heightAnchor.constraint(equalToConstant: self.view.frame.height * 0.4).isActive = true
        
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
        
        lblSickness.translatesAutoresizingMaskIntoConstraints = false
        lblSickness.topAnchor.constraint(equalTo: logoGreenImageView.bottomAnchor, constant: 0).isActive = true
        lblSickness.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        lblSickness.widthAnchor.constraint(equalToConstant: self.view.frame.width - 40).isActive = true
        lblSickness.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        separatorView3.translatesAutoresizingMaskIntoConstraints = false
        separatorView3.topAnchor.constraint(equalTo: lblSickness.bottomAnchor, constant: 0).isActive = true
        separatorView3.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        separatorView3.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        separatorView3.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        sickTextView.translatesAutoresizingMaskIntoConstraints = false
        sickTextView.topAnchor.constraint(equalTo: separatorView3.bottomAnchor, constant: 5).isActive = true
        sickTextView.leftAnchor.constraint(equalTo: popUpView.leftAnchor, constant: 0).isActive = true
        sickTextView.rightAnchor.constraint(equalTo: popUpView.rightAnchor, constant: 0).isActive = true
        sickTextView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        separatorView4.translatesAutoresizingMaskIntoConstraints = false
        separatorView4.topAnchor.constraint(equalTo: sickTextView.bottomAnchor, constant: 0).isActive = true
        separatorView4.leftAnchor.constraint(equalTo: popUpView.leftAnchor, constant: 0).isActive = true
        separatorView4.rightAnchor.constraint(equalTo: popUpView.rightAnchor, constant: 0).isActive = true
        separatorView4.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        addView.translatesAutoresizingMaskIntoConstraints = false
        addView.bottomAnchor.constraint(equalTo: popUpView.bottomAnchor, constant: -10).isActive = true
        addView.leftAnchor.constraint(equalTo: popUpView.leftAnchor, constant: 20).isActive = true
        addView.rightAnchor.constraint(equalTo: popUpView.rightAnchor, constant: -20).isActive = true
        addView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        lblAdd.translatesAutoresizingMaskIntoConstraints = false
        lblAdd.topAnchor.constraint(equalTo: addView.topAnchor, constant: 7).isActive = true
        lblAdd.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        
        indicatorStackView.translatesAutoresizingMaskIntoConstraints = false
        indicatorStackView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -15).isActive = true
        indicatorStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        indicatorStackView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        indicatorStackView.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
    }
    
    @objc func addSicknessButtonHandler () {
        print("addSickness")
        popUpBackView.isHidden = false
        popUpView.isHidden = false
    }
    
    @objc func saveButtonHandler () {

        guard self.nameTextFielf.text != nil && self.nameTextFielf.text != "" else {
            nameTextFielf.backgroundColor = #colorLiteral(red: 0.7607843137, green: 0.2117647059, blue: 0.0862745098, alpha: 1)
            nameTextFielf.textColor = #colorLiteral(red: 0.9411764706, green: 0.9137254902, blue: 0.8784313725, alpha: 1)
            nameTextFielf.attributedPlaceholder = NSAttributedString(string: "Ingresa tu nombre",
                                                                 attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.9411764706, green: 0.9137254902, blue: 0.8784313725, alpha: 1)])

            UtilitiesRef.littleDownMovement(view: nameTextFielf)
            return
        }
        guard self.givenNameTextFielf.text != nil && self.givenNameTextFielf.text != "" else {
            
            nameTextFielf.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9137254902, blue: 0.8784313725, alpha: 1)
            nameTextFielf.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
            nameTextFielf.attributedPlaceholder = NSAttributedString(string: "Ingresa tu nombre",
                                                                     attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)])
            
            givenNameTextFielf.backgroundColor = #colorLiteral(red: 0.7607843137, green: 0.2117647059, blue: 0.0862745098, alpha: 1)
            givenNameTextFielf.textColor = #colorLiteral(red: 0.9411764706, green: 0.9137254902, blue: 0.8784313725, alpha: 1)
            givenNameTextFielf.attributedPlaceholder = NSAttributedString(string: "Ingresa tu apellido",
                                                                     attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.9411764706, green: 0.9137254902, blue: 0.8784313725, alpha: 1)])
            
            UtilitiesRef.littleDownMovement(view: givenNameTextFielf)
            return
        }
        guard self.emailTextFielf.text != nil && self.emailTextFielf.text != "" else {
            
            nameTextFielf.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9137254902, blue: 0.8784313725, alpha: 1)
            nameTextFielf.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
            nameTextFielf.attributedPlaceholder = NSAttributedString(string: "Ingresa tu nombre",
            
                                                                     attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)])
            
            givenNameTextFielf.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9137254902, blue: 0.8784313725, alpha: 1)
            givenNameTextFielf.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
            givenNameTextFielf.attributedPlaceholder = NSAttributedString(string: "Ingresa tu nombre",
                                                                     attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)])
            
            emailTextFielf.backgroundColor = #colorLiteral(red: 0.7607843137, green: 0.2117647059, blue: 0.0862745098, alpha: 1)
            emailTextFielf.textColor = #colorLiteral(red: 0.9411764706, green: 0.9137254902, blue: 0.8784313725, alpha: 1)
            emailTextFielf.attributedPlaceholder = NSAttributedString(string: "Ingresa tu correo electronico",
                                                                          attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.9411764706, green: 0.9137254902, blue: 0.8784313725, alpha: 1)])
            
            UtilitiesRef.littleDownMovement(view: emailTextFielf)
            return
        }
        
        guard UtilitiesRef.isValidEmail(email: emailTextFielf.text!) else {
            
            nameTextFielf.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9137254902, blue: 0.8784313725, alpha: 1)
            nameTextFielf.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
            nameTextFielf.attributedPlaceholder = NSAttributedString(string: "Ingresa tu nombre",
                                                                     
                                                                     attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)])
            
            givenNameTextFielf.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9137254902, blue: 0.8784313725, alpha: 1)
            givenNameTextFielf.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
            givenNameTextFielf.attributedPlaceholder = NSAttributedString(string: "Ingresa tu nombre",
                                                                          attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)])
            
            emailTextFielf.backgroundColor = #colorLiteral(red: 0.7607843137, green: 0.2117647059, blue: 0.0862745098, alpha: 1)
            emailTextFielf.textColor = #colorLiteral(red: 0.9411764706, green: 0.9137254902, blue: 0.8784313725, alpha: 1)
            emailTextFielf.text = ""
            emailTextFielf.attributedPlaceholder = NSAttributedString(string: "Email invalido. Ejemplo: me@example.com",
                                                                      attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 1, green: 0.760784952, blue: 0.8365748187, alpha: 1)])
           
            return
        }
        
        let types = ["O-","O+","A-","A+","B-","B+","AB-","AB+"]
        guard types.contains(bloodType) else {
            
            nameTextFielf.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9137254902, blue: 0.8784313725, alpha: 1)
            nameTextFielf.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
            nameTextFielf.attributedPlaceholder = NSAttributedString(string: "Ingresa tu nombre",
                                                                     
                                                                     attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)])
            
            givenNameTextFielf.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9137254902, blue: 0.8784313725, alpha: 1)
            givenNameTextFielf.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
            givenNameTextFielf.attributedPlaceholder = NSAttributedString(string: "Ingresa tu nombre",
                                                                          attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)])
            
            emailTextFielf.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9137254902, blue: 0.8784313725, alpha: 1)
            emailTextFielf.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
            emailTextFielf.attributedPlaceholder = NSAttributedString(string: "Ingresa tu nombre",
                                                                          attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)])
            
            for l in bloodStackView.arrangedSubviews {
                let lab = l as! UILabel
                lab.backgroundColor = #colorLiteral(red: 0.7607843137, green: 0.2117647059, blue: 0.0862745098, alpha: 1)
                lab.textColor = #colorLiteral(red: 0.9411764706, green: 0.9137254902, blue: 0.8784313725, alpha: 1)
                UtilitiesRef.littleDownMovement(view: lab)
            }
            
            return
        }
        
                print("Use app! ")
//        let user = User()
//        user.name = nameTextFielf.text!
//        user.givenName = givenNameTextFielf.text!
//        user.email = emailTextFielf.text!
//        user.bloodType = bloodType
//        user.aditionalNote = noteTextView.text!
//        user.diseases = diseases
//        fir.addProfileInfo(myUser: user)
//        
//        let modalStyle = UIModalTransitionStyle.crossDissolve
//        let vc = ViewController()
//        vc.modalTransitionStyle = modalStyle
//        self.present(vc, animated: true, completion: nil)
        
    }
    
    @objc func popUpBackButtonHandler() {
        popUpBackView.isHidden = true
        popUpView.isHidden = true
    }
    
    @objc func addButtonHandler() {
        popUpBackView.isHidden = true
        popUpView.isHidden = true
        diseases.append(sickTextView.text!)
        sicknessTableView.reloadData()
        sickTextView.text = ""
        print("add")
    }
    
    @objc func bloodSelectionHandler0() {
        setStateSelected(i: 0)
    }
    
    @objc func bloodSelectionHandler1 (){
        setStateSelected(i: 1)
    }
    
    @objc func bloodSelectionHandler2 () {
        setStateSelected(i: 2)
    }
    
    @objc func bloodSelectionHandler3 () {
        setStateSelected(i: 3)
    }
    
    @objc func bloodSelectionHandler4 () {
        setStateSelected(i: 4)
    }
    
    @objc func bloodSelectionHandler5 () {
        setStateSelected(i: 5)
    }
    
    @objc func bloodSelectionHandler6 () {
        setStateSelected(i: 6)
    }
    
    @objc func bloodSelectionHandler7 () {
        setStateSelected(i: 7)
    }
    
    func setStateSelected(i:Int) {
        print(i)
        let types = ["O-","O+","A-","A+","B-","B+","AB-","AB+"]
        
        self.bloodType = types[i]
        
        for v in bloodStackView.arrangedSubviews {
            let label = v as! UILabel
            label.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
            label.backgroundColor = UIColor(red: 240/255, green: 233/255, blue: 224/255, alpha: 1)
        }
        let e = bloodStackView.arrangedSubviews[i] as! UILabel
        e.backgroundColor = #colorLiteral(red: 0.7607843137, green: 0.2117647059, blue: 0.0862745098, alpha: 1)
        e.textColor = UIColor(red: 240/255, green: 233/255, blue: 224/255, alpha: 1)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return diseases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = sicknessTableView.dequeueReusableCell(withIdentifier: "sick")
        cell?.textLabel?.text = "• \(diseases[indexPath.row])"
        cell?.textLabel?.numberOfLines = 0
        cell?.textLabel?.lineBreakMode = .byWordWrapping
        cell?.textLabel?.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
        cell?.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9137254902, blue: 0.8784313725, alpha: 1)
        cell?.textLabel?.font = UIFont(name: "AvenirNext-Medium", size: 14)
        cell?.selectionStyle = .none
        return cell!
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.noteTextView.resignFirstResponder()
        nameTextFielf.resignFirstResponder()
        givenNameTextFielf.resignFirstResponder()
        emailTextFielf.resignFirstResponder()
        sickTextView.resignFirstResponder()
    }
    
}

extension EntryViewController : UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        UIView.animate(withDuration: 0.21) {
            self.view.frame.origin.y -= 200
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        UIView.animate(withDuration: 0.21) {
            self.view.frame.origin.y = 0
        }
    }
}

extension EntryViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextFielf.resignFirstResponder()
        givenNameTextFielf.resignFirstResponder()
        emailTextFielf.resignFirstResponder()
        return true
    }
}
