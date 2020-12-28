//
//  FakeCounter.swift
//  UIANDUnitTestdemoiTests
//
//  Created by Knoxpo MacBook Pro on 28/12/20.
//

import XCTest
import Combine
@testable import UIANDUnitTestdemoi
class FakeCounter: CounterProtocol {

   
    
    let coungtersubject = PassthroughSubject<Int, Never>()
    var counter: AnyPublisher<Int, Never>{
        
        coungtersubject.eraseToAnyPublisher()
    }

    
    var iscounterStarted: Bool
    var resetWasCalled = false
    
    
    init(iscounterStarted: Bool) {
        
        self.iscounterStarted = iscounterStarted
    }
    
    
    func resetCounter()  {
        resetWasCalled = true
    }
    
}
