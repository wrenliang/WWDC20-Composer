import Foundation

public struct Note {
    var freq: NoteFreq
    var length: NoteLength
    
    public init(freq: NoteFreq, length: NoteLength) {
        self.freq = freq
        self.length = length
    }
}

public enum NoteFreq: String, CaseIterable {
    case Rest = "Rest"
    
    // MARK: - Chord Notes (Half & Quarter Length only)
    /// Octave 1
    case C1 = "C1"
    case D1 = "D1"
    case E1 = "E1"
    case F1 = "F1"
    case G1 = "G1"
    case A1 = "A1"
    case B1 = "B1"
    
    /// Octave 2
    case C2 = "C2"
    case D2 = "D2"
    case E2 = "E2"
    case F2 = "F2"
    case G2 = "G2"
    
    // MARK: - Melody Notes (Quarter & Eighth Length only)
    /// Octave 3
    case C3 = "C3"
    case D3 = "D3"
    case E3 = "E3"
    case F3 = "F3"
    case G3 = "G3"
    case A3 = "A3"
    case B3 = "B3"
    case C4 = "C4"
    
}

public enum NoteLength: String {
    case Half = "half"
    case Quarter = "quarter"
    case Eighth = "eighth"
}
