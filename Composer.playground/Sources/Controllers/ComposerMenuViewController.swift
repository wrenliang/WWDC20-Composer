import Foundation
import UIKit

public class ComposerMenuViewController: UIViewController {
    var composerMenuView: ComposerMenuView!
    
    var melodyController: TrackController?
    var chordController: ChordController?
    
    public var melodySequence: [Note] = []
    public var chordProgression: [Chord] = []
    var selectedMelody = false {
        didSet {
            if selectedMelody && selectedChords {
                composerMenuView.enablePlayback()
            }
        }
    }
    var selectedChords = false {
        didSet {
            if selectedMelody && selectedChords {
                composerMenuView.enablePlayback()
            }
        }
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        melodyController = TrackController(type: .Melody, volume: 1.0)
        melodyController?.colorDelegate = self
        chordController = ChordController()
        
        let myView = ComposerMenuView()
        myView.composeOptionsStack.isUserInteractionEnabled = true
        
        let chordTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(chordOptionTapped))
        let melodyTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(melodyOptionTapped))
        if let chord = myView.composeOptionsStack.arrangedSubviews[0] as? ComposerMenuOptionView,
            let melody = myView.composeOptionsStack.arrangedSubviews[1] as? ComposerMenuOptionView {
            chord.backgroundView.isUserInteractionEnabled = true
            chord.backgroundView.addGestureRecognizer(chordTapRecognizer)
            melody.backgroundView.isUserInteractionEnabled = true
            melody.backgroundView.addGestureRecognizer(melodyTapRecognizer)
        }
        
        myView.playbackButton.addTarget(self, action: #selector(playbackTapped), for: .touchUpInside)

        composerMenuView = myView
        self.view = myView
    }
    
    @objc func chordOptionTapped() {
        if !selectedChords {
            presentChordsView()
        } else {
            let alert = UIAlertController(title: "Modifying chords will replace your previous selections", message: "Do you want to do this?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Modify", style: .default, handler: {
                _ in
                self.presentChordsView()
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                _ in
            }))
            
            self.present(alert, animated: true)
        }
    }
    
    private func presentChordsView() {
        let chordVC = ChordComposerViewController()
        chordVC.saveDelegate = self
        self.navigationController?.pushViewController(chordVC, animated: true)
    }
    
    @objc func melodyOptionTapped() {
        if !selectedMelody {
            presentMelodyView()
        } else {
            let alert = UIAlertController(title: "Modifying the melody will replace your old selections", message: "Do you want to do this?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Modify", style: .default, handler: {
                _ in
                self.presentMelodyView()
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                _ in
            }))
            
            self.present(alert, animated: true)
        }
    }
    
    private func presentMelodyView() {
        let melodyVC = MelodyCreatorViewController()
        melodyVC.saveDelegate = self
        self.navigationController?.pushViewController(melodyVC, animated: true)
    }
    
    
    @objc func playbackTapped() {
        melodyController?.stopSequence()
        chordController?.stopSequence()
        
        melodyController?.sequence = melodySequence
        chordController?.chordProgression = chordProgression
        
        melodyController?.startSequence()
        chordController?.startSequence()
        
        composerMenuView.playbackDisplay.isHidden = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 13.0, execute: {
            self.composerMenuView.playbackDisplay.isHidden = true
            self.composerMenuView.titleLabel.textColor = .white
        })
    }
}

extension ComposerMenuViewController {
    public func saveMelodySequence(_ sequence: [Note]) {
        self.melodySequence = sequence
        selectedMelody = true
        if let melodyOption = self.composerMenuView.composeOptionsStack.arrangedSubviews[1] as? ComposerMenuOptionView {
            melodyOption.titleLabel.text = "Melody chosen ✅"
        }
    }
    public func saveChordProgression(_ progression: [Chord]) {
        self.chordProgression = progression
        selectedChords = true
        
        if let chordOption = self.composerMenuView.composeOptionsStack.arrangedSubviews[0] as? ComposerMenuOptionView {
            chordOption.titleLabel.text = "Chords chosen ✅"
        }
    }
}

extension ComposerMenuViewController {
    public func nextNoteBeingPlayed(_ note: Note) {
        /// Note: this is the same array as in MelodyComposerViewController
        let buttonColors: [UIColor] = [
            UIColor(red: 1.00, green: 0.68, blue: 0.68, alpha: 1.00),
            UIColor(red: 1.00, green: 0.84, blue: 0.65, alpha: 1.00),
            UIColor(red: 0.99, green: 1.00, blue: 0.71, alpha: 1.00),
            UIColor(red: 0.79, green: 1.00, blue: 0.75, alpha: 1.00),
            UIColor(red: 0.70, green: 0.98, blue: 0.87, alpha: 1.00),
            UIColor(red: 0.61, green: 0.96, blue: 1.00, alpha: 1.00),
            UIColor(red: 0.63, green: 0.77, blue: 1.00, alpha: 1.00),
            UIColor(red: 0.74, green: 0.70, blue: 1.00, alpha: 1.00)
        ]
        if note.freq == .C3 {
            self.composerMenuView.titleLabel.textColor = buttonColors[0]
        } else if note.freq == .D3 {
            self.composerMenuView.titleLabel.textColor = buttonColors[1]
        } else if note.freq == .E3 {
            self.composerMenuView.titleLabel.textColor = buttonColors[2]
        } else if note.freq == .F3 {
            self.composerMenuView.titleLabel.textColor = buttonColors[3]
        } else if note.freq == .G3 {
            self.composerMenuView.titleLabel.textColor = buttonColors[4]
        } else if note.freq == .A3 {
            self.composerMenuView.titleLabel.textColor = buttonColors[5]
        } else if note.freq == .B3 {
            self.composerMenuView.titleLabel.textColor = buttonColors[6]
        } else if note.freq == .C4 {
            self.composerMenuView.titleLabel.textColor = buttonColors[7]
        }
    }
}
