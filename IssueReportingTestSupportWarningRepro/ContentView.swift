//
//  ContentView.swift
//  IssueReportingTestSupportWarningRepro
//
//  Created by George Scott on 11/5/26.
//

import AppFeature
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(AppFeature.makeID().uuidString)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
