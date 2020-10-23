import Foundation
import UIKit

class ChordComposerView: UIView {
    var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.text = "Pick some chords to go with your piece!"
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 36.0, weight: UIFont.Weight.heavy)
        return label
    }()
    
    var chordProgressionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Main Progression"
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 24.0, weight: UIFont.Weight.bold)
        return label
    }()
    
    var chordPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.setValue(UIColor.white, forKey: "textColor")
        return picker
    }()
    
    var chordListenButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Listen!", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20.0, weight: UIFont.Weight.bold)
        button.backgroundColor = UIColor(red: 0.44, green: 0.65, blue: 0.82, alpha: 1.00)
        button.layer.cornerRadius = 15
        return button
    }()
    
    var cadenceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ending cadence"
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 24.0, weight: UIFont.Weight.bold)
        return label
    }()
    
    var cadencePicker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.setValue(UIColor.white, forKey: "textColor")
        return picker
    }()
    
    var cadenceListenButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Listen!", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20.0, weight: UIFont.Weight.bold)
        button.backgroundColor = UIColor(red: 0.44, green: 0.65, blue: 0.82, alpha: 1.00)
        button.layer.cornerRadius = 15
        return button
    }()
    
    var saveButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Save!", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20.0, weight: UIFont.Weight.bold)
        button.backgroundColor = UIColor(red: 0.44, green: 0.65, blue: 0.82, alpha: 1.00)
        button.layer.cornerRadius = 15
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.backgroundColor = UIColor(red: 0.26, green: 0.48, blue: 0.63, alpha: 1.00)
        
        addSubview(titleLabel)
        addSubview(chordProgressionLabel)
        addSubview(chordPicker)
        addSubview(chordListenButton)
        addSubview(cadenceLabel)
        addSubview(cadencePicker)
        addSubview(cadenceListenButton)
        addSubview(saveButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        // MARK: titleLabel Constraints
        titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0.0).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2).isActive = true
        
        // MARK: chordProgressionLabel Constraints
        chordProgressionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0.0).isActive = true
        chordProgressionLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        chordProgressionLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1.0).isActive = true
        chordProgressionLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        // MARK: chordPicker Constraints
        chordPicker.topAnchor.constraint(equalTo: chordProgressionLabel.bottomAnchor, constant: 0.0).isActive = true
        chordPicker.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        chordPicker.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.75).isActive = true
        chordPicker.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15).isActive = true
        
        // MARK: chordListenButton Constraints
        chordListenButton.topAnchor.constraint(equalTo: chordPicker.bottomAnchor, constant: 10.0).isActive = true
        chordListenButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        chordListenButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
        chordListenButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.05).isActive = true
        
        // MARK: cadenceLabel Constraints
        cadenceLabel.topAnchor.constraint(equalTo: chordListenButton.bottomAnchor, constant: 50.0).isActive = true
        cadenceLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        cadenceLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1.0).isActive = true
        cadenceLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        // MARK: cadencePicker Constraints
        cadencePicker.topAnchor.constraint(equalTo: cadenceLabel.bottomAnchor, constant: 0.0).isActive = true
        cadencePicker.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        cadencePicker.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.75).isActive = true
        cadencePicker.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15).isActive = true
        
        // MARK: cadenceListenButton Constraints
        cadenceListenButton.topAnchor.constraint(equalTo: cadencePicker.bottomAnchor, constant: 10.0).isActive = true
        cadenceListenButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        cadenceListenButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
        cadenceListenButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.05).isActive = true
        
        // MARK: saveButton Constraints
        saveButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -25.0).isActive = true
        saveButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        saveButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
        saveButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.05).isActive = true
    }
}
