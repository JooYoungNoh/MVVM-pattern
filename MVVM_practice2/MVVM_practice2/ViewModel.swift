//
//  ViewModel.swift
//  MVVM_practice2
//
//  Created by 노주영 on 2022/06/01.
//

import Foundation


class ViewModel {
    var timeResult: String = "아직 로딩중..."
    
    func openAPI() {
        let url = URL(string: "http://worldclockapi.com/api/json/utc/now")!
        
        URLSession.shared.dataTask(with: url){ (data, respone, error) in
            if error != nil{
                print(error!.localizedDescription)
            } else {
                guard let data = data else { return }
                
                let timeAPI: Time = try! JSONDecoder().decode(Time.self, from: data)
                
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd'T'HH:mm'Z'"
                
                guard let now = formatter.date(from: timeAPI.currentDateTime!) else { return }
                
                self.timeResult = self.dateToString(date: now)
                
            }
        }.resume()
    }
    
    func dateToString(date: Date) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일 HH시 mm분"
        
        let stringTime = formatter.string(from: date)
        
        return stringTime
    }
}
