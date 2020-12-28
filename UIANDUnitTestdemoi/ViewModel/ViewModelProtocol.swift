//
//  ViewModelProtocol.swift
//  UIANDUnitTestdemoi
//
//  Created by Knoxpo MacBook Pro on 28/12/20.
//

import Foundation

protocol ViewModelProtocol: ObservableObject {
//    var value: Int { get set }
//    var isCounterStarted: Bool { get set }
//    func reset()
    
    var value: Int { get set }
    var isCounterStarted: Bool { get set }
    
    func reset()
    
}
