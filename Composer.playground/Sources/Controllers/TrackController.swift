import Foundation
import UIKit
import AVFoundation

///Note: rawValue is the directory name for the sound files
public enum TrackControllerType: String {
    case Chord = "Chords"
    case Melody = "Melody"
}

public class TrackController: UIViewController {
    public var sequence: [Note] = []
    
    var colorDelegate: ComposerMenuViewController?
    
    /// Maps String "length" -> dictionary [String: AVAudioPlayer] that maps String "frequency" -> appropriate AVAudioPlayer
    var audioPlayers: [String: [String:AVAudioPlayer]] = [:]
    var playingSequence = false
    var noteIndex = 0
    
    public init(type: TrackControllerType, volume: Float) {
        super.init(nibName: nil, bundle: nil)
        playerSetup(type: type, volume: volume)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func playerSetup(type: TrackControllerType, volume: Float) {
        if type == .Chord {
            audioPlayers[NoteLength.Half.rawValue] = [:]
            audioPlayers[NoteLength.Quarter.rawValue] = [:]
            let lengths: [NoteLength] = [.Half, .Quarter]
            let freqs: [NoteFreq] = [.C1, .D1, .E1, .F1, .G1, .A1, .B1, .C2, .D2, .E2, .F2, .G2]
            createPlayers(lengths: lengths, freqs: freqs, type: type, volume: volume)
        } else if type == .Melody {
            audioPlayers[NoteLength.Quarter.rawValue] = [:]
            audioPlayers[NoteLength.Eighth.rawValue] = [:]
            let lengths: [NoteLength] = [.Quarter, .Eighth]
            let freqs: [NoteFreq] = [.C3, .D3, .E3, .F3, .G3, .A3, .B3, .C4]
            createPlayers(lengths: lengths, freqs: freqs, type: type, volume: volume)
        }
    }
    
    private func createPlayers(lengths: [NoteLength], freqs: [NoteFreq], type: TrackControllerType, volume: Float) {
        for length in lengths {
            for freq in freqs {
                var filename = ""
                filename.append(freq.rawValue)
                filename.append("-")
                filename.append(length.rawValue)
                
                
                guard let path = Bundle.main.path(forResource: filename, ofType: "mp3", inDirectory: type.rawValue) else {
                    print("ERROR: Could not resolve path. Quitting initializer.")
                    return
                }
                let url = URL(fileURLWithPath: path)
                do {
                    let player = try AVAudioPlayer(contentsOf: url)
                    player.delegate = self
                    player.volume = volume
                    audioPlayers[length.rawValue]![freq.rawValue] = player
                } catch {
                    print("ERROR: Could build AVAudioPlayer using the file \(filename)")
                    return
                }
                
            }
        }
    }
    
    public func playNote(_ note: Note) {
        if note.freq == .Rest {
            let secondsPerBeat = 1
            var restTime: Double = Double(secondsPerBeat)
            
            switch note.length {
            case .Half:
                restTime *= 2
                break
            case .Quarter:
                restTime *= 1
                break
            case .Eighth:
                restTime /= 2
                break
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + restTime, execute: { self.progressToNextNote(nil, successfully: true) })
        }  else {
            if let player = audioPlayers[note.length.rawValue]?[note.freq.rawValue] {
                self.colorDelegate?.nextNoteBeingPlayed(note)
                player.play()
           } else {
               print("ERROR: Unable to find appropriate player")
           }
       }
    }
    
    public func startSequence() {
        noteIndex = 0
        playingSequence = true
        playNote(sequence[noteIndex])
        noteIndex += 1
    }
    
    public func stopSequence() {
        playingSequence = false
        noteIndex = 0
        
        for lengthDict in audioPlayers {
            for player in lengthDict.value {
                player.value.stop()
                player.value.currentTime = 0
            }
        }
    }
}

extension TrackController: AVAudioPlayerDelegate {
    public func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        progressToNextNote(player, successfully: flag)
    }
    
    private func progressToNextNote(_ player: AVAudioPlayer?, successfully flag: Bool) {
        if playingSequence {
            if noteIndex < sequence.count {
                playNote(sequence[noteIndex])
                noteIndex += 1
            } else {
                playingSequence = false
                noteIndex = 0
            }
        }
    }
}

