public enum Mark: String, Printable {
    case X = "X"
    case O = "O"
    case Blank = "_"

    public var description: String {
        return self.rawValue
    }
}