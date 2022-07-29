//
//  HomeModel.swift
//  Longdh_HealthTracker_TextureDemo
//
//  Created by Hoang Long on 29/07/2022.
//

import Foundation
class HomeModel: NSObject, JsonInitObject {
    
    var articleList     : [ArticleHomeModel]?
    var doctorList     : [DoctorHomeModel]?
    var promotionList     : [PromotionHomeModel]?
    
    convenience init(articleList: [ArticleHomeModel]?,
                     doctorList: [DoctorHomeModel]?,
                     promotionList: [PromotionHomeModel]?) {
        
        self.init()
        
        self.articleList = articleList
        self.doctorList = doctorList
        self.promotionList = promotionList
    }
    
    
    required convenience init(json: [String: Any]) {
        self.init()
        
        if let wrapValue = json["articleList"] as? [[String: Any]]{
            let jsonValue = wrapValue.map({ ArticleHomeModel(json: $0)})
            self.articleList = jsonValue
        }
        if let wrapValue = json["doctorList"] as? [[String: Any]]{
            let jsonValue = wrapValue.map({ DoctorHomeModel(json: $0)})
            self.doctorList = jsonValue
        }
        if let wrapValue = json["promotionList"] as? [[String: Any]]{
            let jsonValue = wrapValue.map({ PromotionHomeModel(json: $0)})
            self.promotionList = jsonValue
        }
    }
}
