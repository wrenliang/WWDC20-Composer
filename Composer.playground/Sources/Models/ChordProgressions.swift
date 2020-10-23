import Foundation

public let ChordProgressions: [(String, [Chord])] = [
    ("I - IV - V - I", [
        Chord(tonality: .Cmajor1, length: .Quarter),
        Chord(tonality: .Fmajor, length: .Quarter),
        Chord(tonality: .Gmajor, length: .Quarter),
        Chord(tonality: .Cmajor1, length: .Quarter)
    ]),
    
    ("V - IV - I - I", [
        Chord(tonality: .Gmajor, length: .Quarter),
        Chord(tonality: .Fmajor, length: .Quarter),
        Chord(tonality: .Cmajor1, length: .Quarter),
        Chord(tonality: .Cmajor1, length: .Quarter)
    ]),
    
    ("I - iii - ii - V", [
        Chord(tonality: .Cmajor1, length: .Quarter),
        Chord(tonality: .Eminor, length: .Quarter),
        Chord(tonality: .Dminor, length: .Quarter),
        Chord(tonality: .Gmajor, length: .Quarter)
    ]),
    
    ("I - vi - IV - V", [
        Chord(tonality: .Cmajor1, length: .Quarter),
        Chord(tonality: .Aminor, length: .Quarter),
        Chord(tonality: .Fmajor, length: .Quarter),
        Chord(tonality: .Gmajor, length: .Quarter)
    ]),
    
    ("I - vi - ii - V", [
        Chord(tonality: .Cmajor1, length: .Quarter),
        Chord(tonality: .Aminor, length: .Quarter),
        Chord(tonality: .Dminor, length: .Quarter),
        Chord(tonality: .Gmajor, length: .Quarter)
    ])
]

public let Cadences: [(String, [Chord])] = [
    ("Perfect", [
        Chord(tonality: .Cmajor1, length: .Quarter),
        Chord(tonality: .Gmajor7, length: .Quarter),
        Chord(tonality: .Cmajorfull, length: .Half)
    ]),
    
    ("Plagal", [
        Chord(tonality: .Cmajor1, length: .Quarter),
        Chord(tonality: .Dminor, length: .Quarter),
        Chord(tonality: .Fmajor, length: .Quarter),
        Chord(tonality: .Cmajorfull, length: .Quarter)
    ]),
    
    ("Imperfect", [
        Chord(tonality: .Cmajor1, length: .Quarter),
        Chord(tonality: .Fmajor, length: .Quarter),
        Chord(tonality: .Cmajor1, length: .Quarter),
        Chord(tonality: .Gmajorfull, length: .Quarter)
    ])
]
