//
//  ViewController.swift
//  mvvm_practice
//
//  Created by 노주영 on 2022/05/31.
//

import UIKit
import Combine

class ViewController: UIViewController {

    var viewModel: ViewModel = ViewModel()
    
    var disposalbleBag = Set<AnyCancellable>()          //버릴 가방
    
    var tempArray: UIColor?
    
    let mybutton: UIButton = {
        let button = UIButton()
        button.setTitle("색 변경", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .white
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let myView: UIView = {
       let view = UIView()
        view.backgroundColor = .systemYellow
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.setBinding()
        
        self.uiCreate()
    }
    
    func uiCreate(){
        //뷰
        self.view.addSubview(self.myView)
        
        self.myView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.myView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.myView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.myView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        //버튼
        self.view.addSubview(self.mybutton)
        
        self.mybutton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 150).isActive = true
        self.mybutton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.mybutton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        self.mybutton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        self.mybutton.addTarget(self, action: #selector(sendChangeColor(_:)), for: .touchUpInside)
        
    }
    
    //뷰 모델 관련 메소드
    //뷰 모델의 데이터를 뷰 컨의 리스트 데이터와 연동
    func setBinding(){
        print("setBinding")
        self.viewModel.$viewColor.sink{ (updatedList : UIColor) in
            self.tempArray = updatedList
        }.store(in: &disposalbleBag)
    }
    
    @objc func sendChangeColor(_ sender: UIButton){
        
        self.viewModel.changeColor()
        self.myView.backgroundColor = self.tempArray
    }


}

