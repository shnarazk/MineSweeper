//
//  ContentView.swift
//  MineSweeper
//
//  Created by 楢崎修二 on 2023/12/10.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
        VStack {
            Spacer()
            ForEach(0...8, id: \.self) {y in
                HStack {
                    ForEach(0...8, id: \.self) {x in
                        // Rectangle()
                        ZStack {
                            RoundedRectangle(cornerRadius: 4).background(Color.blue)
                            Text("?").font(.title).padding(1).colorInvert()
                        }
                    }
                }
            }.padding(.horizontal)
            Spacer()
        }
        // Rectangle().padding(30)
        // NavigationSplitView {
//            List {
//                ForEach(items) { item in
//                    NavigationLink {
//                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
//                    } label: {
//                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
//                    }
//                }
//                .onDelete(perform: deleteItems)
//            }
           // .navigationSplitViewColumnWidth(min: 180, ideal: 200)
//            .toolbar {
//                ToolbarItem {
//                    Button(action: addItem) {
//                        Label("Add Item", systemImage: "plus")
//                    }
//                }
//            }
        // } detail: {
        //    Text("Select an item")
        //}
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
