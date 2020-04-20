//
//  Covid.swift
//  myFirstApp
//
//  Created by Тарас Евченко on 20.04.2020.
//  Copyright © 2020 Still Beat. All rights reserved.
//

import Foundation

struct Covid: Codable {
    
    var country: String
    var day: String
    var tests: Tests
    var deaths : Deaths
    var cases : Cases
    
    
    enum CodingKeys: String, CodingKey {
        case country
        case day
        case deaths
        case cases
        case tests
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(country, forKey: .country)
        try container.encode(day,forKey: .day)
        try container.encode(cases, forKey: .cases)
        try container.encode(deaths, forKey: .deaths)
        try container.encode(tests, forKey: .tests)
    }
    
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        country = try container.decode(String.self, forKey: .country)
        day = try container.decode(String.self, forKey: .day)
        cases = try container.decode(Cases.self, forKey: .cases)
        deaths = try container.decode(Deaths.self, forKey: .deaths)
        tests = try container.decode(Tests.self, forKey: .tests)
        
        
    }
}

