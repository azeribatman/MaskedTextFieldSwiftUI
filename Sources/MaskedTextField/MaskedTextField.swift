//
//  MaskedTextField.swift
//
//
//  Created by Ayxan Səfərli on 28.02.24.
//

import Foundation
import SwiftUI
import UIKit

public struct MaskedTextField: UIViewRepresentable {
    public typealias UIViewType = UITextField
    
    @Binding private var rawText: String
    @Binding private var maskedText: String
    private var maskType: MaskType
    private var config: MaskedTextFieldConfig?
    
    private var textField = UITextField()
    
    public init(
        rawText: Binding<String>,
        maskedText: Binding<String> = .constant(""),
        maskType: MaskType,
        config: MaskedTextFieldConfig? = nil
    ) {
        self._rawText = rawText
        self._maskedText = maskedText
        self.maskType = maskType
        self.config = config
    }
    
    public func makeUIView(context: Context) -> UITextField {
        textField.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        textField.delegate = context.coordinator
        textField.text = rawText
        setupConfig(of: textField)
        return textField
    }
    
    private func setupConfig(of textField: UITextField) {
        textField.placeholder = config?.placeHolder
        textField.attributedPlaceholder = config?.attributedPlaceholder
        textField.font = config?.font
        textField.textColor = config?.textColor
        textField.keyboardType = config?.keyboardType ?? .default
        textField.autocorrectionType = config?.autocorrectionType ?? .no
        textField.autocapitalizationType = config?.autocapitalizationType ?? .sentences
    }
    
    public func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = maskedText
        uiView.placeholder = config?.placeHolder
    }
    
    public func makeCoordinator() -> MaskedTextFieldCoordinator {
        let coordinator = MaskedTextFieldCoordinator(
            maskType: maskType,
            returnValues: handleMaskService
        )
        return coordinator
    }
    
    private func handleMaskService(with returnValues: MaskService.ReturnValues) {
        rawText = returnValues.rawValue
        maskedText = returnValues.maskedText
    }
}
