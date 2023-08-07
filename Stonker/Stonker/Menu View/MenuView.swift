//
//  MenuView.swift
//  Stonker
//
//  Created by Ahmet Cihan on 07/08/2023.
//

import SwiftUI

struct MenuView: View {
    @State private var showStockMarketView = false
    @State private var showPortfolioManagementView = false
    
    var body: some View {
        NavigationView{
            HStack(spacing: 0){
                // Left Side
                Button("Stock Markets") {
                    showStockMarketView = true
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .sheet(isPresented: $showStockMarketView, content: {StockMarketView()
                    })
                .background(Color.gray)
                // Right Side
                Button("Portfolio Management") {
                    showPortfolioManagementView = true
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .sheet(isPresented: $showPortfolioManagementView, content: {PortfolioManagementView()
                    })
                .background(Color.blue)
            }
            .foregroundColor(.white)
        }
        .navigationBarTitle("Menu")
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
