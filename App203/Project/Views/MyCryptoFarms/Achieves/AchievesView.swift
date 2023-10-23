//
//  AchievesView.swift
//  App203
//
//  Created by Вячеслав on 10/4/23.
//

import SwiftUI

struct AchievesView: View {
    
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Achievements")
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
                    
                    Circle()
                        .stroke(.gray.opacity(0.1), lineWidth: 15)
                        .frame(width: 200, height: 200)
                        .overlay (
                        
                            VStack(alignment: .center, spacing: 6, content: {
                                
                                Text("Completed tasks")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                                
                                Text("0%")
                                    .foregroundColor(.black)
                                    .font(.system(size: 26, weight: .bold))
                            })
                        )
                        .padding(.vertical)
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                        
                        ForEach([5000, 10000, 15000, 20000, 25000, 30000], id: \.self) { index in
                        
                            VStack(alignment: .leading, spacing: 20, content: {
                                
                                Text("Have an income of $\(index)")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .semibold))
                                    .multilineTextAlignment(.leading)
                                
                                VStack(alignment: .leading, spacing: 5, content: {
                                    
                                    Text("Progress: \(0)%")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 12, weight: .regular))
                                    
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(.gray.opacity(0.1))
                                        .frame(height: 5)
                                })
                            })
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).stroke(Color("blue")))
                        }
                    })
                    .padding()
                }
            }
        }
    }
}
