//
//  MenuView.swift
//  Stonker
//
//  Created by Ahmet Cihan on 07/08/2023.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationView {
            HStack(spacing: 0) {
                // Left Side
                NavigationLink("Stock Markets", destination: StockMarketView())
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.gray)
                
                // Right Side
                NavigationLink("Portfolio Management", destination: PortfolioManagementView())
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.blue)
            }
            .foregroundColor(.white)
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
