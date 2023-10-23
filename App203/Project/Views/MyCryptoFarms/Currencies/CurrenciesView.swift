//
//  CurrenciesView.swift
//  App203
//
//  Created by Вячеслав on 10/4/23.
//

import SwiftUI

struct CurrenciesView: View {
    
    @Environment(\.presentationMode) var router
    
    @State var selectedPair: String = ""
    @State var isPair: Bool = false
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("My Currencies")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .medium))
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "chevron.left")
                                    .foregroundColor(Color("blue"))
                                    .font(.system(size: 15, weight: .regular))
                                
                                Text("Back")
                                    .foregroundColor(Color("blue"))
                                    .font(.system(size: 15, weight: .regular))
                            }
                        })
                        
                        Spacer()
                    }
                }
                .padding()
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack {
                        
                        ForEach(["EURUSD", "EURTRY", "EURKZT", "EURJPY", "EURCAD", "USDTRY", "USDKZT", "USDJPY", "USDCAD", "USDUAH"], id: \.self) { index in
                            
                            Button(action: {
                                
                                selectedPair = index
                                isPair = true
                                
                            }, label: {
                                
                                HStack {
                                    
                                    VStack(alignment: .leading, spacing: 5, content: {
                                        
                                        Text(index)
                                            .foregroundColor(.black)
                                            .font(.system(size: 16, weight: .regular))
                                        
                                        Text("Crypto")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 13, weight: .regular))
                                    })
                                    
                                    Spacer()
                                    
                                    VStack(alignment: .trailing, spacing: 5, content: {
                                        
                                        Text("$\(Int.random(in: 1...2555))")
                                            .foregroundColor(.black)
                                            .font(.system(size: 16, weight: .regular))
                                        
                                        Text("+\(Int.random(in: 1...25))%")
                                            .foregroundColor(.green)
                                            .font(.system(size: 13, weight: .regular))
                                    })
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                            })
                        }
                    }
                    .padding([.horizontal, .bottom])
                }
            }
        }
        .sheet(isPresented: $isPair, content: {
            
            ChartViewer(pair: selectedPair)
        })
    }
}

#Preview {
    CurrenciesView()
}
