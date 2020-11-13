//
//  HistoryContainerView.swift
//  SwiftUIStateTimeTravel
//
//  Created by Petteri Kamppuri on 10.11.2020.
//

import SwiftUI

struct HistoryContainerView: View {
    @State private var stateHistory = [AppState]()
    @State private var stateIndex = -1
    @State private var state = sampleAppState()

    var body: some View {
        VStack(alignment: .leading) {
            BoxList(boxes: $state.boxes) // pass in only subset of global app data to minimize updates (I hope)
            BoxFooter(boxes: $state.boxes)
        }
        .onChange(of: state) { newState in
            let isChange = stateHistory[stateIndex] != newState
            if !isChange {
                return
            }

            stateHistory.removeSubrange((stateIndex + 1)..<stateHistory.count)
            stateHistory += [newState]
            stateIndex += 1
        }
        .onAppear() {
            if stateIndex == -1 {
                stateIndex = 0
                stateHistory = [state]
            }
        }
    }
}

struct HistoryContainerView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryContainerView()
    }
}
