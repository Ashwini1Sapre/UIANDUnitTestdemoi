//
//  clockProtocol.swift
//  UIANDUnitTestdemoi
//
//  Created by Knoxpo MacBook Pro on 28/12/20.
//

import Foundation
import Combine

protocol clockProtocol {
    var clock: AnyPublisher<Date, ClockError> { get }
    
    func startClock()
    func stopClock()
    
}
