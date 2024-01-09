//
//  DetailsView.swift
//  iOS_Project_3
//
//  Created by Daniel Latos on 09/01/2024.
//

import SwiftUI

struct DetailsView: View {
    
    @ObservedObject var item: Item
    
    var body: some View {
        VStack {
            Text(item.name!)
            Spacer()
            Text(item.desc!)
            Spacer()
            if item.inCart > 0 {
                Text("In order: \(item.inCart)")
                    .foregroundStyle(.teal)
            }
            Button {
                PersistenceController.shared.addItemToCart(item: item)
            } label: {
                Text("Add to your order \(item.price.roundDecimal(places: 2))$")
                    .foregroundStyle(.green)
            }
            .padding()
        }
    }
}
