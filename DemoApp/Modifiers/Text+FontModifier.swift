//
//  Text+FontModifier.swift
//  DemoApp
//
//  Created by Azruddin Shaikh on 03/12/24.
//

import SwiftUI

enum FontStyle: String {
    case InterBlack = "Inter-Black"
    case InterBlackItalic = "Inter-BlackItalic"
    case InterBold = "Inter-Bold"
    case InterBoldItalic = "Inter-BoldItalic"
    case InterExtraBold = "Inter-ExtraBold"
    case InterExtraBoldItalic = "Inter-ExtraBoldItalic"
    case InterExtraLight = "Inter-ExtraLight"
    case InterExtraLightItalic = "Inter-ExtraLightItalic"
    case InterItalic = "Inter-Italic"
    case InterLight = "Inter-Light"
    case InterLightItalic = "Inter-LightItalic"
    case InterMedium = "Inter-Medium"
    case InterMediumItalic = "Inter-MediumItalic"
    case InterRegular = "Inter-Regular"
    case InterSemiBold = "Inter-SemiBold"
    case InterSemiBoldItalic = "Inter-SemiBoldItalic"
    case InterThin = "Inter-Thin"
    case InterThinItalic = "Inter-ThinItalic"
}

extension Text {
    
    func fontModifier(
        font: FontStyle,
        size: CGFloat,
        color: ColorResource
    ) -> Text {
        let text = self
            .foregroundColor(Color(color))
            .font(.custom(font.rawValue, fixedSize: size))
        
        return text
    }
}
