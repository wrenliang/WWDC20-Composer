import Foundation
import UIKit

public class ChordController: UIViewController {
    public var chordProgression: [Chord] = []
    
    var trackControllers: [TrackController] = []
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        initTrackControllers()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initTrackControllers() {
        let numTracks = 4
        for _ in 0..<numTracks {
            let controller = TrackController(type: .Chord, volume: 0.75)
            addChild(controller)
            trackControllers.append(controller)
        }
    }
    
    private func translateChordsToTrackNotes() {
        for controller in trackControllers {
            controller.sequence.removeAll()
        }
        for chord in chordProgression {
            let notes = convertChordNotes(of: chord)
            
            for i in 0..<trackControllers.count {
                if i < notes.count {
                    trackControllers[i].sequence.append(notes[i])
                } else {
                    trackControllers[i].sequence.append(Note(freq: .Rest, length: chord.length))
                }
            }
        }
    }
    
    public func startSequence() {
        translateChordsToTrackNotes()
        for controller in trackControllers {
            controller.startSequence()
        }
    }
    
    public func stopSequence() {
        for controller in trackControllers {
            controller.stopSequence()
        }
    }
}
