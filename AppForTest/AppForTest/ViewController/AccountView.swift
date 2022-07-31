//
//  AccountViewController.swift
//  AppForTest
//
//  Created by мас on 25.07.2022.
//

import UIKit

class AccountViewController: UIViewController {
    
    let modelManager = DataViewModel()
    
    // MARK: - API Text
    
    var profileImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "ProfilePicture"))
        imageView.contentMode = .scaleAspectFit
        
        /// Enables autolayout for our image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    var nameTextView: UITextView = {
        let textView = UITextView()
        textView.text = ""
        textView.font = UIFont.boldSystemFont(ofSize: 24)
        textView.backgroundColor = UIColor(named: "LightSteelBlue")
        textView.textColor = .white
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false

        return textView
    }()
    
    var postalCode: UITextView = {
        let textView = UITextView()
        textView.text = ""
        textView.font = UIFont.boldSystemFont(ofSize: 22)
        textView.backgroundColor = UIColor(named: "LightSteelBlue")
        textView.textColor = .white
        textView.textAlignment = .right
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false

        return textView
    }()
    
    var cityAddresView: UITextView = {
        let textView = UITextView()
        textView.text = ""
        textView.font = UIFont.boldSystemFont(ofSize: 22)
        textView.backgroundColor = UIColor(named: "LightSteelBlue")
        textView.textColor = .white
        textView.textAlignment = .right
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false

        return textView
    }()
    
    var cityNameView: UITextView = {
        
        let textView = UITextView()
        textView.text = ""
        textView.font = UIFont.boldSystemFont(ofSize: 22)
        textView.backgroundColor = UIColor(named: "LightSteelBlue")
        textView.textColor = .white
        textView.textAlignment = .right
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false

        return textView
    }()
   
    var countryNameView: UITextView = {
        let textView = UITextView()
        textView.text = ""
        textView.font = UIFont.boldSystemFont(ofSize: 22)
        textView.backgroundColor = UIColor(named: "LightSteelBlue")
        textView.textColor = .white
        textView.textAlignment = .right
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false

        return textView
    }()
    
    var birthDateView: UITextView = {
        let textView = UITextView()
        textView.text = ""
        textView.font = UIFont.boldSystemFont(ofSize: 22)
        textView.backgroundColor = UIColor(named: "LightSteelBlue")
        textView.textColor = .white
        textView.textAlignment = .right
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false

        return textView
    }()
    
    // MARK: - Static Text
    
    let street: UITextView = {
        
        let textView = UITextView()
        textView.text = "Street"
        textView.font = UIFont.boldSystemFont(ofSize: 22)
        textView.backgroundColor = UIColor(named: "LightSteelBlue")
        textView.textColor = .white
        textView.textAlignment = .left
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false

        return textView
        
    }()
    
    let city: UITextView = {
        let textView = UITextView()
        textView.text = "City"
        textView.font = UIFont.boldSystemFont(ofSize: 22)
        textView.backgroundColor = UIColor(named: "LightSteelBlue")
        textView.textColor = .white
        textView.textAlignment = .left
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false

        return textView
    }()
    
    let postal: UITextView = {
        let textView = UITextView()
        textView.text = "Postal Code"
        textView.font = UIFont.boldSystemFont(ofSize: 22)
        textView.backgroundColor = UIColor(named: "LightSteelBlue")
        textView.textColor = .white
        textView.textAlignment = .left
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false

        return textView
    }()
    
    let country: UITextView = {
        let textView = UITextView()
        textView.text = "Country"
        textView.font = UIFont.boldSystemFont(ofSize: 22)
        textView.backgroundColor = UIColor(named: "LightSteelBlue")
        textView.textColor = .white
        textView.textAlignment = .left
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false

        return textView
    }()
    
    let birthDate: UITextView = {
        let textView = UITextView()
        textView.text = "Birth Date"
        textView.font = UIFont.boldSystemFont(ofSize: 22)
        textView.backgroundColor = UIColor(named: "LightSteelBlue")
        textView.textColor = .white
        textView.textAlignment = .left
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false

        return textView
    }()

    // MARK: - View Setup
    override func viewDidLoad() {
        // Do any additional setup after loading the view.
        
        modelManager.fetchData { (devices) in
            
            DispatchQueue.main.async {
                
                self.view.backgroundColor = UIColor(named: "LightSteelBlue")
                
                self.nameTextView.text.append(contentsOf: "\(devices.user.firstName + " " + devices.user.lastName)")
                self.cityAddresView.text.append(contentsOf: "\(devices.user.address.street + ", " + devices.user.address.streetCode)")
                self.postalCode.text.append(contentsOf: "\(String(devices.user.address.postalCode))")
                self.cityNameView.text.append(contentsOf: "\(devices.user.address.city)")
                self.countryNameView.text.append(contentsOf: "\(devices.user.address.country)")
                self.birthDateView.text.append(contentsOf: "\(devices.user.birthDate)")
                
                self.setupLayout()
            }
        }
    }
    
    
    // MARK: - Layout Setup
    
    func setupLayout() {

        self.view.addSubview(self.nameTextView)
        self.view.addSubview(self.profileImageView)
        self.view.addSubview(self.cityAddresView)
        self.view.addSubview(self.postalCode)
        self.view.addSubview(self.cityNameView)
        self.view.addSubview(self.countryNameView)
        self.view.addSubview(self.birthDateView)
        self.view.addSubview(self.street)
        self.view.addSubview(self.city)
        self.view.addSubview(self.postal)
        self.view.addSubview(self.country)
        self.view.addSubview(self.birthDate)
        
        profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        profileImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 35).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 160).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 160).isActive = true
        
        nameTextView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 0).isActive = true
        nameTextView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        nameTextView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        cityAddresView.topAnchor.constraint(equalTo: nameTextView.bottomAnchor, constant: 15).isActive = true
        cityAddresView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cityAddresView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        cityAddresView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        
        street.topAnchor.constraint(equalTo: nameTextView.bottomAnchor, constant: 15).isActive = true
        street.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        street.rightAnchor.constraint(equalTo: nameTextView.rightAnchor, constant: -200).isActive = true
        street.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        
        postalCode.topAnchor.constraint(equalTo: cityAddresView.bottomAnchor, constant: 15).isActive = true
        postalCode.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        postalCode.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        postalCode.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        
        postal.topAnchor.constraint(equalTo: cityAddresView.bottomAnchor, constant: 15).isActive = true
        postal.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        postal.rightAnchor.constraint(equalTo: cityAddresView.rightAnchor, constant: -200).isActive = true
        postal.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        
        cityNameView.topAnchor.constraint(equalTo: postalCode.bottomAnchor, constant: 15).isActive = true
        cityNameView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cityNameView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        cityNameView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        
        city.topAnchor.constraint(equalTo: postalCode.bottomAnchor, constant: 15).isActive = true
        city.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        city.rightAnchor.constraint(equalTo: postalCode.rightAnchor, constant: -300).isActive = true
        city.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        
        countryNameView.topAnchor.constraint(equalTo: cityNameView.bottomAnchor, constant: 15).isActive = true
        countryNameView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        countryNameView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        countryNameView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        
        country.topAnchor.constraint(equalTo: cityNameView.bottomAnchor, constant: 15).isActive = true
        country.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        country.rightAnchor.constraint(equalTo: cityNameView.rightAnchor, constant: -250).isActive = true
        country.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        
        birthDateView.topAnchor.constraint(equalTo: countryNameView.bottomAnchor, constant: 15).isActive = true
        birthDateView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        birthDateView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        birthDateView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        
        birthDate.topAnchor.constraint(equalTo: countryNameView.bottomAnchor, constant: 15).isActive = true
        birthDate.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        birthDate.rightAnchor.constraint(equalTo: countryNameView.rightAnchor, constant: -200).isActive = true
        birthDate.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
    }
    
}
