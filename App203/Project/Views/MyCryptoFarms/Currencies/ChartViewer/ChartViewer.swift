//
//  ChartViewer.swift
//  App203
//
//  Created by Вячеслав on 10/4/23.
//

import SwiftUI

struct ChartViewer: View {
    
    let pair: String
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                VStack(alignment: .leading, spacing: 9, content: {
                    
                    Text(pair)
                        .foregroundColor(.black)
                        .font(.system(size: 17, weight: .regular))
                    
                    VStack(alignment: .leading, spacing: 6, content: {
                        
                        Text("$\(Int.random(in: 1...25000))")
                            .foregroundColor(.black)
                            .font(.system(size: 29, weight: .bold))
                        
                        Text("+\(Int.random(in: 1...25))%")
                            .foregroundColor(.green)
                            .font(.system(size: 13, weight: .regular))
                    })
                })
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.top)
                
                Chart(pair: pair)
                    .disabled(true)
            }
        }
    }
}

#Preview {
    ChartViewer(pair: "EURUSD")
}
