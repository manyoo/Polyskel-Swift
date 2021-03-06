//
//  LinesTests.swift
//  GeometryScriptTests
//
//  Created by Andy Geers on 20/11/2019.
//  Copyright © 2019 Andy Geers. All rights reserved.
//

import Polyskel
import Euclid
import XCTest

class LinesTests: XCTestCase {
    
    // MARK: Vector distance
    
    func testDistanceFromPointSimple() {
        let l = Line(origin: Vector(0, 0, 0), direction: Vector(1, 0, 0))!
        let p = Vector(15, 2, 0)
        XCTAssertEqual(l.distance(to: p), 2)
    }
    
    func testDistanceFromPointHarder() {
        let l = Line(origin: Vector(0, 0, 0), direction: Vector(1, 0, 0))!
        let p = Vector(15, 2, 3)
        XCTAssertEqual(l.distance(to: p), (2*2 + 3*3).squareRoot())
    }
    
    func testLineIntersectionXY() {
        let l1 = Line(origin: Vector(1, 0, 3), direction: Vector(1, 0, 0))!
        let l2 = Line(origin: Vector(0, 1, 3), direction: Vector(0, -1, 0))!
        
        let intersection = l1.intersection(with: l2)
        XCTAssertNotNil(intersection)
        if (intersection != nil) {
            XCTAssertEqual(intersection, Vector(0, 0, 3).quantized())
        }
    }
    
    func testLineIntersectionXZ() {
        let l1 = Line(origin: Vector(1, 3, 0), direction: Vector(1, 0, 0))!
        let l2 = Line(origin: Vector(0, 3, 1), direction: Vector(0, 0, -1))!
        
        let intersection = l1.intersection(with: l2)
        XCTAssertNotNil(intersection)
        if (intersection != nil) {
            XCTAssertEqual(intersection, Vector(0, 3, 0).quantized())
        }
    }
    
    func testLineIntersectionYZ() {
        let l1 = Line(origin: Vector(3, 1, 0), direction: Vector(0, 1, 0))!
        let l2 = Line(origin: Vector(3, 0, 1), direction: Vector(0, 0, -1))!
        
        let intersection = l1.intersection(with: l2)
        XCTAssertNotNil(intersection)
        if (intersection != nil) {
            XCTAssertEqual(intersection, Vector(3, 0, 0).quantized())
        }
    }
    
    func testLineSegmentMidpoint() {
        let l = LineSegment(Vector(0, 0, 0), Vector(10, 0, 0))!
        let midpoint = l.midPoint
        XCTAssertEqual(Vector(5, 0, 0), midpoint)
    }
}

class LineSegmentsTests: XCTestCase {
    
    // MARK: Vector distance
    
    func testLineSegmentIntersectionXY() {
        let l1 = LineSegment(Vector(-1, 0, 3), Vector(2, 0, 3))!
        let l2 = LineSegment(Vector(0, 1, 3), Vector(0, 0, 3))!
        
        let intersection = l1.intersection(with: l2)
        XCTAssertNotNil(intersection)
        if (intersection != nil) {
            XCTAssertEqual(intersection, Vector(0, 0, 3).quantized())
        }
    }
    
    func testLineSegmentIntersectionXYShort() {
        let l1 = LineSegment(Vector(1, 0, 3), Vector(2, 0, 3))!
        let l2 = LineSegment(Vector(0, 1, 3), Vector(0, 0, 3))!
        
        let intersection = l1.intersection(with: l2)
        XCTAssertNil(intersection)
    }
    
    func testLineSegmentIntersectionXZ() {
        let l1 = LineSegment(Vector(-1, 3, 0), Vector(2, 3, 0))!
        let l2 = LineSegment(Vector(0, 3, 1), Vector(0, 3, 0))!
        
        let intersection = l1.intersection(with: l2)
        XCTAssertNotNil(intersection)
        if (intersection != nil) {
            XCTAssertEqual(intersection, Vector(0, 3, 0).quantized())
        }
    }
    
    func testLineSegmentIntersectionXZShort() {
        let l1 = LineSegment(Vector(1, 3, 0), Vector(2, 3, 0))!
        let l2 = LineSegment(Vector(0, 3, 1), Vector(0, 3, 0))!
        
        let intersection = l1.intersection(with: l2)
        XCTAssertNil(intersection)        
    }
    
    func testLineSegmentIntersectionYZ() {
        let l1 = LineSegment(Vector(3, -1, 0), Vector(3, 2, 0))!
        let l2 = LineSegment(Vector(3, 0, 1), Vector(3, 0, 0))!
        
        let intersection = l1.intersection(with: l2)
        XCTAssertNotNil(intersection)
        if (intersection != nil) {
            XCTAssertEqual(intersection, Vector(3, 0, 0).quantized())
        }
    }
        
}
