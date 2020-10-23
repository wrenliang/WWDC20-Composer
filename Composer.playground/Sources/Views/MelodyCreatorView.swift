import Foundation
import UIKit

public class MelodyCreatorView: UIView {
    var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Tap a note to listen!"
        label.font = UIFont.systemFont(ofSize: 28, weight: UIFont.Weight.heavy)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    var noteButtons: [UIButton] = {
        var buttons: [UIButton] = []
        
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
        
        /// Note: this is the same array used for button identification in VC
        let buttonFreqs: [NoteFreq] = [
            .C3, .D3, .E3, .F3, .G3, .A3, .B3, .C4
        ]
        
        for i in 0..<8 {
            let button = UIButton()
            button.tag = i
            
            button.setTitle(buttonFreqs[i].rawValue, for: .normal)
            button.setTitleColor(UIColor(red: 0.21, green: 0.22, blue: 0.22, alpha: 1.00), for: .normal)
            button.backgroundColor = buttonColors[i]
            button.layer.borderColor = UIColor.white.cgColor
            button.layer.borderWidth = 0
            button.layer.cornerRadius = 15
            
            buttons.append(button)
        }
        
        return buttons
    }()
    
    lazy var buttonRowOne: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        
        for i in 0..<4 {
            stack.addArrangedSubview(noteButtons[i])
        }
        
