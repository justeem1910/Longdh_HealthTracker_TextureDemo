//
//  Constaint.swift
//  Longdh_HealthTracker_TextureDemo
//
//  Created by Hoang Long on 26/07/2022.
//

import Foundation
import UIKit

class Constant {
    struct Size{
        static let imageUserHeight = CGFloat(42)
        static let imageUserWidth = CGFloat(42)
        static let spacingImageUser = CGFloat(16)
        
        static let imageNewsCellWidth = CGFloat(258)
        static let imageNewsCellHeight = CGFloat(134)
        
        static let newsCollectionCellWidth = CGFloat(258)
        static let newsCollectionCellHeight = CGFloat(220)
        static let newsTableCellHeight = CGFloat(286)
        
        
        static let imageDoctorCellWidth = CGFloat(97)
        static let imageDoctorCellHeight = CGFloat(97)
        
        static let textTitleTableCellWidth = CGFloat(200)
        static let textTitleTableCellHeight = CGFloat(22)
        
        static let textDoctorCellWidth = CGFloat(97)
        
        static let imageStarCellWidth = CGFloat(12)
        static let imageStarCellHeight = CGFloat(12)
        
        static let spacingButtonSeeAll = CGFloat(16)
        static let buttonSeeAllWidth = CGFloat(82)
        
        static let spacingTextTitleTableCell = CGFloat(16)
        static let spacingCollectionCell = CGFloat(12)
        
        static let doctorCollectionCellMaxHeight = CGFloat(195)
        static let doctorCollectionCellWidth = CGFloat(121)
        static let doctorTableCellHeight = CGFloat(286)
    
    }
    struct Image {
        static let status = "status"
        static let star = "Star"
        static let backgroundHeader = "imgHomeBg"
        static let eclipse = "eclipseTextCellHome"
        static let user = "avatarUser"
        static let doctor = "imageDoctor"
        static let seeAll = "imgSeeAll"
    }
    struct Font {
        static let nunitoRegular = "NunitoSans-Regular"
        static let nunitoBold = "NunitoSans-Bold"
        static let nunitoSemiBold = "NunitoSans-SemiBold"
    }
    struct Color {
        static let purple1 = UIColor.init(red: 36/255 , green: 42/255 , blue: 97/255, alpha: 1.0)
        static let gradientIntroStart = UIColor.init(red: 166/255 , green: 241/255 , blue: 247/255, alpha: 1.0)
        static let gradientIntroEnd = UIColor.init(red: 243/255 , green: 245/255 , blue: 251/255, alpha: 1.0)
        static let green = UIColor.init(red: 44/255, green: 134/255, blue: 103/255, alpha: 1.0)
        static let green2 = UIColor.init(red: 44/255, green: 134/255, blue: 103/255, alpha: 0.3)
        static let gray5 = UIColor.init(red: 238/255, green: 239/255, blue: 244/255, alpha: 1.0)
        static let gray2 = UIColor.init(red: 71/255, green: 74/255, blue: 87/255, alpha: 1)
        static let gray1 = UIColor.init(red: 24/255, green: 25/255, blue: 31/255, alpha: 1)
        static let gray3 = UIColor.init(red: 150/255, green: 155/255, blue: 171/255, alpha: 1)
        static let gray4 = UIColor.init(red: 217/255, green: 219/255, blue: 225/255, alpha: 1)
        static let Monochrome = UIColor.init(red: 54/255, green: 61/255, blue: 78/255, alpha: 1)
        static let shadowColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.1)
        static let lineColor = UIColor.init(red: 229/255, green: 229/255, blue: 229/255, alpha: 1)
    }
}

enum TypeCell{
    case newsCell
    case promotionCell
    case DoctorScreen
}
