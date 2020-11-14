//
//  AppState.swift
//  SwiftUIStateTimeTravel
//
//  Created by Petteri Kamppuri on 10.11.2020.
//

import UIKit
import SwiftUI

struct AppState: Equatable {
    var boxes: [Box]
}

struct Box: Equatable {
    let name: String
    let color: UIColor
}





extension Box {
    var backgroundColor: Color {
        Color(color)
    }
    
    static func random(i: Int) -> Box {
        Box(
            name: "untitled \(i)",
            color: UIColor.random
        )
    }
}

func sampleAppState() -> AppState {
    let boxes = [
        Box(name: "Red", color: UIColor.red),
        Box(name: "Orange", color: UIColor.orange),
        Box(name: "Purple", color: UIColor.purple),
        Box(name: "Blue", color: UIColor.blue),
    ]
    return AppState(boxes: boxes)
}
