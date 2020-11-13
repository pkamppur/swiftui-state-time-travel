//
//  HistoryContainerView.swift
//  SwiftUIStateTimeTravel
//
//  Created by Petteri Kamppuri on 10.11.2020.
//

import SwiftUI

struct HistoryContainerView: View {
    @State private var state: AppState
    @State private var stateHistory: [AppState]
    @State private var stateIndex = 0
    @State private var showHistoryBar = false

    init() {
        let initialState = sampleAppState()
        _state = .init(initialValue: initialState)
        _stateHistory = .init(initialValue: [initialState])
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            if showHistoryBar {
                historyBar()
            }
            
            BoxList(boxes: $state.boxes) // pass in only subset of global app data to minimize updates (I hope)
            BoxFooter(boxes: $state.boxes)
        }
        .onChange(of: state) { newState in
            let isChange = stateHistory[stateIndex] != newState
            if !isChange {
                return
            }

            recordState(newState)
        }
        .onTapGesture(count: 2) {
            withAnimation() {
                showHistoryBar = !showHistoryBar
            }
        }
    }
    
    private func historyBar() -> some View {
        VStack {
            HStack {
                Button("< Prev") {
                    stateIndex -= 1
                    state = stateHistory[stateIndex]
                }
                .disabled(stateIndex <= 0)
                
                Text(" -- \(stateIndex) -- ")
                
                Button("Next >") {
                    stateIndex += 1
                    state = stateHistory[stateIndex]
                }
                .disabled(stateIndex >= stateHistory.count - 1)
            }
            
            Divider()
        }
    }
    
    private func recordState(_ newState: AppState) {
        stateHistory.removeSubrange((stateIndex + 1)..<stateHistory.count)
        stateHistory += [newState]
        stateIndex += 1
    }
}

struct HistoryContainerView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryContainerView()
    }
}
