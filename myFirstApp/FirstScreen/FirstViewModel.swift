//
//  FirstViewModel.swift
//  myFirstApp
//
//  Created by Sind Bad on 13.04.2020.
//  Copyright © 2020 Still Beat. All rights reserved.
//

import Foundation
protocol FirstViewModelDelegate {
    func CountBechanges()
}
class FirstViewModel {
    
    var count = 0
    var delegate: FirstViewModelDelegate?
    
    func plusOne() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.count += 1
            self.delegate?.CountBechanges() }
    }
    
    func minusOne() {
        if count > 0 {
            count = count - 1}
        delegate?.CountBechanges()
    }
    
    func reset() {
        count = 0
        delegate?.CountBechanges()
    }
    
}
