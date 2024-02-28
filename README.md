# MaskedTextField-SwiftUI 🎭

The MaskedTextField-SwiftUI package empowers developers to easily integrate customizable masked text input fields into their SwiftUI applications. Masked text fields provide a structured way for users to input data by enforcing a specific format, such as phone numbers, dates, or credit card numbers, while maintaining a clean and intuitive user experience.

![ScreenRecording2024-02-28at12 43 44-ezgif com-video-to-gif-converter (1)](https://github.com/darealkhan/MaskedTextField-SwiftUI/assets/96260055/6449d31f-d4f6-45bf-88d6-febd0c9e121f)

## Key Features

- Flexible Masking: Define custom masks to specify the format in which user input should be entered, allowing for precise control over the data format.

- Input Validation: Automatically validate user input against the specified mask, ensuring that only valid data is accepted and processed.

- Placeholder Support: Provide placeholders that guide users on the expected format for input, improving usability and reducing errors.

- Dynamic Formatting: Enable dynamic updates to the mask based on user input or application requirements, adapting to various scenarios seamlessly.

- Customization Options: Customize the appearance and behavior of the masked text field to align with the application's design language and user preferences.

- Integration with SwiftUI: Seamlessly integrate the masked text field component into SwiftUI views, leveraging SwiftUI's declarative syntax for building user interfaces.

Whether you're building a form for collecting user information, implementing a payment processing system, or creating any other data entry interface, the SwiftUI Masked Text Field package provides a reliable solution for enforcing data format consistency and enhancing user input experiences in SwiftUI applications.

## Installation

#### Requirements

- iOS 15.0+

#### Via Swift Package Manager

In Xcode, within your project, select: `File > Swift Packages > Add Package Dependency`, then paste the URL https://github.com/darealkhan/MaskedTextField-SwiftUI.git and proceed to download it.

## How to Use

To use `MaskedTextField-SwiftUI`, you need to follow the simple steps below.

1. Import the package into your project.

```Swift
import MaskedTextField-SwiftUI
```

2. Create two state variables to receive changes in the text field. `rawText` will contain the cleared text from masked text. You can also use `maskedText` if needed.

```Swift
@State var rawText = ""
@State var maskedText = ""
```

3. Create a `MaskType` to specify the type of mask. The `maskString` parameter is a string that replaces mask characters with your typed characters. Separators are used to retrieve raw text from masked text, so each character in separators will be deleted in raw text. Finally, the `maskChar` parameter specifies which character will be used for masking.

```Swift
let mastType = MaskType(
    maskString: "####-####-####-####",
    seperators: [
        .emptySpace,
        .customSeperator("-")
    ],
    maskChar: "#"
)
```

4. Create a `MaskedTextFieldConfig` for customizing textField related settings. There are numerous options you can customize; below, I'll list them all, and you can select which ones you want to customize.

| Setting                | Type                         |
| ---------------------- | ---------------------------- |
| placeHolder            | String                       |
| attributedPlaceholder  | NSAttributedString           |
| font                   | UIFont                       |
| textColor              | UIColor                      |
| keyboardType           | UIKeyboardType               |
| autocorrectionType     | UITextAutocorrectionType     |
| autocapitalizationType | UITextAutocapitalizationType |

#### For example, let's create a simple configuration with a placeholder.

```Swift
let config = MaskedTextFieldConfig(
    placeHolder: "Card Number"
)
```

5. Lastly, create a text field with masked text and raw text as binding variables, along with configuration and mask type settings.

```Swift
 MaskedTextFieldSwiftUI(
    rawText: $rawTest,
    maskedText: $maskedTest,
    maskType: maskType,
    config: config
)
```
