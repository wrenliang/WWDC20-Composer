import Foundation
import UIKit

class ChordComposerViewController: UIViewController {
    var chordComposerView: ChordComposerView!
    
    var chordPickerController: PickerViewController?
    var cadencePickerController: PickerViewController?
    
    var chordController: ChordController?
    
    var saveDelegate: ComposerMenuViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chordPickerController = PickerViewController(options: ChordProgressions)
        cadencePickerController = PickerViewController(options: Cadences)
        
        chordController = ChordController()
        
        let myView = ChordComposerView()
        myView.chordListenButton.addTarget(self, action: #selector(chordListenTapped), for: .touchUpInside)
        myView.cadenceListenButton.addTarget(self, action: #selector(cadenceListenTapped), for: .touchUpInside)
        myView.saveButton.addTarget(self, action: #selector(saveTapped), for: .touchUpInside)
        
        myView.chordPicker.delegate = chordPickerController
        myView.chordPicker.dataSource = chordPickerController
        myView.cadencePicker.delegate = cadencePickerController
        myView.cadencePicker.dataSource = cadencePickerController
        
        
        chordComposerView = myView
        self.view = myView
    }
    
    @objc func chordListenTapped() {
        chordController?.stopSequence()
        
        guard let selectedIndex = chordComposerView?.chordPicker.selectedRow(inComponent: 0) else { return }
        guard let chordsChosen = chordPickerController?.options[selectedIndex] else { return }
        
        chordController?.chordProgression = chordsChosen.1
        chordController?.startSequence()
    }
    
    @objc func cadenceListenTapped() {
        chordController?.stopSequence()
        
        guard let selectedIndex = chordComposerView?.cadencePicker.selectedRow(inComponent: 0) else { return }
        guard let chordsChosen = cadencePickerController?.options[selectedIndex] else { return }
        
        chordController?.chordProgression = chordsChosen.1
        chordController?.startSequence()
    }
    
    @objc func saveTapped() {
        chordController?.stopSequence()
        
        guard let chordIndex = chordComposerView?.chordPicker.selectedRow(inComponent: 0) else { return }
        guard let chords = chordPickerController?.options[chordIndex] else { return }
        guard let cadenceIndex = chordComposerView?.cadencePicker.selectedRow(inComponent: 0) else { return }
        guard let cadence = cadencePickerController?.options[cadenceIndex] else { return }
        
        var finalChordCompilation: [Chord] = []
        finalChordCompilation.append(contentsOf: chords.1) // Two bars of regular chord progression
        finalChordCompilation.append(contentsOf: chords.1) // Two bars of regular chord progression
        finalChordCompilation.append(contentsOf: cadence.1)
        
        saveDelegate?.saveChordProgression(finalChordCompilation)
        
        self.navigationController?.popViewController(animated: true)
    }
}

class PickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var options: [(String, [Chord])]
    
    init(options: [(String, [Chord])] ) {
        self.options = options
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return options.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return options[row].0
    }
}
