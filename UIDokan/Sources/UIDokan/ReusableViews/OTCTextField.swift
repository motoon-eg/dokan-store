//
//  OTCTextField.swift
//  
//
//  Created by Ahmed Nagy on 08/07/2022.
//

import UIKit

class OTCTextField: UITextField {
    
    var didEnterLastDigit: ((String) -> Void)?
    var defaultCharacter = "-"
    private var isConfigured = false
    private var digitsLabels = [UILabel]()
    private lazy var tapRecognizer: UITapGestureRecognizer = {
        let recognizer = UITapGestureRecognizer()
        recognizer.addTarget(self, action: #selector(becomeFirstResponder))
        return recognizer
    }()
    
    func configure(with slotCount: Int = 4) {
        guard isConfigured == false else { return }
        isConfigured.toggle()
        configureTextField()
        let labelsStackView = createLabelStackView(with: slotCount)
        addSubview(labelsStackView)
        addGestureRecognizer(tapRecognizer)
        NSLayoutConstraint.activate([
            labelsStackView.topAnchor.constraint(equalTo: topAnchor),
            labelsStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            labelsStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            labelsStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    private func configureTextField() {
        tintColor = .clear
        textColor = .clear
        keyboardType = .numberPad
        textContentType = .oneTimeCode
        addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        delegate = self
    }
    private func createLabelStackView(with count: Int) -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        (1...count).forEach { _ in
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 40)
            label.isUserInteractionEnabled = true
            label.text = defaultCharacter
            stackView.addArrangedSubview(label)
            
            digitsLabels.append(label)
        }
        
        return stackView
    }
    
    @objc private func textDidChange() {
        guard let text = self.text, text.count <= digitsLabels.count else { return }
        for i in 0..<digitsLabels.count {
            let currentLabel = digitsLabels[i]
            
            if i < text.count {
                let index = text.index(text.startIndex, offsetBy: i)
                currentLabel.text = String(text[index])
            } else {
                currentLabel.text = defaultCharacter
            }
        }
        
        if text.count == digitsLabels.count {
            didEnterLastDigit?(text)
        }
    }
    
}

extension OTCTextField: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let charachterCount = textField.text?.count else { return false }
        return charachterCount < digitsLabels.count || string == ""
    }
}




