//
//  BoxFooter.swift
//  SwiftUIStateTimeTravel
//
//  Created by Petteri Kamppuri on 10.11.2020.
//

import SwiftUI

struct BoxFooter: View {
    @Binding var boxes: [Box]
    
    var body: some View {
        VStack {
            AddButton(boxes: $boxes)
        }
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
        .background(
            Text("Box count: \(boxes.count)")
                .padding()
        )
        .background(Color.white) // Fixes gesture handling for toggling history bar
    }
}
