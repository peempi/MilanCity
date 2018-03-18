//
//  Endpoint.swift
//  MilanCity
//
//  Created by francesco frontino on 18/03/18.
//  Copyright © 2018 Pimpi. All rights reserved.
//

import Foundation
import Alamofire
import EVReflection

class Endpoint {

    var basePath: String = ""
    var EndPointPath: String{
        return "https://int-ecommerce.nexi.it/ecomm/api/recurring/" + basePath;
    }
    init() {
    }
}
