//
//  CountryModel.swift
//  Corona Now
//
//  Created by Miguel Moya on 8/5/20.
//  Copyright © 2020 Miguel Moya. All rights reserved.
//

import Foundation

struct CountryModel: Codable {
    let country: String
    let cases: Int
    let recovered: Int
    let tests: Int
}

