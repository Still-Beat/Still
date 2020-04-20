//
//  Cases.swift
//  myFirstApp
//
//  Created by Тарас Евченко on 20.04.2020.
//  Copyright © 2020 Still Beat. All rights reserved.
//

import Foundation

struct Cases: Codable {
    
    var recovered : Int
    
    enum CodingKeys: String, CodingKey {
        case recovered
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(recovered, forKey: .recovered)
        
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        recovered = try container.decode(Int.self, forKey: .recovered)
        
    }
    
}
