//
//  Extensions.swift
//  SelectionWheel
//
//  Created by Emre Tuğ on 19.01.2024.
//

import SwiftFortuneWheel
import UIKit
public extension TextPreferences {
    static var rotationExampleAmountTextPreferences: TextPreferences {
        let textColorType = SFWConfiguration.ColorType.customPatternColors(colors: nil, defaultColor: .white)
        let font = UIFont.systemFont(ofSize: 22, weight: .bold)
        let prefenreces = TextPreferences(textColorType: textColorType,
                                          font: font,
                                          verticalOffset: 10)
        return prefenreces
    }
    
    static var rotationExampleDescriptionTextPreferences: TextPreferences {
        let textColorType = SFWConfiguration.ColorType.customPatternColors(colors: nil, defaultColor: .white)
        let font = UIFont.systemFont(ofSize: 12, weight: .bold)
        let prefenreces = TextPreferences(textColorType: textColorType,
                                          font: font,
                                          verticalOffset: 10)
        return prefenreces
    }
}

public extension SFWConfiguration {
    static var variousWheelPodiumConfiguration: SFWConfiguration {
        
        let spin = SFWConfiguration.SpinButtonPreferences(size: CGSize(width: 64, height: 64))
        
        let sliceColorType = SFWConfiguration.ColorType.customPatternColors(colors: nil, defaultColor: .white)
        
        let slicePreferences = SFWConfiguration.SlicePreferences(backgroundColorType: sliceColorType, strokeWidth: 0, strokeColor: .white)
        
        let anchorImage = SFWConfiguration.AnchorImage(imageName: "anchorImage", size: CGSize(width: 8, height: 8), verticalOffset: -10)
        
        let circlePreferences = SFWConfiguration.CirclePreferences(strokeWidth: 1, strokeColor: UIColor.init(red: 32/255, green: 93/255, blue: 97/255, alpha: 1))
        
        var wheelPreferences = SFWConfiguration.WheelPreferences(circlePreferences: circlePreferences,
                                                                 slicePreferences: slicePreferences,
                                                                 startPosition: .right)
        
        wheelPreferences.imageAnchor = anchorImage
        
        let configuration = SFWConfiguration(wheelPreferences: wheelPreferences, spinButtonPreferences: spin)
        
        return configuration
    }
}

public extension TextPreferences {
    static func variousWheelPodiumText(textColor: UIColor) -> TextPreferences {
        
        let textColorType = SFWConfiguration.ColorType.customPatternColors(colors: nil, defaultColor: textColor)
        
        var font = UIFont.systemFont(ofSize: 9, weight: .semibold)
        var horizontalOffset: CGFloat = 0
        
        if let customFont = UIFont(name: "DINCondensed-Bold", size: 12) {
            font = customFont
            horizontalOffset = -2
        }
        
        var textPreferences = TextPreferences(textColorType: textColorType,
                                              font: font,
                                              verticalOffset: 5)
        
        textPreferences.horizontalOffset = horizontalOffset
        textPreferences.orientation = .vertical
        textPreferences.alignment = .right
        
        return textPreferences
    }
}

public extension ImagePreferences {
    static var variousWheelPodiumImage: ImagePreferences {
        let imagePreferences = ImagePreferences(preferredSize: CGSize(width: 25, height: 25), verticalOffset: 5)
        return imagePreferences
    }
}

private let circleStrokeWidth: CGFloat = 2
private let blackColor = UIColor(white: 51.0 / 255.0, alpha: 1.0)
private let redColor = UIColor.red

public extension SFWConfiguration {
    static var withoutStoryboardExampleConfiguration: SFWConfiguration {
        
        let _position: SFWConfiguration.Position = .top
        
        let circlePreferences = SFWConfiguration.CirclePreferences(strokeWidth: circleStrokeWidth,
                                                                           strokeColor: blackColor)
        
        let sliceBackgroundColorType = SFWConfiguration.ColorType.evenOddColors(evenColor: blackColor, oddColor: redColor)
        
        let slicePreferences = SFWConfiguration.SlicePreferences(backgroundColorType: sliceBackgroundColorType,
                                                                            strokeWidth: 1,
                                                                            strokeColor: blackColor)
        
        let wheeelPreferences = SFWConfiguration.WheelPreferences(circlePreferences: circlePreferences,
                                                                          slicePreferences: slicePreferences,
                                                                          startPosition: _position)
                
        let configuration = SFWConfiguration(wheelPreferences: wheeelPreferences)

        return configuration
    }
}

public extension TextPreferences {
    static var withoutStoryboardExampleAmountTextPreferences: TextPreferences {
        let textColorType = SFWConfiguration.ColorType.customPatternColors(colors: nil, defaultColor: .white)
        let font = UIFont.systemFont(ofSize: 22, weight: .bold)
        let prefenreces = TextPreferences(textColorType: textColorType,
                                          font: font,
                                          verticalOffset: 10)
        return prefenreces
    }

    static var withoutStoryboardExampleDescriptionTextPreferences: TextPreferences {
        let textColorType = SFWConfiguration.ColorType.customPatternColors(colors: nil, defaultColor: .white)
        let font = UIFont.systemFont(ofSize: 12, weight: .bold)
        var prefenreces = TextPreferences(textColorType: textColorType,
                                          font: font,
                                          verticalOffset: 10)
        
        prefenreces.orientation = .vertical
        prefenreces.flipUpsideDown = false
        prefenreces.isCurved = false
        
        return prefenreces
    }
}
extension UIView {
    
    func applyGradient(colours: [UIColor]) -> CAGradientLayer {
        return self.applyGradient(colours: colours, locations: nil)
    }
    
    
    func applyGradient(colours: [UIColor], locations: [NSNumber]?) -> CAGradientLayer {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 0)
        return gradient
    }
}
