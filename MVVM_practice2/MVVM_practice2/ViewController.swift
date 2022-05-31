//
//  ViewController.swift
//  MVVM_practice2
//
//  Created by 노주영 on 2022/06/01.
//

import UIKit

class ViewController: UIViewController {
    
    let myLabel : UILabel = {
        let label = UILabel()
        label.text = "아직 정보가 없습니다."
        label.textColor = .white
        label.backgroundColor = .black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        
        label.layer.cornerRadius = 5
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let myButton: UIButton = {
        let button = UIButton()
        button.setTitle("Click", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .white
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
       uiCreate()
    }
    
    func uiCreate(){
        self.view.addSubview(self.myLabel)
        
        NSLayoutConstraint.activate([
            self.myLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.myLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.myLabel.widthAnchor.constraint(equalToConstant: 250),
            self.myLabel.heightAnchor.constraint(equalToConstant: 50)
            
        ])
        
        self.view.addSubview(self.myButton)
        
        self.myButton.topAnchor.constraint(equalTo: self.myLabel.bottomAnchor, constant: 20).isActive = true
        self.myButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.myButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        self.myButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }


}

