//
//  BoxList.swift
//  SwiftUIStateTimeTravel
//
//  Created by Petteri Kamppuri on 10.11.2020.
//

import SwiftUI

struct BoxList: View {
    @Binding var boxes: [Box]
    
    var body: some View {
        VStack {
            AddButton(boxes: $boxes)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                .background(Color.white) // Fixes gesture handling for toggling history bar

            List(boxes, id: \.name) {
                BoxView(box: $0)
            }
        }
    }
}

struct BoxView: View {
    let box: Box
    
    var body: some View {
        Text(box.name)
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [
                        box.backgroundColor,
                        box.backgroundColor.opacity(0.25)
                    ]),
                    startPoint: .top, endPoint: .bottom)
            )
            .cornerRadius(5)
    }
}
