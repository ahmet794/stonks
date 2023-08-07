//
//  StockRowView.swift
//  Stonker
//
//  Created by Ahmet Cihan on 07/08/2023.
//

import SwiftUI

struct StockRowView: View {
    let symbol: String
    let price: String
    
    var body: some View {
        HStack {
            Text(symbol)
            Spacer()
            Text(price)
        }
    }
}

