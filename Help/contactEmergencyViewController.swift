//
//  contactEmergencyViewController.swift
//  Help
//
//  Created by Celina Martinez on 30/4/18.
//  Copyright © 2018 Jadapema. All rights reserved.
//

import UIKit
import GoogleMaps
import UserNotifications

class contactEmergencyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    let rectangleSuperior : UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 40))
        view.backgroundColor = UIColor(red: 194/255, green: 54/255, blue: 22/255, alpha: 1)
        return view
    }()
    
    let lblRectangleSuperior : UILabel = {
        let label = UILabel()
        label.text = "Emergencia"
        label.textAlignment = .left
        label.textColor = UIColor(red: 240/255, green: 233/255, blue: 224/255, alpha: 1)
        label.font = UIFont(name: "AvenirNext-Bold", size: 20)
        return label
    }()
    
    let cancelButtonImageView : UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "Cancel"))
        return  imageView
    }()
    
    let lblMessage : UILabel = {
        let label = UILabel()
        label.text = "Uno de tus parientes o contactos necesita ayuda!"
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.7607843137, green: 0.2117647059, blue: 0.0862745098, alpha: 1)
        label.font = UIFont(name: "AvenirNext-Medium", size: 16)
        return label
    }()
    
    let separatorView : UIView = {
        let separator = UIView()
        separator.backgroundColor = #colorLiteral(red: 0.7607843137, green: 0.2117647059, blue: 0.0862745098, alpha: 1)
        return separator
    }()
    
    let contactImageView : UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "Contact"))
        return  imageView
    }()
    
    let lblName : UILabel = {
        let label = UILabel()
        label.text = "Jacob Peralta"
        label.textAlignment = .left
        label.textColor = #colorLiteral(red: 0.7607843137, green: 0.2117647059, blue: 0.0862745098, alpha: 1)
        label.font = UIFont(name: "AvenirNext-Bold", size: 20)
        return label
    }()
    
    let lblBlood : UILabel = {
        let label = UILabel()
        label.text = "AB+"
        label.textAlignment = .center
        label.textColor = UIColor(red: 240/255, green: 233/255, blue: 224/255, alpha: 1)
        label.backgroundColor = #colorLiteral(red: 0.7607843137, green: 0.2117647059, blue: 0.0862745098, alpha: 1)
        label.font = UIFont(name: "AvenirNext-Medium", size: 18)
        label.layer.borderWidth = 2
        label.layer.borderColor = #colorLiteral(red: 0.7607843137, green: 0.2117647059, blue: 0.0862745098, alpha: 1)
        label.layer.masksToBounds = false
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        return label
    }()
    
    let lblPhone : UILabel = {
        let label = UILabel()
        label.text = "86900863"
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
        label.backgroundColor = UIColor(red: 240/255, green: 233/255, blue: 224/255, alpha: 1)
        label.font = UIFont(name: "AvenirNext-Medium", size: 11)
        return label
    }()
    
    let lblEmail : UILabel = {
        let label = UILabel()
        label.text = "Jadapema@hotmail.com"
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
        label.backgroundColor = UIColor(red: 240/255, green: 233/255, blue: 224/255, alpha: 1)
        label.font = UIFont(name: "AvenirNext-Medium", size: 11)
        return label
    }()
    
    let lblEnfermedades : UILabel = {
        let label = UILabel()
        label.text = "Enfermedades o Alergias"
        label.textAlignment = .left
        label.textColor = #colorLiteral(red: 0.7607843137, green: 0.2117647059, blue: 0.0862745098, alpha: 1)
        label.font = UIFont(name: "AvenirNext-Medium", size: 18)
        return label
    }()
    
    let sicknessTableView : UITableView = {
        let table = UITableView()
        table.backgroundColor = UIColor(red: 240/255, green: 233/255, blue: 224/255, alpha: 1)
        return table
    }()
    
    let lblNota : UILabel = {
        let label = UILabel()
        label.text = "Nota Adicional"
        label.textAlignment = .left
        label.textColor = #colorLiteral(red: 0.7607843137, green: 0.2117647059, blue: 0.0862745098, alpha: 1)
        label.font = UIFont(name: "AvenirNext-Medium", size: 18)
        return label
    }()
    
    let noteTextView : UITextView = {
        let textView = UITextView()
        textView.text = "Soy asegurado en el vivian pellas, ahi trabajo...   sadjaskjdhakj sdhkajhdkjas hdkjashk djhaskj dhkajs hdkjah skdjhaskjdhk ajsh dkajshdk jahskdjhak sjdhkajshdkja shkdjhaksjd hkasjdhkajshd kjaskdjhaksjdhak jshdkasjh dkjash dkjahskdja hskdjha ksjdh aksjhdkajshdkj ahsdkja hskdjhakj dhkajshd"
        textView.backgroundColor = UIColor(red: 240/255, green: 233/255, blue: 224/255, alpha: 1)
        textView.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
        textView.font = UIFont(name: "AvenirNext-Medium", size: 14)
        textView.isEditable = false
        return textView
    }()
    
    let separatorView2 : UIView = {
        let separator = UIView()
        separator.backgroundColor = #colorLiteral(red: 0.7607843137, green: 0.2117647059, blue: 0.0862745098, alpha: 1)
        return separator
    }()
    
    let goingNotificationView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 240/255, green: 233/255, blue: 224/255, alpha: 1)
        view.layer.borderWidth = 2
        view.layer.borderColor = #colorLiteral(red: 0.7607843137, green: 0.2117647059, blue: 0.0862745098, alpha: 1)
        view.layer.masksToBounds = false
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        return view
    }()
    
    let helpGreenImageView : UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "AddSickness"))
        return  imageView
    }()
    
    let lblGoing : UILabel = {
        let label = UILabel()
        label.text = "Voy para allá!"
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.7607843137, green: 0.2117647059, blue: 0.0862745098, alpha: 1)
        label.font = UIFont(name: "AvenirNext-Bold", size: 17)
        return label
    }()
    
    let notificationView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 240/255, green: 233/255, blue: 224/255, alpha: 1)
        view.layer.borderWidth = 2
        view.layer.borderColor = #colorLiteral(red: 0.7607843137, green: 0.2117647059, blue: 0.0862745098, alpha: 1)
        view.layer.masksToBounds = false
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        return view
    }()
    
    let helpGreenImageView2 : UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "AddSickness"))
        return  imageView
    }()
    
    let lblGoing2 : UILabel = {
        let label = UILabel()
        label.text = "Tu contacto fue notificado"
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.7607843137, green: 0.2117647059, blue: 0.0862745098, alpha: 1)
        label.font = UIFont(name: "AvenirNext-Bold", size: 10)
        return label
    }()
    
    var panGestureRecognizer : UIPanGestureRecognizer?
    var originalPosition1 : CGPoint?
    var originalPosition2 : CGPoint?
    var originalPosition3 : CGPoint?
    var originalPosition4 : CGPoint?
    var originalPosition5 : CGPoint?
    var originalPosition6 : CGPoint?
    var internalPosition1 : CGPoint?
    var internalPosition2 : CGPoint?
    var internalPosition3 : CGPoint?
    var internalPosition4 : CGPoint?
    var internalPosition5 : CGPoint?
    var internalPosition6 : CGPoint?
    var originalHeight : CGFloat?
    var internalHeight : CGFloat?
    
    let dragView : UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.7607843137, green: 0.2117647059, blue: 0.0862745098, alpha: 1)
        view.layer.masksToBounds = false
        view.layer.cornerRadius = 2
        view.clipsToBounds = true
        
        return view
    }()
    
    let bgDragView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 240/255, green: 233/255, blue: 224/255, alpha: 0)
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(blurEffectView)
        return view
    }()
    
    let locationView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 240/255, green: 233/255, blue: 224/255, alpha: 1)
        view.layer.borderWidth = 2
        view.layer.borderColor = #colorLiteral(red: 0.7607843137, green: 0.2117647059, blue: 0.0862745098, alpha: 1)
        view.layer.masksToBounds = false
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        return view
    }()
    
    let lblLocation : UILabel = {
        let label = UILabel()
        label.text = "Lat: 11.83456 | Lon: -86.34567"
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.7607843137, green: 0.2117647059, blue: 0.0862745098, alpha: 1)
        label.font = UIFont(name: "AvenirNext-Bold", size: 7)
        return label
    }()
    
    let locationManager = CLLocationManager()
    var currentLocation = CLLocationCoordinate2D()
    
    var map : GMSMapView = {
        let map = GMSMapView()
        return map
    }()
    
    var timer = Timer()
    var counter = 0
    //    var contactsLocationsDictionary : [String: [String]] = ["UserId1" : ["11.83456","-86.34567"]]
    
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.view.backgroundColor = UIColor(red: 240/255, green: 233/255, blue: 224/255, alpha: 1)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["repeating"])
        UIApplication.shared.applicationIconBadgeNumber -= 1
        
        self.view.addSubview(rectangleSuperior)
        self.view.addSubview(lblRectangleSuperior)
        self.view.addSubview(cancelButtonImageView)
        cancelButtonImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(cancelButtonHandler)))
        cancelButtonImageView.isUserInteractionEnabled = true
        self.view.addSubview(lblMessage)
        self.view.addSubview(separatorView)
        self.view.addSubview(contactImageView)
        self.view.addSubview(lblName)
        self.view.addSubview(lblBlood)
        self.view.addSubview(lblPhone)
        self.view.addSubview(lblEmail)
        self.view.addSubview(lblEnfermedades)
        self.view.addSubview(sicknessTableView)
        sicknessTableView.delegate = self
        sicknessTableView.dataSource = self
        sicknessTableView.register(UITableViewCell.self, forCellReuseIdentifier: "sick")
        sicknessTableView.rowHeight = UITableViewAutomaticDimension
        sicknessTableView.estimatedRowHeight = 44
        self.view.addSubview(lblNota)
        self.view.addSubview(noteTextView)
        self.view.addSubview(separatorView2)
        
        let camera = GMSCameraPosition.camera(withLatitude: 00, longitude: 00, zoom: 15)
        map = GMSMapView.map(withFrame: .zero, camera: camera)
        map.isMyLocationEnabled = true
        
        self.view.addSubview(map)
        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
        
        //        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.updateTimer), userInfo: nil, repeats: true)
        
        
        self.view.addSubview(goingNotificationView)
        goingNotificationView.addSubview(helpGreenImageView)
        goingNotificationView.addSubview(lblGoing)
        goingNotificationView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goingButtonHandler)))
        goingNotificationView.isUserInteractionEnabled = true
        
        self.view.addSubview(notificationView)
        notificationView.addSubview(helpGreenImageView2)
        notificationView.addSubview(lblGoing2)
        
        self.view.addSubview(locationView)
        locationView.addSubview(lblLocation)
        
        
        
        self.view.addSubview(bgDragView)
        self.view.addSubview(dragView)
        bgDragView.isHidden = true
        dragView.isHidden = true
        dragView.isUserInteractionEnabled = true
        bgDragView.isUserInteractionEnabled = true
        panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panGestureAction(_:)))
        dragView.addGestureRecognizer(panGestureRecognizer!)
        bgDragView.addGestureRecognizer(panGestureRecognizer!)
        setupLayout()
        
        // Do any additional setup after loading the view.
    }
    
   
    
    @objc func goingButtonHandler () {
        print("Going")
        UIView.animate(withDuration: 1, animations: {
            
            let y = self .goingNotificationView.frame.height
            self.goingNotificationView.frame.size.height = 0
            self.goingNotificationView.center.y += y/2
            
            
            
        }, completion: { (finish) in
            if finish {
                UIView.animate(withDuration: 1, animations: {
                    
                    self.notificationView.frame.size.height += 20
                    self.bgDragView.isHidden = false
                    self.dragView.isHidden = false
                    self.dragView.center.x -= (self.view.frame.width * 0.6) / 2
                    self.dragView.frame.size.width = self.view.frame.width * 0.6
//                    self.helpGreenImageView2.center.y = self.notificationView.center.y
//                    self.lblGoing2.center.y = self.notificationView.center.y
                }, completion: { (finished) in
                    self.originalPosition1 = self.separatorView2.center
                    self.originalPosition2 = self.dragView.center
                    self.originalPosition3 = self.bgDragView.center
                    self.originalPosition4 = self.locationView.center
                    self.originalPosition5 = self.notificationView.center
                    self.originalPosition6 = self.map.center
                    self.originalHeight = self.map.frame.height
                })
            }
        })
    }
    
    @objc func panGestureAction(_ panGesture: UIPanGestureRecognizer) {
        let translation = panGesture.translation(in: self.view)
        let velocityInView = panGesture.velocity(in: self.view)
        
        switch panGesture.state {
        case .began:
            
                        internalPosition1 = separatorView2.center
                        internalPosition2 = dragView.center
                        internalPosition3 = bgDragView.center
                        internalPosition4 = locationView.center
                        internalPosition5 = notificationView.center
                        internalPosition6 = map.center
                        internalHeight = map.frame.height
            
            break
        case .changed:
            
            if dragView.frame.origin.y <= 440 && dragView.frame.origin.y >= 180 {
                
                separatorView2.center = CGPoint(
                    x: internalPosition1!.x ,
                    y: internalPosition1!.y + translation.y
                )
                dragView.center = CGPoint(
                    x: internalPosition2!.x,
                    y: internalPosition2!.y   + translation.y
                )
                bgDragView.center = CGPoint(
                    x: internalPosition3!.x ,
                    y: internalPosition3!.y + translation.y
                )
                locationView.center = CGPoint(
                    x: internalPosition4!.x ,
                    y: internalPosition4!.y  + translation.y
                )
                
                notificationView.center = CGPoint(
                    x: internalPosition5!.x,
                    y: internalPosition5!.y + translation.y
                )
                
                map.frame.size.height = internalHeight! - translation.y
                map.center = CGPoint(
                    x: internalPosition6!.x,
                    y: internalPosition6!.y + (translation.y * 0.5)
                )
                print("translation : \(translation.y)")
                print("y: \(bgDragView.frame.origin.y)")
                
                
            } else {
                print("else y: \(bgDragView.frame.origin.y)")
                panGesture.isEnabled = false
                
                if dragView.frame.origin.y > 400 {
                    separatorView2.center = originalPosition1!
                    dragView.center = originalPosition2!
                    bgDragView.center = originalPosition3!
                    locationView.center = originalPosition4!
                    notificationView.center = originalPosition5!
                    map.center = originalPosition6!
                    map.frame.origin.y = separatorView2.frame.origin.y + 2
                    map.frame.size.height = originalHeight!
                } else if dragView.frame.origin.y < 210 {
                    let bottomEmailLbl : CGFloat = self.lblEmail.frame.origin.y + self.lblEmail.frame.height
                    
                    
                    bgDragView.frame.origin.y = bottomEmailLbl
                    dragView.center.y = bottomEmailLbl + 2
                    separatorView2.frame.origin.y = self.bgDragView.frame.origin.y + self.bgDragView.frame.height
                    locationView.frame.origin.y = self.bgDragView.frame.origin.y + self.bgDragView.frame.height
                    notificationView.frame.origin.y = self.bgDragView.frame.origin.y + self.bgDragView.frame.height
                    
//                    map.center.y = originalPosition6!.y - secondValue
                    map.frame.origin.y = (self.bgDragView.frame.origin.y + self.bgDragView.frame.height) + 2
                    map.frame.size.height = self.view.frame.height - ((self.bgDragView.frame.origin.y + self.bgDragView.frame.height) + 2)
                }
                
                break
            }
            
            
            break
        case .cancelled:
            panGesture.isEnabled = true
            
            break
            
        case .ended:
            if bgDragView.frame.origin.y >= 350 {
                print("Down")
                UIView.animate(withDuration: 1) {
                    self.separatorView2.center = self.originalPosition1!
                    self.dragView.center = self.originalPosition2!
                    self.bgDragView.center = self.originalPosition3!
                    self.locationView.center = self.originalPosition4!
                    self.notificationView.center = self.originalPosition5!
                    self.map.center = self.originalPosition6!
                    self.map.frame.origin.y = self.separatorView2.frame.origin.y + 2
                    self.map.frame.size.height = self.originalHeight!
                }
            } else  if bgDragView.frame.origin.y < 350 {
                print("UP")
                let bottomEmailLbl : CGFloat = self.lblEmail.frame.origin.y + self.lblEmail.frame.height
                UIView.animate(withDuration: 1) {
                    self.bgDragView.frame.origin.y = bottomEmailLbl
                    self.dragView.center.y = bottomEmailLbl + 2
                    self.separatorView2.frame.origin.y = self.bgDragView.frame.origin.y + self.bgDragView.frame.height
                    self.locationView.frame.origin.y = self.bgDragView.frame.origin.y + self.bgDragView.frame.height
                    self.notificationView.frame.origin.y = self.bgDragView.frame.origin.y + self.bgDragView.frame.height
                    self.map.frame.origin.y = (self.bgDragView.frame.origin.y + self.bgDragView.frame.height) + 2
                   self.map.frame.size.height = self.view.frame.height - ((self.bgDragView.frame.origin.y + self.bgDragView.frame.height) + 2)
                }
            }
            break
        default:
            break
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        currentLocation = locValue
        
        if counter == 0 {
            let camera = GMSCameraPosition.camera(withLatitude: locValue.latitude, longitude: locValue.longitude, zoom: 15)
            map.camera = camera
        }
        
        counter = 1
        
        //        setNewCamera(lat: currentLocation.latitude, long: currentLocation.longitude)
        
        //        print("latitude: \(currentLocation.longitude) longitud: \(currentLocation.longitude)")
    }
    
    //    func setNewCamera(lat: CLLocationDegrees, long: CLLocationDegrees) {
    //
    //
    //        if counter == 0 {
    //            let camera = GMSCameraPosition.camera(withLatitude: lat , longitude: long, zoom: 15)
    //            map.camera = camera
    //        }
    //
    //        counter = 1
    //    }
    
    //    @objc func updateTimer() {
    //
    //        map.clear()
    //
    //        for (k,v) in  contactsLocationsDictionary{
    //            contactsLocationsDictionary[k] = ["\(map.camera.target.latitude)","\(map.camera.target.longitude)"]
    //        }
    //
    //        let marker = GMSMarker()
    //        for (k,v) in  contactsLocationsDictionary{
    //            marker.position = CLLocationCoordinate2D(latitude: Double(v[0])!, longitude: Double(v[1])!)
    //            marker.snippet = k
    //        }
    //        marker.appearAnimation = .pop
    //        marker.map = map
    //        print("Pasaron 5 sefundos!")
    //    }


    @objc func cancelButtonHandler () {
        let modalStyle = UIModalTransitionStyle.crossDissolve
        let vc = ViewController()
        vc.modalTransitionStyle = modalStyle
        self.present(vc, animated: true, completion: nil)
    }
    
    private func setupLayout () {
        rectangleSuperior.translatesAutoresizingMaskIntoConstraints = false
        rectangleSuperior.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        rectangleSuperior.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        rectangleSuperior.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        rectangleSuperior.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        lblRectangleSuperior.translatesAutoresizingMaskIntoConstraints = false
        lblRectangleSuperior.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 7).isActive = true
        lblRectangleSuperior.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 15).isActive = true
        
        cancelButtonImageView.translatesAutoresizingMaskIntoConstraints = false
        cancelButtonImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 7).isActive = true
        cancelButtonImageView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -10).isActive = true
        cancelButtonImageView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        cancelButtonImageView.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
        lblMessage.translatesAutoresizingMaskIntoConstraints = false
        lblMessage.topAnchor.constraint(equalTo: rectangleSuperior.bottomAnchor, constant: 0).isActive = true
        lblMessage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        lblMessage.widthAnchor.constraint(equalToConstant: self.view.frame.width - 20).isActive = true
        lblMessage.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        separatorView.topAnchor.constraint(equalTo: lblMessage.bottomAnchor, constant: 0).isActive = true
        separatorView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10).isActive = true
        separatorView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -10).isActive = true
        separatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        contactImageView.translatesAutoresizingMaskIntoConstraints = false
        contactImageView.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 20).isActive = true
        contactImageView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30).isActive = true
        contactImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        contactImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        lblName.translatesAutoresizingMaskIntoConstraints = false
        lblName.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 28).isActive = true
        lblName.leftAnchor.constraint(equalTo: contactImageView.rightAnchor, constant: 15).isActive = true
        lblName.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        lblBlood.translatesAutoresizingMaskIntoConstraints = false
        lblBlood.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 30).isActive = true
        lblBlood.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30).isActive = true
        lblBlood.heightAnchor.constraint(equalToConstant: 35).isActive = true
        lblBlood.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        lblPhone.translatesAutoresizingMaskIntoConstraints = false
        lblPhone.topAnchor.constraint(equalTo: contactImageView.bottomAnchor, constant: 5).isActive = true
        lblPhone.centerXAnchor.constraint(equalTo: contactImageView.centerXAnchor, constant: 0).isActive = true
        lblPhone.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        lblEmail.translatesAutoresizingMaskIntoConstraints = false
        lblEmail.leftAnchor.constraint(equalTo: lblPhone.rightAnchor, constant: 10).isActive = true
        lblEmail.centerYAnchor.constraint(equalTo: lblPhone.centerYAnchor, constant: 0).isActive = true
        lblEmail.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        lblEnfermedades.translatesAutoresizingMaskIntoConstraints = false
        lblEnfermedades.topAnchor.constraint(equalTo: lblEmail.bottomAnchor, constant: 10).isActive = true
        lblEnfermedades.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 15).isActive = true
        lblEnfermedades.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        sicknessTableView.translatesAutoresizingMaskIntoConstraints = false
        sicknessTableView.topAnchor.constraint(equalTo:lblEnfermedades.bottomAnchor, constant: 0).isActive = true
        sicknessTableView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        sicknessTableView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10).isActive = true
        sicknessTableView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        
        lblNota.translatesAutoresizingMaskIntoConstraints = false
        lblNota.topAnchor.constraint(equalTo: sicknessTableView.bottomAnchor, constant: 0).isActive = true
        lblNota.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 15).isActive = true
        lblNota.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        noteTextView.translatesAutoresizingMaskIntoConstraints = false
        noteTextView.topAnchor.constraint(equalTo: lblNota.bottomAnchor, constant: 5).isActive = true
        noteTextView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10).isActive = true
        noteTextView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -10).isActive = true
        noteTextView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        
        separatorView2.translatesAutoresizingMaskIntoConstraints = false
        separatorView2.topAnchor.constraint(equalTo: noteTextView.bottomAnchor, constant: 19).isActive = true
        separatorView2.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        separatorView2.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        separatorView2.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        goingNotificationView.translatesAutoresizingMaskIntoConstraints = false
        goingNotificationView.centerYAnchor.constraint(equalTo: separatorView2.centerYAnchor, constant: 0).isActive = true
        goingNotificationView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        goingNotificationView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        goingNotificationView.widthAnchor.constraint(equalToConstant: self.view.frame.width * 0.4).isActive = true
        
        helpGreenImageView.translatesAutoresizingMaskIntoConstraints = false
        helpGreenImageView.centerYAnchor.constraint(equalTo: goingNotificationView.centerYAnchor, constant: 0).isActive = true
        helpGreenImageView.leftAnchor.constraint(equalTo: goingNotificationView.leftAnchor, constant: 10).isActive = true
        helpGreenImageView.widthAnchor.constraint(equalToConstant: 25).isActive = true
        helpGreenImageView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        lblGoing.translatesAutoresizingMaskIntoConstraints = false
        lblGoing.centerYAnchor.constraint(equalTo: goingNotificationView.centerYAnchor, constant: 0).isActive = true
        lblGoing.leftAnchor.constraint(equalTo: helpGreenImageView.rightAnchor, constant: 10).isActive = true
        lblGoing.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        notificationView.translatesAutoresizingMaskIntoConstraints = false
        notificationView.topAnchor.constraint(equalTo: separatorView2.topAnchor, constant: 0).isActive = true
        notificationView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 1).isActive = true
        notificationView.heightAnchor.constraint(equalToConstant: 0).isActive = true
        notificationView.widthAnchor.constraint(equalToConstant: self.view.frame.width * 0.4).isActive = true
        
        helpGreenImageView2.translatesAutoresizingMaskIntoConstraints = false
        helpGreenImageView2.topAnchor.constraint(equalTo: notificationView.topAnchor, constant: 5).isActive = true
        helpGreenImageView2.leftAnchor.constraint(equalTo: notificationView.leftAnchor, constant: 10).isActive = true
        helpGreenImageView2.widthAnchor.constraint(equalToConstant: 10).isActive = true
        helpGreenImageView2.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        lblGoing2.translatesAutoresizingMaskIntoConstraints = false
        lblGoing2.topAnchor.constraint(equalTo: notificationView.topAnchor, constant: 5).isActive = true
        lblGoing2.leftAnchor.constraint(equalTo: helpGreenImageView2.rightAnchor, constant: 10).isActive = true
        lblGoing2.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        dragView.translatesAutoresizingMaskIntoConstraints = false
        dragView.bottomAnchor.constraint(equalTo: separatorView2.topAnchor, constant: -14).isActive = true
        dragView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        dragView.widthAnchor.constraint(equalToConstant: 0).isActive = true
        dragView.heightAnchor.constraint(equalToConstant: 4).isActive = true
        
        bgDragView.translatesAutoresizingMaskIntoConstraints = false
        bgDragView.bottomAnchor.constraint(equalTo: separatorView2.topAnchor, constant: 0).isActive = true
        bgDragView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        bgDragView.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        bgDragView.heightAnchor.constraint(equalToConstant: 19).isActive = true
        
        locationView.translatesAutoresizingMaskIntoConstraints = false
        locationView.topAnchor.constraint(equalTo: separatorView2.topAnchor, constant: 0).isActive = true
        locationView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: -1).isActive = true
        locationView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        locationView.widthAnchor.constraint(equalToConstant: self.view.frame.width * 0.3).isActive = true
        
        lblLocation.translatesAutoresizingMaskIntoConstraints = false
        lblLocation.centerXAnchor.constraint(equalTo: locationView.centerXAnchor, constant: 0).isActive = true
        lblLocation.centerYAnchor.constraint(equalTo: locationView.centerYAnchor, constant: 0).isActive = true
        
        map.translatesAutoresizingMaskIntoConstraints = false
        map.topAnchor.constraint(equalTo: separatorView2.bottomAnchor, constant: 0).isActive = true
        map.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        map.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        map.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = sicknessTableView.dequeueReusableCell(withIdentifier: "sick")
        cell?.textLabel?.text = "• Asmadfs dfs dfs dfsdfj fhfh fhfh fh fhfh fhfhf hfhfhfh fhfhfhf hf hfhfhfh fhf hfhfh fhfh fhfh fhf hfhfh fhfh jhg gjh gh ghfdgdfg dfgdfgdfg dfgfdfg  dfgd fg dfg dfgdfgdfg fdgdfg jacob "
        cell?.textLabel?.numberOfLines = 0
        cell?.textLabel?.lineBreakMode = .byWordWrapping
        cell?.textLabel?.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
        cell?.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9137254902, blue: 0.8784313725, alpha: 1)
        cell?.textLabel?.font = UIFont(name: "AvenirNext-Medium", size: 14)
        cell?.selectionStyle = .none
        return cell!
    }
    
}

