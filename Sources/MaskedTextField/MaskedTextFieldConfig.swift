//
//  MaskedTextFieldConfig.swift
//  
//
//  Created by Ayxan Səfərli on 28.02.24.
//

import Foundation
import UIKit

public struct MaskedTextFieldConfig {
    public let placeHolder: String?
    public let attributedPlaceholder: NSAttributedString?
    public let font: UIFont?
    public let textColor: UIColor?
    public let keyboardType: UIKeyboardType?
    public let autocorrectionType: UITextAutocorrectionType?
    public let autocapitalizationType: UITextAutocapitalizationType?
    
    public init(
        placeHolder: String? = nil,
        attributedPlaceholder: NSAttributedString? = nil,
        font: UIFont? = nil,
        textColor: UIColor? = nil,
        keyboardType: UIKeyboardType? = nil,
        autocorrectionType: UITextAutocorrectionType? = nil,
        autocapitalizationType: UITextAutocapitalizationType? = nil
    ) {
        self.placeHolder = placeHolder
        self.attributedPlaceholder = attributedPlaceholder
        self.font = font
        self.textColor = textColor
        self.keyboardType = keyboardType
        self.autocorrectionType = autocorrectionType
        self.autocapitalizationType = autocapitalizationType
    }
}
