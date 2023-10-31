import XCTest

@testable import Intcode

final class ParseTests: XCTestCase {
    func testEmpty() {
        let testCases = ["", ",", ", ", "  ", " "]
        for programString in testCases {
            XCTAssertNil(parseIntcodeProgram(programString))
        }
    }

    func testSepratorVariability() {
        let testCases = ["1,2,3,4", "1, 2, 3, 4", "1, 2,3, 4"]
        for programString in testCases {
            XCTAssertEqual(parseIntcodeProgram(programString)!, [1,2,3,4])
        }
    }

    func testMalformedProgramsBasic() {
        XCTAssertNil(parseIntcodeProgram("23, @#"))
        XCTAssertNil(parseIntcodeProgram("42, "))
    }
}

// TODO: tests for Cstrings, i.e. `[cChar]` ?