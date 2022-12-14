//
//  ApiUltilities.swift
//  Longdh_HealthTracker_TextureDemo
//
//  Created by Hoang Long on 28/06/2022.
//

import Foundation
import Alamofire

protocol JsonInitObject: NSObject {
    init(json: [String: Any])
}


final class APIUtilities {
    static let domain = "https://gist.githubusercontent.com"
    static let responseDataKey = "data"
    static let responseDataItems = "items"
    static let responseCodeKey = "code"
    static let responseMessageKey = "message"
    
    static func requestHomePatientNewsFeed(completionHandler: ((HomeModel?, APIError?) -> Void)?) {
        
        let tailStrURL = "/hdhuy179/f967ffb777610529b678f0d5c823352a/raw"
        
        jsonResponseObject(tailStrURL: tailStrURL, method: .get, headers: [:], completionHandler: completionHandler)
    }
    

    
    
        
    static private func jsonResponseObject<T: JsonInitObject>(tailStrURL: String, method: HTTPMethod, headers: HTTPHeaders, completionHandler: ((T?, APIError?) -> Void)?) {
        
        jsonResponse(tailStrURL: tailStrURL, isPublicAPI: false, method: method, headers: headers) { response, serverCode, serverMessage in
            
            switch response.result {
            case .success(let value):
                guard serverCode == 200 else {
                    completionHandler?(nil, .serverError(serverCode, serverMessage))
                    return
                }
                
                guard let responseDict = value as? [String: Any],
                      let dataDict = responseDict[responseDataKey] as? [String: Any] else {
                          completionHandler?(nil, .resposeFormatError)
                          return
                      }
                
                let obj = T(json: dataDict)
                
                completionHandler?(obj, nil)
                
            case .failure(let error):
                completionHandler?(nil, .unowned(error))
            }
        }
    }
    
    static private func jsonResponse(tailStrURL: String,
                                     isPublicAPI: Bool,
                                     method: HTTPMethod,
                                     parameters: Parameters? = nil,
                                     encoding: ParameterEncoding = JSONEncoding.default,
                                     headers: HTTPHeaders = [:],
                                     completionHandler: ((AFDataResponse<Any>, Int?, String?) -> Void)?) {
        
        guard let url = URL(string: domain + tailStrURL) else { return }
        AF.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers)
            .responseJSON { response in
                
                var serverCode: Int? = nil
                var serverMessage: String? = nil
                
                switch response.result {
                case .success(let value):
                    serverCode = (value as? [String: Any])?[responseCodeKey] as? Int
                    serverMessage = (value as? [String: Any])?[responseMessageKey] as? String
                case .failure(_):
                    break
                }
                
                completionHandler?(response, serverCode, serverMessage)
            }
    }

    
}

extension APIUtilities {
    enum APIError: Error {
        case resposeFormatError
        case serverError(Int?, String?)
        case unowned(Error)
    }
}
