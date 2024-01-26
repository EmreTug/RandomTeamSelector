//
//  Team.swift
//  SelectionWheel
//
//  Created by Emre Tuğ on 19.01.2024.
//

import UIKit
struct Team{
    let name:String
    let logo:String
    let color : UIColor
    let textColor:UIColor
    init(name: String, logo: String, color: UIColor, textColor: UIColor) {
        self.name = name
        self.logo = logo
        self.color = color
        self.textColor = textColor
    }
}
