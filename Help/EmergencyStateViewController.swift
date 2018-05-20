//
//  EmergencyStateViewController.swift
//  Help
//
//  Created by Celina Martinez on 29/4/18.
//  Copyright © 2018 Jadapema. All rights reserved.
//

import UIKit
import GoogleMaps

class EmergencyStateViewController: UIViewController, UITableViewDelegate,UITableViewDataSource, CLLocationManagerDelegate {

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
        label.text = "Estado de Emergencia"
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
        label.text = "Estamos notificando a tus contactos de emergencia, manten la calma"
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.7607843137, green: 0.2117647059, blue: 0.0862745098, alpha: 1)
        label.font = UIFont(name: "AvenirNext-Medium", size: 16)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    let separatorView : UIView = {
        let separator = UIView()
        separator.backgroundColor = #colorLiteral(red: 0.7607843137, green: 0.2117647059, blue: 0.0862745098, alpha: 1)
        return separator
    }()
    
    let lblContactsComing : UILabel = {
        let label = UILabel()
        label.text = "Contactos en Camino"
        label.textAlignment = .left
        label.textColor = #colorLiteral(red: 0.7607843137, green: 0.2117647059, blue: 0.0862745098, alpha: 1)
        label.font = UIFont(name: "AvenirNext-Medium", size: 16)
        return label
    }()
    
    let contactsComingTableView : UITableView = {
        let table = UITableView()
        table.backgroundColor = UIColor(red: 240/255, green: 233/255, blue: 224/255, alpha: 1)
        table.allowsSelection = false
        return table
    }()
    
    let lblContactsNotified : UILabel = {
        let label = UILabel()
        label.text = "Contactos Notificados"
        label.textAlignment = .left
        label.textColor = #colorLiteral(red: 0.7607843137, green: 0.2117647059, blue: 0.0862745098, alpha: 1)
        label.font = UIFont(name: "AvenirNext-Medium", size: 16)
        return label
    }()
    
    let contactsNotifiedTableView : UITableView = {
        let table = UITableView()
        table.backgroundColor = UIColor(red: 240/255, green: 233/255, blue: 224/255, alpha: 1)
        table.allowsSelection = false
        return table
    }()
    
    let separatorView2 : UIView = {
        let separator = UIView()
        separator.backgroundColor = #colorLiteral(red: 0.7607843137, green: 0.2117647059, blue: 0.0862745098, alpha: 1)
        return separator
    }()
    
    let locationManager = CLLocationManager()
    var currentLocation = CLLocationCoordinate2D()
    
    var map : GMSMapView = {
        let map = GMSMapView()
        return map
    }()

//    var timer = Timer()
    var counter = 0
//    var contactsLocationsDictionary : [String: [String]] = ["UserId1" : ["11.83456","-86.34567"]]
    
    override func viewWillAppear(_ animated: Bool) {
        self.view.backgroundColor = UIColor(red: 240/255, green: 233/255, blue: 224/255, alpha: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.view.addSubview(rectangleSuperior)
        self.view.addSubview(lblRectangleSuperior)
        self.view.addSubview(cancelButtonImageView)
        cancelButtonImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(cancelButtonHandler)))
        cancelButtonImageView.isUserInteractionEnabled = true
        self.view.addSubview(lblMessage)
        self.view.addSubview(separatorView)
        self.view.addSubview(lblContactsComing)
        self.view.addSubview(contactsComingTableView)
        contactsComingTableView.delegate = self
        contactsComingTableView.dataSource = self
        contactsComingTableView.register(ContactsTableViewCell.self, forCellReuseIdentifier: "contactsComing")
        self.view.addSubview(lblContactsNotified)
        self.view.addSubview(contactsNotifiedTableView)
        contactsNotifiedTableView.delegate = self
        contactsNotifiedTableView.dataSource = self
        contactsNotifiedTableView.register(ContactsTableViewCell.self, forCellReuseIdentifier: "contactsNotified")
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
        setupLayout()
//
//        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.updateTimer), userInfo: nil, repeats: true)
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
        lblMessage.topAnchor.constraint(equalTo: rectangleSuperior.bottomAnchor, constant: 10).isActive = true
        lblMessage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        lblMessage.widthAnchor.constraint(equalToConstant: self.view.frame.width - 20).isActive = true
        lblMessage.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        separatorView.topAnchor.constraint(equalTo: lblMessage.bottomAnchor, constant: 0).isActive = true
        separatorView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30).isActive = true
        separatorView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30).isActive = true
        separatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        lblContactsComing.translatesAutoresizingMaskIntoConstraints = false
        lblContactsComing.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 10).isActive = true
        lblContactsComing.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30).isActive = true
        
        contactsComingTableView.translatesAutoresizingMaskIntoConstraints = false
        contactsComingTableView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        contactsComingTableView.topAnchor.constraint(equalTo: lblContactsComing.bottomAnchor, constant: 0).isActive = true
        contactsComingTableView.heightAnchor.constraint(equalToConstant: (self.view.bounds.height * 0.15)).isActive = true
        contactsComingTableView.widthAnchor.constraint(equalToConstant: (self.view.frame.width * 0.9)).isActive = true
        
        lblContactsNotified.translatesAutoresizingMaskIntoConstraints = false
        lblContactsNotified.topAnchor.constraint(equalTo: contactsComingTableView.bottomAnchor, constant: 10).isActive = true
        lblContactsNotified.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30).isActive = true
        
        contactsNotifiedTableView.translatesAutoresizingMaskIntoConstraints = false
        contactsNotifiedTableView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        contactsNotifiedTableView.topAnchor.constraint(equalTo: lblContactsNotified.bottomAnchor, constant: 0).isActive = true
        contactsNotifiedTableView.heightAnchor.constraint(equalToConstant: (self.view.bounds.height * 0.15)).isActive = true
        contactsNotifiedTableView.widthAnchor.constraint(equalToConstant: (self.view.frame.width * 0.9)).isActive = true
        
        separatorView2.translatesAutoresizingMaskIntoConstraints = false
        separatorView2.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        separatorView2.topAnchor.constraint(equalTo: contactsNotifiedTableView.bottomAnchor, constant: 0).isActive = true
        separatorView2.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        separatorView2.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        separatorView2.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
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
        if tableView == contactsComingTableView {
            let cell = contactsComingTableView.dequeueReusableCell(withIdentifier: "contactsComing") as! ContactsTableViewCell
            cell.name.text = "Jacob Peralta"
            cell.parentesco.text = "(Amigo)"
            return cell
        } else {
            let cell = contactsNotifiedTableView.dequeueReusableCell(withIdentifier: "contactsNotified") as! ContactsTableViewCell
            cell.name.text = "Jacob Peralta"
            cell.parentesco.text = "(Amigo)"
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }  
}
