//
//  MaskedTextFieldCoordinator.swift
//
//
//  Created by Ayxan Səfərli on 27.02.24.
//

import Foundation
import UIKit

public final class MaskedTextFieldCoordinator: NSObject, UITextFieldDelegate {
    private var maskType: MaskType
    private let returnValues: (MaskService.ReturnValues) -> Void
    
    init(
        maskType: MaskType,
        returnValues: @escaping (MaskService.ReturnValues) -> Void
    ) {
        self.maskType = maskType
        self.returnValues = returnValues
    }
    
    public func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        let currentText = textField.text ?? ""
        
        guard let stringRange = Range(range, in: currentText) else { return false }
        
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        
        let maskedValues = MaskService.maskTextWith(maskType, typedText: updatedText)
        
        textField.text = maskedValues.maskedText
        returnValues(maskedValues)
        
        return false
    }
}
