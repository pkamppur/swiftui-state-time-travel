//
//  HistoryContainerView.swift
//  SwiftUIStateTimeTravel
//
//  Created by Petteri Kamppuri on 10.11.2020.
//

import SwiftUI

struct HistoryContainerView: View {
    @State private var state = sampleAppState()

    var body: some View {
        VStack(alignment: .leading) {
            BoxList(boxes: $state.boxes) // pass in only subset of global app data to minimize updates (I hope)
            BoxFooter(boxes: $state.boxes)
        }
    }
}

struct HistoryContainerView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryContainerView()
    }
}
