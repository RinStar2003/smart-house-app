//
//  MoreInfoView.swift
//  AppForTest
//
//  Created by мас on 30.07.2022.
//

import UIKit

class MoreInfoView: UIViewController {

    let modelManager = DataViewModel()
    var data = [Device]()
    
    lazy var onOffSwitch: UISwitch = {
        let onOffSwitch = UISwitch()
        onOffSwitch.translatesAutoresizingMaskIntoConstraints = false
        return onOffSwitch
    }()
    
    var onOffText: UITextView = {
        var textView = UITextView()
        textView.font = UIFont.boldSystemFont(ofSize: 30)
        textView.backgroundColor = UIColor(named: "LightSteelBlue")
        textView.textColor = .white
        textView.textAlignment = .center
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(named: "LightSteelBlue")
        
        modelManager.fetchData { device in
            self.data = device.devices
            
            DispatchQueue.main.async {
                
                self.view.addSubview(self.onOffSwitch)
                self.onOffSwitch.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
                self.onOffSwitch.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
                
            }
        }
    }
    
    func onOffAction() {
        
    }
    
}
