//
//  Death.swift
//  myFirstApp
//
//  Created by Тарас Евченко on 20.04.2020.
//  Copyright © 2020 Still Beat. All rights reserved.
//

import Foundation

struct Deaths: Codable {
    
    var total : Int
    
    enum CodingKeys: String, CodingKey {
        case total
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(total, forKey: .total)
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        total = try container.decode(Int.self, forKey: .total)
    }
}
