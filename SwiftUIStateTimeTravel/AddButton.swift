//
//  AddButton.swift
//  SwiftUIStateTimeTravel
//
//  Created by Petteri Kamppuri on 10.11.2020.
//

import SwiftUI

struct AddButton: View {
    @Binding var boxes: [Box]
    
    var body: some View {
        Button("Add") {
            boxes += [
                Box(
                    name: "untitled \(boxes.count + 1)",
                    color: UIColor.random
                )
            ]
        }
        .padding()
    }
}
