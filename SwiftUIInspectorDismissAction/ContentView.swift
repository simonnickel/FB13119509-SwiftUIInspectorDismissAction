//
//  ContentView.swift
//  SwiftUIInspectorDismissAction
//
//  Created by Simon Nickel on 05.09.23.
//

import SwiftUI

struct ContentView: View {
	
	@State private var showInspector: Bool = false
	@State private var showSheet: Bool = false
	
    var body: some View {
        VStack {
			Toggle(isOn: $showInspector, label: {
				Text("Show Inspector")
			})
			Toggle(isOn: $showSheet, label: {
				Text("Show Sheet")
			})
        }
		.scenePadding()
		.inspector(isPresented: $showInspector) {
			ModalView()
		}
		.sheet(isPresented: $showSheet) {
			ModalView()
		}
    }
}

struct ModalView: View {
	
	@Environment(\.dismiss) private var dismiss
	
	@State private var currentPresentationDetent: PresentationDetent = .medium
	
	var body: some View {
		VStack {
			Button(action: {
				dismiss()
			}, label: {
				Text("Dismiss")
			})
		}
		.padding()
		.presentationDetents([.medium, .fraction(0.3), .large], selection: $currentPresentationDetent)
		.presentationDragIndicator(.visible)
		.presentationContentInteraction(.automatic)
		.presentationBackgroundInteraction(.disabled)
		.presentationBackground(.ultraThinMaterial) // Does not work for .inspector
		.presentationCornerRadius(10)
	}
}

#Preview {
    ContentView()
}
