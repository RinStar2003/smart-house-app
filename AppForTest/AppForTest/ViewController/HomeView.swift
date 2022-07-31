//
//  ViewController.swift
//  AppForTest
//
//  Created by мас on 21.07.2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    let modelManager = DataViewModel()
    var data = [Device]()
    
    var tableView = UITableView()
    var count: Int = 0
    let cellId = "cellId"
    
    // MARK: - API Text
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "ProfilePicture"))
        /// Enables autolayout for our image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let welcomeTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Welcome back!"
        textView.font = UIFont.boldSystemFont(ofSize: 30)
        textView.backgroundColor = UIColor(named: "LightSteelBlue")
        textView.textColor = .white
        textView.textAlignment = .center
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    let profileInfoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Account Info", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - View Setup

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        modelManager.fetchData { d in
            
            self.data = d.devices
            
            DispatchQueue.main.async {
                
                self.view.backgroundColor = UIColor(named: "LightSteelBlue")
                self.view.addSubview(self.profileImageView)
                self.view.addSubview(self.profileInfoButton)
                self.view.addSubview(self.welcomeTextView)
                
                /* let searchBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "info.circle"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.settingsOpen))
                self.navigationItem.rightBarButtonItem = searchBarButtonItem
                searchBarButtonItem.tintColor = .white */
                
                self.tableView.reloadData()
                self.setupLayout()
                self.configureTableView()
                
            }
        }
    }
    
    // MARK: - Layout Setup

    private func setupLayout() {
    
        profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        profileImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 160).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 160).isActive = true
        
        profileInfoButton.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: -10).isActive = true
        profileInfoButton.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        profileInfoButton.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true

        profileInfoButton.addTarget(self, action: #selector(answerAction), for: .touchUpInside)
        
        welcomeTextView.topAnchor.constraint(equalTo: profileInfoButton.bottomAnchor, constant: 10).isActive = true
        welcomeTextView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        welcomeTextView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
    }
    
    func configureTableView() {
        
        view.addSubview(tableView)
        
        setTableViewDelegate()
        
        tableView.rowHeight = 80
        
    }
    
    func setTableViewDelegate() {
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: welcomeTextView.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        tableView.layer.cornerRadius = 45
        tableView.separatorColor = UIColor(named: "DarkGray")
        tableView.backgroundColor = UIColor(named: "White")
        tableView.separatorInset = .zero
        
    }
    
    // MARK: - Actions
    @objc func answerAction() {
        
        let controller = AccountViewController()
        self.present(controller, animated: true, completion: nil)
        
    }
    
    @objc func settingsOpen() {
        
        let controller = SettingsView()
        self.present(controller, animated: true, completion: nil)
        
    }
    
}

    // MARK: - Table View Data Configuration

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = MoreInfoView()
        navigationController?.navigationBar.tintColor = .white
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        cell.backgroundColor = UIColor(named: "White")
        if cell.detailTextLabel == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
        }
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = data[indexPath.row].deviceName
        
        cell.detailTextLabel?.text = {
           
            if data[indexPath.row].productType == "RollerShutter" && data[indexPath.row].position == 0 {
                return "Closed"
            } else if data[indexPath.row].productType == "RollerShutter" && data[indexPath.row].position == 100 {
                return "Opened"
            } else if data[indexPath.row].productType == "RollerShutter" && data[indexPath.row].position != 100 {
                return "Opened at \(data[indexPath.row].position ?? 0)%"
            } else if data[indexPath.row].productType == "Heater" && data[indexPath.row].mode != "OFF" {
                return "On at \(data[indexPath.row].temperature ?? 0)°C"
            } else if data[indexPath.row].productType == "Heater" && data[indexPath.row].mode == "OFF" {
                return "Off"
            } else if data[indexPath.row].productType == "Light" && data[indexPath.row].mode != "OFF" {
                return "On at \(data[indexPath.row].intensity ?? 0)%"
            }
            else {
                return ""
            }

        }()
        
        cell.imageView?.image = {
            if data[indexPath.row].productType == "Light" && data[indexPath.row].mode == "ON" {
                return UIImage(named: "DeviceLightOnIcon")
            }
            if data[indexPath.row].productType == "Light" && data[indexPath.row].mode == "OFF" {
                return UIImage(named: "DeviceLightOffIcon")
            }
            if data[indexPath.row].productType == "Heater" && data[indexPath.row].mode == "ON" {
                return UIImage(named: "DeviceHeaterOnIcon")
            }
            if data[indexPath.row].productType == "Heater" && data[indexPath.row].mode == "OFF" {
                return UIImage(named: "DeviceHeaterOffIcon")
            }
            if data[indexPath.row].productType == "RollerShutter" {
                return UIImage(named: "DeviceRollerShutterIcon")
            } else {
                return UIImage(named: "@")
            }
        }()
        
        
        return cell
    }
}


