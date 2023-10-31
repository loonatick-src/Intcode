func parseIntcodeProgram(_ programString: String) -> [Int]? {
    var intcode: [Int] = []
    guard let stringStartIndex = programString.firstIndex(where: { $0.isNumber }) else {
        // malformed or empty program
        return nil
    }
    var programSubstring = programString[stringStartIndex...]
    var startIndex = String.Index(encodedOffset:0)
    while let endIndex = programSubstring.firstIndex(of:",") {
        let token = programSubstring[startIndex..<endIndex]
        guard let num = Int(token) else {
            return nil  // malformed program
        }
        intcode.append(num)
        programSubstring = programSubstring[endIndex...]
        guard let newStartIndex = programSubstring.firstIndex(where: { $0.isNumber }) else {
            return nil   // malformed program: program no numeric lexemes after `,`
        }
        startIndex = newStartIndex
        programSubstring = programSubstring[startIndex...]
    }
    let lastToken = programSubstring
    guard let num = Int(lastToken) else {
        return nil  // malformed program?
    }
    intcode.append(num)
    return intcode
}