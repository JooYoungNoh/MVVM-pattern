//
//  ViewModel.swift
//  mvvm_practice
//
//  Created by 노주영 on 2022/05/31.
//

import Combine
import UIKit

//뷰 모델 - 데이터 상태를 가지고 있음
class ViewModel: ObservableObject{
    
    var indexNumber: Int = 0
    
    let tempArray: [UIColor] = [.red, .blue, .green]
    
    @Published var viewColor: UIColor = .systemYellow
    
    init(){
        print("ViewModel")
    }
    
    func changeColor(){
        switch self.indexNumber{
        case 0:
            viewColor = tempArray[0]
            self.indexNumber = 1
        case 1:
            viewColor = tempArray[1]
            self.indexNumber = 2
        case 2:
            viewColor = tempArray[2]
            self.indexNumber = 0
        default:
            ""
        }
    }
}
