//
//  ContentView.swift
//  MaskedTextFieldSwiftUI-Example
//
//  Created by Ayxan Səfərli on 28.02.24.
//

import Foundation
import MaskedTextFieldSwiftUI
import SwiftUI

struct ExampleView: View {
    @State private var testFields = TestField.getFields()
    
    var body: some View {
        NavigationView {
            List($testFields) { field in
                Section(field.maskType.wrappedValue.maskString) {
                    textFieldTestView(with: field)
                }
            }
            .navigationTitle("Masked TextField 🎭")
        }
    }
    
    private func textFieldTestView(
        with field: Binding<TestField>
    ) -> some View {
        VStack {
            MaskedTextField(
                rawText: field.rawText,
                maskedText: field.maskedText,
                maskType: field.maskType.wrappedValue,
                config: field.config.wrappedValue
            )
            
            Divider()
            
            Text("Raw text is: \(field.rawText.wrappedValue)")
                .font(.caption)
                .foregroundStyle(.secondary)
                .frame(
                    maxWidth: .infinity,
                    alignment: .leading
                )
            
            Text("Masked text is: \(field.maskedText.wrappedValue)")
                .font(.caption)
                .foregroundStyle(.secondary)
                .frame(
                    maxWidth: .infinity,
                    alignment: .leading
                )
        }
    }
}

struct TestField: Identifiable {
    let id = UUID()
    var rawText = ""
    var maskedText = ""
    var config: MaskedTextFieldConfig
    var maskType: MaskType
    
    static func getFields() -> [TestField] {
        return [
            .init(
                config: MaskedTextFieldConfig(
                    placeHolder: "Credit Card Number"
                ),
                maskType: .init(
                    maskString: "####-####-####-####",
                    seperators: [
                        .emptySpace,
                        .customSeperator("-"),
                    ]
                )
            ),
            .init(
                config: MaskedTextFieldConfig(
                    placeHolder: "Number"
                ),
                maskType: .init(
                    maskString: "(###)-###-##-##",
                    seperators: [
                        .emptySpace,
                        .customSeperator("("),
                        .customSeperator(")"),
                        .customSeperator("-")
                    ]
                )
            ),
            .init(
                config: MaskedTextFieldConfig(
                    placeHolder: "Zip adress",
                    autocapitalizationType: .allCharacters
                ),
                maskType: .init(
                    maskString: "## ####",
                    seperators: [
                        .emptySpace
                    ]
                )
            ),
            .init(
                config: MaskedTextFieldConfig(
                    placeHolder: "Ip address"
                ),
                maskType: .init(
                    maskString: "###.###.#.#",
                    seperators: [
                        .customSeperator(".")
                    ]
                )
            )
        ]
    }
}

#Preview {
    ExampleView()
        .preferredColorScheme(.dark)
}
