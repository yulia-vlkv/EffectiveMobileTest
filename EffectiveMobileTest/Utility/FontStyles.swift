//
//  FontStyles.swift
//  EffectiveMobileTest
//
//  Created by Iuliia Volkova on 30.05.2024.
//


import SwiftUI


struct FontStyles {
    struct SFProDisplay {
        static func semibold(size: CGFloat) -> Font {
            return Font.custom("SFProDisplay-Semibold", size: size)
        }

        static func medium(size: CGFloat) -> Font {
            return Font.custom("SFProDisplay-Medium", size: size)
        }

        static func regular(size: CGFloat) -> Font {
            return Font.custom("SFProDisplay-Regular", size: size)
        }
    }

    static let title1 = SFProDisplay.semibold(size: 22)
    static let title2 = SFProDisplay.semibold(size: 20)
    static let title3 = SFProDisplay.medium(size: 16)
    static let title4 = SFProDisplay.regular(size: 14)
    static let text1 = SFProDisplay.regular(size: 16)
    static let text2 = SFProDisplay.semibold(size: 14)
    static let buttonText1 = SFProDisplay.regular(size: 16)
    static let tabText = SFProDisplay.regular(size: 10)
}
