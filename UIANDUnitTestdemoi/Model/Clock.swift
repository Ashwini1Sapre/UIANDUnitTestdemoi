//
//  Clock.swift
//  UIANDUnitTestdemoi
//
//  Created by Knoxpo MacBook Pro on 28/12/20.
//

import Foundation
import Combine

class Clock: clockProtocol{
    
    var clock: AnyPublisher<Date, ClockError>
    {
        
        clockMulticaster.eraseToAnyPublisher()
        
    }
    
    private let clockMulticaster = PassthroughSubject<Date, ClockError>()
    private var timeSubscription: Cancellable?
    
    func startClock() {
        timeSubscription = Timer.publish(every: 1.0, on: .main, in: .default)
        .autoconnect()
            .setFailureType(to: ClockError.self)
            .multicast(subject: clockMulticaster)
            .connect()
        
    }
    
    
    func stopClock() {
        timeSubscription?.cancel()
    }
    
}
