//
//  Join.swift
//  App203
//
//  Created by IGOR on 30/09/2023.
//

import SwiftUI

struct Join: View {
    
    let telegram: URL
    let isContacts: Bool
    
    var body: some View {
        
        ZStack {
            
            Color("blue2")
                .ignoresSafeArea()
                            
                VStack {
                    
                    Image("tg2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .ignoresSafeArea()
                    
                    Spacer()
                    
                }
            
            VStack {
                
                Spacer()
                
                VStack {
                    
                    Text("Join and earn")
                        .foregroundColor(.black)
                        .font(.system(size: 28, weight: .semibold))
                        .padding(.horizontal)
                        .padding(.bottom, 3)
                        .padding(.top)
                    
                    Text("Join our Telegram group trade with our team")
                        .foregroundColor(.black)
                        .font(.system(size: 17, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    Button(action: {
                        
                        UIApplication.shared.open(telegram)
                        
                    }, label: {
                        
                        Text("Join")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("blue2")))
                            .padding(.horizontal)
                    })
                    .padding(.bottom)
                    
                    NavigationLink(destination: {
                        
                        if isContacts == true {
                            
                            Manager()
                                .navigationBarBackButtonHidden()
                            
                        } else if isContacts == false {
                            
                            Notifications()
                                .navigationBarBackButtonHidden()
                        }
                        
                    }, label:  {
                        
                        Text("Skip")
                            .foregroundColor(Color("blue"))
                            .font(.system(size: 14, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 30)
                            .padding(.horizontal)
                    })
                }
                .frame(maxWidth: .infinity)
                .frame(height: 300)
                .background(Color.white.ignoresSafeArea())
                
            }
        }
    }
}

struct Join_Previews: PreviewProvider {
    static var previews: some View {
        Join(telegram: URL(string: "h")!, isContacts: false)
    }
}
