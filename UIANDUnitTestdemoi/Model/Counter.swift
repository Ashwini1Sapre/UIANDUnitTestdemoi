//
//  Counter.swift
//  UIANDUnitTestdemoi
//
//  Created by Knoxpo MacBook Pro on 28/12/20.
//

import Foundation
import Combine

class Counter: CounterProtocol
{
    
    var counter: AnyPublisher<Int, Never>
    {
        
        counterValue.eraseToAnyPublisher()
        
    }
    var iscounterStarted =  false{
        
        didSet{
            
            if iscounterStarted{
                service.startClock()
            }
            else{
                
                service.stopClock()
            }
            
            
        }
        
    }
    
    private let service: clockProtocol
    private var counterValue = CurrentValueSubject<Int, Never>(0)
    private var clockSubscription: Cancellable!
    
    
    init(service: clockProtocol = Clock()) {
        self.service = service
        clockSubscription = service.clock.sink { completion in
            print("Clock completion: \(completion)")
            
            self.counterValue.value = 0
            
            
            
        }
        receiveValue: { _ in
            self.counterValue.value += 1
            
            
        }
        
        
    }
    
    
    func resetCounter() {
        counterValue.value = 0
    }
    
}
