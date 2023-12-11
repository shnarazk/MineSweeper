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
    let contents = [
        [" ", "1", "💣", "?", "?", "?", "?", "?", "?"],
        ["?", "?", "?", "?", "?", "?", "?", "?", "?"],
        ["?", "?", "?", "?", "?", "?", "?", "?", "?"],
        ["?", "?", "?", "?", "?", "?", "?", "?", "?"],
        ["?", "?", "?", "?", "?", "?", "?", "?", "?"],
        ["?", "?", "?", "?", "?", "?", "?", "?", "?"],
        ["?", "?", "?", "?", "?", "?", "?", "?", "?"],
        ["?", "?", "?", "?", "?", "?", "?", " ", "?"],
        ["?", "?", "?", "?", "?", "?", "?", "?", "?"],
    ]

    var body: some View {
        VStack {
            Spacer()
            ForEach(0...8, id: \.self) {y in
                HStack {
                    ForEach(0...8, id: \.self) {x in
                        ZStack {
                            Text(contents[y][x]).font(.title).padding(1)
                                .frame(width: 30, height: 30, alignment: .center)
                                .fixedSize(horizontal: true, vertical: true)
                                .border(.fill)
                                
                        }
                    }
                }
            }.padding(.horizontal)
            Spacer()
        }
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
