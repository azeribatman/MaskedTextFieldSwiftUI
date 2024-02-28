//
//  MaskedTextFieldConfig.swift
//  
//
//  Created by Ayxan Səfərli on 28.02.24.
//

import Foundation
import UIKit

public struct MaskedTextFieldConfig {
    let placeHolder: String?
    let attributedPlaceholder: NSAttributedString?
    let font: UIFont?
    let textColor: UIColor?
    let keyboardType: UIKeyboardType?
    let autocorrectionType: UITextAutocorrectionType?
    let autocapitalizationType: UITextAutocapitalizationType?
    
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
