//
//  FarmDetail.swift
//  App203
//
//  Created by IGOR on 12/10/2023.
//

import SwiftUI

struct FarmDetail: View {
    
    let index: HistoryModel
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack(alignment: .leading, content: {
                        
                        Image("mf")
                            .resizable()
                            .frame(height: 250)
                        
                        VStack(alignment: .leading, content: {
                            
                            Text(index.name ?? "")
                                .foregroundColor(.black)
                                .font(.system(size: 19, weight: .semibold))
                                .multilineTextAlignment(.leading)
                            
                            Text("+$\(index.income)")
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .regular))
                                .padding(6)
                                .background(RoundedRectangle(cornerRadius: 10).fill(.green))
                            
                            VStack(alignment: .leading, spacing: 5, content: {
                                
                                Text("\(index.cryptocurrency ?? "")")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .medium))
                                
                                Text("BTC")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13, weight: .regular))
                            })
                            .padding(7)
                            .background(RoundedRectangle(cornerRadius: 10).stroke(.gray.opacity(0.2)))
                            
                            Text(index.text ?? "")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                                .multilineTextAlignment(.leading)
                        })
                        .padding()
                    })
                    .ignoresSafeArea(.all, edges: .top)
                }
            }
        }
    }
}
