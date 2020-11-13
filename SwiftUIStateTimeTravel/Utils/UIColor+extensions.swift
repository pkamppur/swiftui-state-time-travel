//
//  UIColor+extensions.swift
//  SwiftUIStateTimeTravel
//
//  Created by Petteri Kamppuri on 10.11.2020.
//

import UIKit

extension UIColor {
    static var random: UIColor {
        UIColor(
            red: CGFloat.random(in: 0..<1),
            green: CGFloat.random(in: 0..<1),
            blue: CGFloat.random(in: 0..<1),
            alpha: 1
        )
    }
}
