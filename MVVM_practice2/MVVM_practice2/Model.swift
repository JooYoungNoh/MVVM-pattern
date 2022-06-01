//
//  Model.swift
//  MVVM_practice2
//
//  Created by 노주영 on 2022/06/01.
//

import Foundation

struct Time: Codable{
    let id: String?
    let currentDateTime: String?
    let utcOffset: String?
    let isDayLightSavingsTime: Bool?
    let dayOfTheWeek: String?
    let timeZoneName: String?
    let currentFileTime: Int?
    let ordinalDate: String?
    let serviceResponse: String?
    
}