        return stack
    }()
    
    lazy var buttonRowTwo: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        
        for i in 4..<8 {
            stack.addArrangedSubview(noteButtons[i])
        }
        
        return stack
    }()
    
    var lengthSegmentControl: UISegmentedControl = {
        let options = ["Quarter", "Eighth"]
        let segment = UISegmentedControl(items: options)
        segment.translatesAutoresizingMaskIntoConstraints = false
        segment.selectedSegmentIndex = 1
        return segment
    }()
    
    var addButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Add!", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.bold)
        button.backgroundColor = UIColor(red: 0.08, green: 0.46, blue: 0.68, alpha: 1.00)
        button.layer.cornerRadius = 15
        
        return button
    }()
    
    var barOneLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Bar 1:"
        label.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.bold)
        label.textColor = .white
        label.textAlignment = .left
        
        return label
    }()
    
    var barOneStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        
        return stack
    }()
    
    var barTwoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Bar 2:"
        label.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.bold)
        label.textColor = .white
        label.textAlignment = .left
        
        return label
    }()
    
    var barTwoStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        
        return stack
    }()
    
    var barThreeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Bar 3:"
        label.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.bold)
        label.textColor = .white
        label.textAlignment = .left
        
        return label
    }()
    
    var barThreeStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        
        return stack
    }()
    
    var saveButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Save!", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.bold)
        button.backgroundColor = UIColor(red: 0.08, green: 0.46, blue: 0.68, alpha: 1.00)
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
        self.backgroundColor = UIColor(red: 0.11, green: 0.25, blue: 0.37, alpha: 1.00)
        
        addSubview(titleLabel)
        addSubview(buttonRowOne)
        addSubview(buttonRowTwo)
        addSubview(lengthSegmentControl)
        addSubview(addButton)
        
        addSubview(barOneLabel)
        addSubview(barOneStack)
        
        addSubview(barTwoLabel)
        addSubview(barTwoStack)
        
        addSubview(barThreeLabel)
        addSubview(barThreeStack)
        
        addSubview(saveButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        // MARK: titleLabel Constraints
        titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1.0).isActive = true
        
        // MARK: buttonRowOne Constraints
        buttonRowOne.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        buttonRowOne.centerXAnchor.constraint(equalToSystemSpacingAfter: centerXAnchor, multiplier: 1.0).isActive = true
        buttonRowOne.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.075).isActive = true
        buttonRowOne.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1.0).isActive = true
        
        // MARK: buttonRowTwo Constraints
        buttonRowTwo.topAnchor.constraint(equalTo: buttonRowOne.bottomAnchor, constant: 10).isActive = true
        buttonRowTwo.centerXAnchor.constraint(equalToSystemSpacingAfter: centerXAnchor, multiplier: 1.0).isActive = true
        buttonRowTwo.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.075).isActive = true
        buttonRowTwo.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1.0).isActive = true
        
        // MARK: lengthSegmentControl Constraints
        lengthSegmentControl.topAnchor.constraint(equalTo: buttonRowTwo.bottomAnchor, constant: 10).isActive = true
        lengthSegmentControl.centerXAnchor.constraint(equalToSystemSpacingAfter: centerXAnchor, multiplier: 1.0).isActive = true
        lengthSegmentControl.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.05).isActive = true
        lengthSegmentControl.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1.0).isActive = true
        
        // MARK: addButton Constraints
        addButton.topAnchor.constraint(equalTo: lengthSegmentControl.bottomAnchor, constant: 20).isActive = true
        addButton.centerXAnchor.constraint(equalToSystemSpacingAfter: centerXAnchor, multiplier: 1.0).isActive = true
        addButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.05).isActive = true
        addButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
        
        // MARK: barOneLabel Constraints
        barOneLabel.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 10).isActive = true
        barOneLabel.centerXAnchor.constraint(equalToSystemSpacingAfter: centerXAnchor, multiplier: 1.0).isActive = true
        barOneLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        barOneLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.95).isActive = true
        
        // MARK: barOneStack Constraints
        barOneStack.topAnchor.constraint(equalTo: barOneLabel.bottomAnchor, constant: 0).isActive = true
        barOneStack.centerXAnchor.constraint(equalToSystemSpacingAfter: centerXAnchor, multiplier: 1.0).isActive = true
        barOneStack.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.075).isActive = true
        barOneStack.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1.0).isActive = true
        
        // MARK: barTwoLabel Constraints
        barTwoLabel.topAnchor.constraint(equalTo: barOneStack.bottomAnchor, constant: 10).isActive = true
        barTwoLabel.centerXAnchor.constraint(equalToSystemSpacingAfter: centerXAnchor, multiplier: 1.0).isActive = true
        barTwoLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        barTwoLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.95).isActive = true
        
        // MARK: barTwoStack Constraints
        barTwoStack.topAnchor.constraint(equalTo: barTwoLabel.bottomAnchor, constant: 0).isActive = true
        barTwoStack.centerXAnchor.constraint(equalToSystemSpacingAfter: centerXAnchor, multiplier: 1.0).isActive = true
        barTwoStack.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.075).isActive = true
        barTwoStack.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1.0).isActive = true
        
        // MARK: barThreeLabel Constraints
        barThreeLabel.topAnchor.constraint(equalTo: barTwoStack.bottomAnchor, constant: 10).isActive = true
        barThreeLabel.centerXAnchor.constraint(equalToSystemSpacingAfter: centerXAnchor, multiplier: 1.0).isActive = true
        barThreeLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        barThreeLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.95).isActive = true
        
        // MARK: barThreeStack Constraints
        barThreeStack.topAnchor.constraint(equalTo: barThreeLabel.bottomAnchor, constant: 0).isActive = true
        barThreeStack.centerXAnchor.constraint(equalToSystemSpacingAfter: centerXAnchor, multiplier: 1.0).isActive = true
        barThreeStack.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.075).isActive = true
        barThreeStack.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1.0).isActive = true
        
        // MARK: saveButton Constraints
        saveButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        saveButton.centerXAnchor.constraint(equalToSystemSpacingAfter: centerXAnchor, multiplier: 1.0).isActive = true
        saveButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.05).isActive = true
        saveButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
        saveButton.isHidden = true
    }
}

class MelodyCreatorNoteView: UIView {
    public var intrinsicSize = 1.0
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .center
        
        return label
    }()
    
    var backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.backgroundColor = .blue
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(titleLabel)
        addSubview(backgroundView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        // MARK: titleLabel Constraints
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        titleLabel.layer.zPosition = 1
        
        // MARK: backgroundView Constraints
        backgroundView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        backgroundView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        backgroundView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.95).isActive = true
        backgroundView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1.0).isActive = true
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: CGFloat(intrinsicSize), height: 1.0)
    }
}
