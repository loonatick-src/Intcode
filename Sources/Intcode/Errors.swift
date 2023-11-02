enum IntcodeErrors: Error {
    case illegalOpcode(opcode: Int)
}