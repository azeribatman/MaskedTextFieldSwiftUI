//
//  MaskService.swift
//
//
//  Created by Ayxan Səfərli on 28.02.24.
//

import Foundation

struct MaskService {}

extension MaskService {
    static func maskTextWith(_ type: MaskType, typedText text: String) -> ReturnValues {
        var cleanText = text
        for seperator in type.seperators {
            cleanText = cleanText.replacingOccurrences(of: seperator.seperatorChar, with: "")
        }
        
        var maskedText = ""
        var index = cleanText.startIndex
        
        for char in type.maskString where index < cleanText.endIndex {
            if char == type.maskChar {
                maskedText.append(cleanText[index])
                index = cleanText.index(after: index)
            } else {
                maskedText.append(char)
            }
        }
        
        let values = ReturnValues(maskedText: maskedText, rawValue: String(cleanText.prefix(type.maxChar)))
        return values
    }
}

extension MaskService {
    struct ReturnValues {
        let maskedText: String
        let rawValue: String
    }
}

public struct MaskType {
    public let maskString: String
    public let seperators: [MaskSeperator]
    public let maskChar: Character
    
    var maxChar: Int {
        return maskString.filter({$0 == maskChar}).count
    }
    
    public init(
        maskString: String,
        seperators: [MaskSeperator],
        maskChar: Character = "#"
    ) {
        self.maskString = maskString
        self.seperators = seperators
        self.maskChar = maskChar
    }
    
    public enum MaskSeperator {
        case emptySpace
        case customSeperator(String)
        
        var seperatorChar: String {
            switch self {
            case .emptySpace:
                return " "
            case .customSeperator(let seperator):
                return seperator
            }
        }
    }
}
