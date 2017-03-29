//
//  VaporTestCase.swift
//  Channel
//
//  Created by Gianluca Tranchedone on 04/03/2017.
//
//

import XCTest
import Vapor
@testable import App

extension XCTestCase {
    func perform(_ closure: () throws -> ()) {
        do {
            try closure()
        }
        catch {
            XCTFail("\n\n😱 Error => \(error) 😱\n\n")
        }
    }
}

class VaporTestCase: XCTestCase {
    
    public var droplet: Droplet!
    
    override func setUp() {
        super.setUp()
        droplet = try! Droplet.dropletForTests()
        perform { 
            try App.configure(droplet: droplet)
            try droplet.setUp()
        }
    }
    
    override func tearDown() {
        perform {
            try droplet.tearDown()
        }
        super.tearDown()
    }
    
}
