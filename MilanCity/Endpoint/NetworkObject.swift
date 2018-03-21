//
//  NetworkObject.swift
//  MilanCity
//
//  Created by Federico Castelli on 18/03/18.
//  Copyright © 2018 Pimpi. All rights reserved.
//

import Foundation
import Alamofire
import EVReflection

class NetworkObject: EVObject {
    
    var errorMessage: String? = nil
    
    override func skipPropertyValue(_ value: Any, key: String) -> Bool {
        if let value = value as? String, value.count == 0 || value == "null" {
            //print("Ignoring empty string for key \(key)")
            return true
        } else if let value = value as? NSArray, value.count == 0 {
            //print("Ignoring empty NSArray for key\(key)")
            return true
        } else if value is NSNull {
            //print("Ignoring NSNull for key \(key)")
            return true
        }
        return false
    }
    
    func toParameters () -> Parameters {
        return self.toDictionary() as! Parameters
    }
    
}
