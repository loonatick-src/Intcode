import XCTest

@testable import Intcode

final class ExecuteTests: XCTestCase {
    func testAoCExample1() throws {
        var intcodeProgram = [1, 9, 10, 3,
                                    2, 3, 11, 0,
                                    99,
                                    30, 40, 50]
        let outputProgram = [3500, 9, 10, 70,
                             2, 3, 11, 0,
                             99,
                             30, 40, 50]
        // Turning the program to its own type and using a method would make it clearer
        intcodeProgram = try! executeIntcodeProgram(intcodeProgram: &intcodeProgram)
        XCTAssertEqual(intcodeProgram, outputProgram)
    }
}