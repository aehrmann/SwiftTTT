public enum Mark: Character, Printable {
    case X = "X"
    case O = "O"
    case Blank = "_"

    public var description: String {
        return String(self.rawValue)
    }
}