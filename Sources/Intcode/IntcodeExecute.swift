func executeIntcodeProgram(intcodeProgram: inout [Int]) throws -> [Int] {
    var instructionPointer = 0
    while (instructionPointer < intcodeProgram.count) {
        let opcode = intcodeProgram[instructionPointer]

        switch opcode {
        case 99:
            // TODO: how does a guy break out of a loop from a switch statement?
            instructionPointer = intcodeProgram.count
        case 1...2 :
            let destination1 = intcodeProgram[instructionPointer + 1]
            let destination2 = intcodeProgram[instructionPointer + 2]
            let destination3 = intcodeProgram[instructionPointer + 3]
            let operand1 = intcodeProgram[destination1]
            let operand2 = intcodeProgram[destination2]
            let result1 = operand1 + operand2
            let result2 = operand1 * operand2
            // Please use cmov mrs compiler
            intcodeProgram[destination3] = (opcode == 1) ? result1 : result2
            instructionPointer += 4
        default:
            throw IntcodeErrors.illegalOpcode(opcode:opcode)
        }
    }
    return intcodeProgram
}
