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
            VStack {
                HStack{
                    Button("Stock Markets") {
                        showStockMarketView = true
                    }
                    .sheet(isPresented: $showStockMarketView, content: {StockMarketView()
                    })
                    Button("Portfolio Management") {
                        showPortfolioManagementView = true
                    }
                    .sheet(isPresented: $showPortfolioManagementView, content: {PortfolioManagementView()
                    })
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(10)
                Spacer()
            }
            .navigationBarTitle("Menu")
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
