//
//  RSplash.swift
//  App203
//
//  Created by IGOR on 30/09/2023.
//

import SwiftUI

struct RSplash: View {
    var body: some View {
        
        ZStack {
            
            Color("blue")
                .ignoresSafeArea()
                            
                VStack {
                    
                    Image("RSplash")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .ignoresSafeArea()
                    
                    Spacer()
                    
                }
            
            VStack {
                
                Spacer()
                
                VStack {
                    
                    HStack {
                        
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color("blue"))
                            .frame(width: 70, height: 7)
                        
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 70, height: 7)
                        
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 70, height: 7)
                    }
                    .padding()
                    
                    Text("Control Crypto")
                        .foregroundColor(.black)
                        .font(.system(size: 28, weight: .semibold))
                        .padding(.horizontal)
                        .padding(.bottom, 3)
                    
                    Text("Control your income from all farms")
                        .foregroundColor(.black)
                        .font(.system(size: 17, weight: .regular))
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        RSplash2()
                            .navigationBarBackButtonHidden()
                        
                    }, label:  {
                        
                        Text("Continue")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("blue")))
                            .padding()
                    })
                    .padding(.bottom)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 300)
                .background(Color.white.ignoresSafeArea())
                
            }
        }
    }
}

struct RSplash_Previews: PreviewProvider {
    static var previews: some View {
        RSplash()
    }
}
