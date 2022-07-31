//
//  TableViewCell.swift
//  AppForTest
//
//  Created by мас on 28.07.2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    var typeImageView  = UIImageView()
    var typeTitleLabel = UILabel()
    var dataModel = DataViewModel()
    var data = [Device]()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        dataModel.fetchData { device in
            
            self.data = device.devices
            
            DispatchQueue.main.async {
                
                self.addSubview(self.typeImageView)
                self.addSubview(self.typeTitleLabel)
                
                self.configureImageView()
                self.configureTitleLabel()
                
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
    func set(data: Device) {
        typeTitleLabel.text = data.deviceName
        typeImageView.image = UIImage(named: "DeviceLightOnIcon")
    }
    
    func configureImageView() {
        
        typeImageView.layer.cornerRadius = 5
        typeImageView.clipsToBounds = true
        
        typeImageView.translatesAutoresizingMaskIntoConstraints = false
        typeImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        typeImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        typeImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        typeImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
    }
    
    func configureTitleLabel() {
        
        typeTitleLabel.numberOfLines = 0
        typeTitleLabel.adjustsFontSizeToFitWidth = true
        
        typeTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        typeTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        typeTitleLabel.leadingAnchor.constraint(equalTo: typeImageView.trailingAnchor, constant: 20).isActive = true
        typeTitleLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        typeTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        
    }
    
}
