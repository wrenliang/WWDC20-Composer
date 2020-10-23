import Foundation
import UIKit

public class ComposerMenuView: UIView {
    var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "🎻 Composer 🎻"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 40.0, weight: UIFont.Weight.heavy)
        label.textAlignment = .center
        return label
    }()
    
    var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.text = "A beginner-friendly introduction to music composition"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20.0, weight: UIFont.Weight.bold)
        label.textAlignment = .center
        return label
    }()
    
    var playbackButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Play back! 🎶", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 32.0, weight: UIFont.Weight.bold)
        button.layer.cornerRadius = 15
        button.backgroundColor = UIColor(red: 0.95, green: 0.71, blue: 0.83, alpha: 1.00)
        return button
    }()
    
    var chordOptionView: ComposerMenuOptionView = {
        let view = ComposerMenuOptionView()
        view.titleLabel.text = "Choose chords!"
        view.backgroundView.backgroundColor = UIColor(red: 0.26, green: 0.48, blue: 0.63, alpha: 1.00)
        return view
    }()
    
    var melodyOptionView: ComposerMenuOptionView = {
        let view = ComposerMenuOptionView()
        view.titleLabel.text = "Write your melody!"
        view.backgroundView.backgroundColor = UIColor(red: 0.11, green: 0.25, blue: 0.37, alpha: 1.00)
        return view
    }()
    
    lazy var composeOptionsStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        
        stack.addArrangedSubview(self.chordOptionView)
        stack.addArrangedSubview(self.melodyOptionView)
        
        return stack
    }()
    
    var playbackDisplay: ComposerMenuPlaybackView = {
        let view = ComposerMenuPlaybackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.backgroundColor = UIColor(red: 0.21, green: 0.22, blue: 0.22, alpha: 1.00)
        
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(playbackButton)
        addSubview(composeOptionsStack)
        addSubview(playbackDisplay)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        // MARK: titleLabel Constraints
        titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0.0).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.10).isActive = true
        
        // MARK: subtitleLabel Constraints
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0.0).isActive = true
        subtitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        subtitleLabel.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        subtitleLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15).isActive = true
        
        // MARK: playbackButton Constraints
        playbackButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0.0).isActive = true
        playbackButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        playbackButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.75).isActive = true
        playbackButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15).isActive = true
        playbackButton.isHidden = true
        
        // MARK: composeOptionsStack Constraints
        composeOptionsStack.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 20.0).isActive = true
        composeOptionsStack.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        composeOptionsStack.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        composeOptionsStack.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.65).isActive = true
        
        // MARK: playbackDisplay Constraints
        playbackDisplay.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 20.0).isActive = true
        playbackDisplay.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        playbackDisplay.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        playbackDisplay.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        playbackDisplay.layer.zPosition = 1
        playbackDisplay.isHidden = true
    }
    
    public func enablePlayback() {
        subtitleLabel.isHidden = true
        playbackButton.isHidden = false
    }
}


public class ComposerMenuOptionView: UIView {
    var backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 15
        view.backgroundColor = .black
        return view
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 28.0, weight: UIFont.Weight.heavy)
        label.textAlignment = .center
        return label
    }()
    
    
    public override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
    }
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        addSubview(backgroundView)
        addSubview(titleLabel)
        setupConstraints()
    }

    private func setupConstraints() {
        // MARK: backgroundView Constraints
        backgroundView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        backgroundView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        backgroundView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.85).isActive = true
        backgroundView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.85).isActive = true
        
        // MARK: titleLabel Constraints
        titleLabel.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: backgroundView.widthAnchor, multiplier: 1.0).isActive = true
        titleLabel.heightAnchor.constraint(equalTo: backgroundView.heightAnchor, multiplier: 1.0).isActive = true
    }
}


public class ComposerMenuPlaybackView: UIView {
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "makingMusic")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    var thankyouLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Thank you for spending the time to create music with me! \n\n I hope you had fun, and possibly learned something as well 😊"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 28.0, weight: UIFont.Weight.heavy)
        label.textAlignment = .center
        
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.backgroundColor = UIColor(red: 0.16, green: 0.18, blue: 0.18, alpha: 0.75)
        
        addSubview(imageView)
        addSubview(thankyouLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        // MARK: imageView Constraints
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 25).isActive = true
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
        imageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3).isActive = true
        
        // MARK: thankyouLabel Constraints
        thankyouLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 25).isActive = true
        thankyouLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        thankyouLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.85).isActive = true
    }
}
