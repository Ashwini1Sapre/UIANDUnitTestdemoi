//
//  DummyViewModel.swift
//  UIANDUnitTestdemoi
//
//  Created by Knoxpo MacBook Pro on 28/12/20.
//

import Foundation
import Combine

class DummyViewModel: ViewModelProtocol {
    
    @Published var value: Int
    @Published var isCounterStarted: Bool
    
    init(value: Int, isCounterStarted: Bool) {
        self.value = value
        self.isCounterStarted = isCounterStarted
    }
    
    func reset() {
        self.value = -1
    }
}
