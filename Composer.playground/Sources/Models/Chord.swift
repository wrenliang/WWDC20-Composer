import Foundation

public struct Chord {
    var tonality: ChordTonality
    var length: NoteLength
    
    public init(tonality: ChordTonality, length: NoteLength) {
        self.tonality = tonality
        self.length = length
    }
}

public enum ChordTonality: CaseIterable {
    
    /// 3-note chords
    case Cmajor1
    case Dminor
    case Eminor
    case Fmajor
    case Gmajor
    case Aminor
    case Bdiminished
    case Cmajorfull
    
    /// 4-note chords
    case Gmajor7 // G major dominant 7th chord
    case Gmajorfull
}

public func convertChordNotes(of chord: Chord) -> [Note] {
    let noteLength = chord.length
    
    var noteArr: [Note] = []
    
    switch chord.tonality {
    case .Cmajor1:
        noteArr.append(Note(freq: .C1, length: noteLength))
        noteArr.append(Note(freq: .E1, length: noteLength))
        noteArr.append(Note(freq: .G1, length: noteLength))
        break
    case .Dminor:
        noteArr.append(Note(freq: .D1, length: noteLength))
        noteArr.append(Note(freq: .F1, length: noteLength))
        noteArr.append(Note(freq: .A1, length: noteLength))
        break
    case .Eminor:
        noteArr.append(Note(freq: .E1, length: noteLength))
        noteArr.append(Note(freq: .G1, length: noteLength))
        noteArr.append(Note(freq: .B1, length: noteLength))
        break
    case .Fmajor:
        noteArr.append(Note(freq: .F1, length: noteLength))
        noteArr.append(Note(freq: .A1, length: noteLength))
        noteArr.append(Note(freq: .C2, length: noteLength))
        break
    case .Gmajor:
        noteArr.append(Note(freq: .G1, length: noteLength))
        noteArr.append(Note(freq: .B1, length: noteLength))
        noteArr.append(Note(freq: .D2, length: noteLength))
        break
    case .Aminor:
        noteArr.append(Note(freq: .A1, length: noteLength))
        noteArr.append(Note(freq: .C2, length: noteLength))
        noteArr.append(Note(freq: .E2, length: noteLength))
        break
    case .Bdiminished:
        noteArr.append(Note(freq: .B1, length: noteLength))
        noteArr.append(Note(freq: .D2, length: noteLength))
        noteArr.append(Note(freq: .F2, length: noteLength))
        break
    case .Cmajorfull:
        noteArr.append(Note(freq: .C1, length: noteLength))
        noteArr.append(Note(freq: .E1, length: noteLength))
        noteArr.append(Note(freq: .G1, length: noteLength))
        noteArr.append(Note(freq: .C2, length: noteLength))
        break
    case .Gmajor7:
        noteArr.append(Note(freq: .G1, length: noteLength))
        noteArr.append(Note(freq: .B1, length: noteLength))
        noteArr.append(Note(freq: .D2, length: noteLength))
        noteArr.append(Note(freq: .F2, length: noteLength))
        break
    case .Gmajorfull:
        noteArr.append(Note(freq: .G1, length: noteLength))
        noteArr.append(Note(freq: .B1, length: noteLength))
        noteArr.append(Note(freq: .D2, length: noteLength))
        noteArr.append(Note(freq: .G2, length: noteLength))
        break
    }
    
    return noteArr
}
