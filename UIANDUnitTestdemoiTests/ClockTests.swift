//
//  ClockTests.swift
//  UIANDUnitTestdemoiTests
//
//  Created by Knoxpo MacBook Pro on 28/12/20.
//

import XCTest
import Combine
@testable import UIANDUnitTestdemoi
class ClockTests: XCTestCase {

    private var clock: Clock!
    
    override func setUp() {
        clock = Clock()
    }
    
    func testClockDoesNothingAfterinit()
    {
        let expected = self.expectation(description: "wait for serice timer")
        let sub = clock.clock.sink(receiveCompletion:{ _ in
            XCTFail()
            
            
        }, receiveValue: { value in
            XCTFail()
            
            
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
            
            expected.fulfill()
        }
        
        waitForExpectations(timeout: 5.0){ _ in
            sub.cancel()
            
        }
        
    }
    
    
    func testclocksendeverySecondWhenStarted()
    {
        let expted = self.expectation(description: "wait for servise")
        var i = 0
        let start = Date()
        
        let sub = clock.clock.sink(receiveCompletion: { _ in
            XCTFail()
            
        }, receiveValue: { value in
            i += 1
            switch i {
            case 1:
                XCTAssertEqual(start.timeIntervalSinceNow, -1.0, accuracy: 0.5)
            case 2:
                XCTAssertEqual(start.timeIntervalSinceNow, -2.0, accuracy: 0.5)
                
            case 3:
                XCTAssertEqual(start.timeIntervalSinceNow, -3.0,accuracy: 0.5)
                expted.fulfill()
            default:
                XCTFail()
            
            }
            
            
            
        })
        clock.startClock()
        waitForExpectations(timeout: 5.0) { _ in
            sub.cancel()
            
            
        }
        
        
    }
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
