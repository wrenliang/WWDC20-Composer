/*:
 * * * *
 ## Table of Contents
 - [Homepage](Homepage)
 - [Using Samples](Samples)
 - [App Demo!](App)
 
 * * * *
 # Playing the Samples in Swift
 Using AVAudioPlayers from AVFoundation, I can control the playback of my recordings in the app.
 */
import Foundation
import PlaygroundSupport

let singleTrackController = TrackController(type: .Chord, volume: 1.0)
singleTrackController.playNote(Note(freq: .F1, length: .Half))
// Click play up to this line to hear the note!
/*:
 Because AVFoundation's audio engine supports concurrent playback, we can combine multiple TrackControllers into a larger abstraction: the ChordController. A ChordController is parent to four TrackControllers, and it completely encapsulates the responsibility of playing chords using these child controllers. As a result, we can directly feed it a sequence of chords, without worrying about the individual notes.
 */
let chordController = ChordController()
let sequence = [
    Chord(tonality: .Cmajorfull, length: .Half),
    Chord(tonality: .Gmajorfull, length: .Half),
    Chord(tonality: .Cmajorfull, length: .Half)]
chordController.chordProgression = sequence

DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
    chordController.startSequence()
})
// Play the entire page to hear the single note, followed by the chords

//: [Next](@next)



