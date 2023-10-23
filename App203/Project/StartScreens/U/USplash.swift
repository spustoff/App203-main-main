//
//  USplash.swift
//  App203
//
//  Created by IGOR on 30/09/2023.
//

import SwiftUI

struct USplash: View {
    
    let telegram: URL
    let isTelegram: Bool
    let isContacts: Bool
    
    var body: some View {
        
        ZStack {
            
            Color("blue")
                .ignoresSafeArea()
                            
                VStack {
                    
                    Image("USplash")
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
                            .frame(width: 100, height: 7)
                        
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 100, height: 7)
                    }
                    .padding()
                    
                    Text("Your steps to success")
                        .foregroundColor(.black)
                        .font(.system(size: 28, weight: .semibold))
                        .padding(.horizontal)
                        .padding(.bottom, 3)
                    
                    Text("Improve your skills in practice")
                        .foregroundColor(.black)
                        .font(.system(size: 17, weight: .regular))
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        Reviews(telegram: telegram, isTelegram: isTelegram, isContacts: isContacts)
                            .navigationBarBackButtonHidden()
                        
                    }, label:  {
                        
                        Text("Continue")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
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

struct USplash_Previews: PreviewProvider {
    static var previews: some View {
        USplash(telegram: URL(string: "h")!, isTelegram: false, isContacts: false)
    }
}
