import Foundation
import UIKit

public class MelodyCreatorViewController: UIViewController {
    public var sequence: [Note] = []
    var saveDelegate: ComposerMenuViewController?
    
    var melodyCreatorView: MelodyCreatorView!
    var trackController: TrackController
    
    var lastNoteSelected = 0
    var currentBar = 0
    var currentBarCumulativeNoteValue = 0.0
    
    /// Note: this is the same array used to initialize noteButtons
    let buttonFreqs: [NoteFreq] = [
        .C3, .D3, .E3, .F3, .G3, .A3, .B3, .C4
    ]
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.trackController = TrackController(type: .Melody, volume: 1.0)
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        let myView = MelodyCreatorView()
        for button in myView.noteButtons {
            button.addTarget(self, action: #selector(noteTapped), for: .touchUpInside)
        }
        myView.addButton.addTarget(self, action: #selector(addTapped), for: .touchUpInside)
        myView.saveButton.addTarget(self, action: #selector(saveTapped), for: .touchUpInside)
        
        self.view = myView
        melodyCreatorView = myView
    }
    
    @objc func noteTapped(sender: UIButton) {
        lastNoteSelected = sender.tag
        trackController.playNote(Note(freq: buttonFreqs[lastNoteSelected], length: .Quarter))
        
        for button in melodyCreatorView.noteButtons {
            button.layer.borderWidth = 0
        }
        
        melodyCreatorView.noteButtons[sender.tag].layer.borderWidth = 10
    }
    
    @objc func addTapped(sender: UIButton) {
        /// Note: this is the same array used for color passing in VC
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

        // MARK: - Adding to sequence
        var length: NoteLength
        if melodyCreatorView.lengthSegmentControl.selectedSegmentIndex == 0 {
            length = .Quarter
        } else {
            length = .Eighth
        }
        let note = Note(freq: buttonFreqs[lastNoteSelected], length: length)
        sequence.append(note)
        
        // MARK: - Updating StackView
        var stackView: UIStackView?
        switch currentBar {
        case 0:
            stackView = melodyCreatorView.barOneStack
            break
        case 1:
            stackView = melodyCreatorView.barTwoStack
            break
        case 2:
            stackView = melodyCreatorView.barThreeStack
            break
        default:
            print("ERROR: currentBar (\(currentBar)) exceeded total number of bars")
        }
        
        let newNoteView = MelodyCreatorNoteView()
        newNoteView.titleLabel.text = note.freq.rawValue
        newNoteView.backgroundColor = .clear
        newNoteView.backgroundView.backgroundColor = buttonColors[lastNoteSelected]
        
        if length == .Quarter {
            newNoteView.intrinsicSize = 1.0
            currentBarCumulativeNoteValue += 1.0
        } else {
            newNoteView.intrinsicSize = 0.5
            currentBarCumulativeNoteValue += 0.5
        }

        // MARK: - Update Segmented Availability, possibly reset bar
        if currentBarCumulativeNoteValue == 4.0 {
            currentBar += 1
            currentBarCumulativeNoteValue = 0
            
            // all available again
            melodyCreatorView.lengthSegmentControl.setEnabled(true, forSegmentAt: 0)
            melodyCreatorView.lengthSegmentControl.setEnabled(true, forSegmentAt: 1)
            melodyCreatorView.lengthSegmentControl.selectedSegmentIndex = 0
        } else if currentBarCumulativeNoteValue == 3.5 {
            //quarter note not available
            melodyCreatorView.lengthSegmentControl.setEnabled(false, forSegmentAt: 0)
            melodyCreatorView.lengthSegmentControl.setEnabled(true, forSegmentAt: 1)
            melodyCreatorView.lengthSegmentControl.selectedSegmentIndex = 1
        }
        
        
        // MARK: - Button click animation, and decide if want to show save button and disable add
        if currentBar > 2 {
            melodyCreatorView.addButton.isEnabled = false
            melodyCreatorView.saveButton.isHidden = false
            stackView?.addArrangedSubview(newNoteView)
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                self.melodyCreatorView.buttonRowOne.layer.opacity = 0.0
                self.melodyCreatorView.buttonRowTwo.layer.opacity = 0.0
            }, completion: {
                completed in
                stackView?.addArrangedSubview(newNoteView)
                UIView.animate(withDuration: 0.5, animations: {
                    self.melodyCreatorView.buttonRowOne.layer.opacity = 1.0
                    self.melodyCreatorView.buttonRowTwo.layer.opacity = 1.0
                })
            })
        }
    }
    
    @objc func saveTapped(sender: UIButton) {
        self.saveDelegate?.saveMelodySequence(self.sequence)
        self.navigationController?.popViewController(animated: true)
    }
}
