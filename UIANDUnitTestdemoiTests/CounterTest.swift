//
//  CounterTest.swift
//  UIANDUnitTestdemoiTests
//
//  Created by Knoxpo MacBook Pro on 28/12/20.
//

import XCTest
import Combine
@testable import UIANDUnitTestdemoi
class CounterTest: XCTestCase {
    private var counter: Counter!
    private var fackClock: FackClock!
    
    override func setUp() {
        fackClock = FackClock()
        counter = Counter(service: fackClock)
    }
    func testCounterIsIniallyStopped()  {
        XCTAssertFalse(counter.iscounterStarted)
    }
    
    func testcounterIsinitialySetToZero()
    {
        
        let expected = self.expectation(description: "wait for counter")
        
        var i = 0
        let sub = counter.counter.sink { value in
            i += 1
            switch i {
            case 1:
                XCTAssertEqual(value, 0)
                expected.fulfill()
            default:
                XCTFail()
            
            
            
            }
            
            
            
        }
        waitForExpectations(timeout: 5.0) { _ in
            sub.cancel()
            
            
        }
        
        
    }
    
    func testStartingCounterStartsClockServise()
    {
        counter.iscounterStarted = true
        XCTAssertTrue(fackClock.clockWasStarted)
        
        
    }
    
    func testResiveclockforIncrementCounter()
    {
        
        let expect =  self.expectation(description: "wait for counter")
        var i = 0
        let sub = counter.counter.sink{ value in
           i += 1
            switch i{
            case 1:
                XCTAssertEqual(value, 0)
                self.fackClock.clockSubject.send(Date())
            case 2:
                XCTAssertEqual(value, 1)
                expect.fulfill()
            
            default:
                XCTFail()
            
            
            }
            
            
            
            
        }
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
