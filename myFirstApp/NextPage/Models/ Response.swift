//
//   Response.swift
//  myFirstApp
//
//  Created by Тарас Евченко on 20.04.2020.
//  Copyright © 2020 Still Beat. All rights reserved.
//

import Foundation

struct Response: Codable {
    
    var covids : [Covid]
    
    enum CodingKeys: String, CodingKey {
        case covids = "response"
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(covids, forKey: .covids)
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        covids = try container.decode([Covid].self, forKey: .covids)
    }
}
