import XCTest
@testable import BigNum

final class BigRatTests: XCTestCase {
    private typealias BI = BigInt
    private typealias BQ = BigRat
    private typealias II = Int
    private typealias IQ = IntRat
    
    func testBigRatBasic() {
        XCTAssertEqual(+BI(2).over(+4), BI(+1).over(+2))
        XCTAssertEqual(-BI(2).over(+4), BI(-1).over(+2))
        XCTAssertEqual(+BI(2).over(-4), BI(-1).over(+2))
        XCTAssertEqual(-BI(2).over(-4), BI(+1).over(+2))
        XCTAssertEqual( BI(1).over(2) + BI(1).over(3), BI(5).over(6))
        XCTAssertEqual( BI(1).over(2) - BI(1).over(3), BI(1).over(6))
        XCTAssertEqual( BI(1).over(2) * BI(1).over(3), BI(1).over(6))
        XCTAssertEqual( BI(1).over(2) / BI(1).over(3), BI(3).over(2))
        XCTAssertEqual(BQ(+Double.pi).asDouble, +Double.pi)
        XCTAssertEqual(BQ(-Double.pi).asDouble, -Double.pi)
    }
    func testIntRatBasic() {
        XCTAssertEqual(+II(2).over(+4), II(+1).over(+2))
        XCTAssertEqual(-II(2).over(+4), II(-1).over(+2))
        XCTAssertEqual(+II(2).over(-4), II(-1).over(+2))
        XCTAssertEqual(-II(2).over(-4), II(+1).over(+2))
        XCTAssertEqual( II(1).over(2) + II(1).over(3), II(5).over(6))
        XCTAssertEqual( II(1).over(2) - II(1).over(3), II(1).over(6))
        XCTAssertEqual( II(1).over(2) * II(1).over(3), II(1).over(6))
        XCTAssertEqual( II(1).over(2) / II(1).over(3), II(3).over(2))
        XCTAssertEqual(IQ(+Double.pi).asDouble, +Double.pi)
        XCTAssertEqual(IQ(-Double.pi).asDouble, -Double.pi)
    }
   func testBigRatNaN() {
        let nan = BI(0).over(0)
        let one = BI(1).over(1)
        XCTAssertTrue (nan.isNaN)
        XCTAssertFalse(nan.isZero)
        XCTAssertFalse(nan.isInfinite)
        XCTAssertFalse(nan.isFinite)
        XCTAssertFalse(nan == nan)
        XCTAssertFalse(nan <  0)
        XCTAssertFalse(nan <= 0)
        XCTAssertFalse(nan >= 0)
        XCTAssertFalse(nan >  0)
        XCTAssertTrue ((nan + one).isNaN)
        XCTAssertTrue ((nan - one).isNaN)
        XCTAssertTrue ((nan * one).isNaN)
        XCTAssertTrue ((nan / one).isNaN)
        XCTAssertTrue (nan.squareRoot().isNaN)
        XCTAssertTrue (BQ.exp(nan).isNaN)
    }
    func testIntRatNaN() {
        let nan = II(0).over(0)
        let one = II(1).over(1)
        XCTAssertTrue (nan.isNaN)
        XCTAssertFalse(nan.isZero)
        XCTAssertFalse(nan.isInfinite)
        XCTAssertFalse(nan.isFinite)
        XCTAssertFalse(nan == nan)
        XCTAssertFalse(nan <  0)
        XCTAssertFalse(nan <= 0)
        XCTAssertFalse(nan >= 0)
        XCTAssertFalse(nan >  0)
        XCTAssertTrue ((nan + one).isNaN)
        XCTAssertTrue ((nan - one).isNaN)
        XCTAssertTrue ((nan * one).isNaN)
        XCTAssertTrue ((nan / one).isNaN)
        XCTAssertTrue (nan.squareRoot().isNaN)
    }
    func testIntRatInt() {
        let inf = II(1).over(0)
        XCTAssert(inf.isInfinite)

    }
     static var testAll = [
        ("testBigRatBasic", testBigRatBasic),
        ("testIntRatBasic", testIntRatBasic),
        ("testBigRatNaN", testBigRatNaN),
        ("testIntRatNaN", testIntRatNaN),
     ]
}
