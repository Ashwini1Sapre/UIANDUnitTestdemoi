//
//  CounterProtocol.swift
//  UIANDUnitTestdemoi
//
//  Created by Knoxpo MacBook Pro on 28/12/20.
//

import Foundation
import Combine

protocol CounterProtocol {
    
    var counter: AnyPublisher<Int, Never> {get}
    var iscounterStarted: Bool { get set }
    func resetCounter()
    
    
}
