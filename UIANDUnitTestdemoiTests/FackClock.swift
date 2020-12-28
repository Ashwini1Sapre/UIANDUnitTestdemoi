//
//  FackClock.swift
//  UIANDUnitTestdemoiTests
//
//  Created by Knoxpo MacBook Pro on 28/12/20.
//

import Foundation
import Combine
@testable import UIANDUnitTestdemoi

class FackClock: clockProtocol
{
    let clockSubject = PassthroughSubject<Date, ClockError>()
    var clock: AnyPublisher<Date, ClockError>
    {
        
        return clockSubject.eraseToAnyPublisher()
        
    }
    var clockWasStarted = false
    func startClock() {
        clockWasStarted = true
    }
    
    var clockWasStppped = false
    func stopClock() {
        clockWasStppped = true
    }
    
    
    
}
