//
//  Notifications.swift
//  App203
//
//  Created by IGOR on 30/09/2023.
//

import SwiftUI

struct Notifications: View {
    
    @AppStorage("status") var status: Bool = false
    
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
                                        
                    Text("Don’t miss anything")
                        .foregroundColor(.black)
                        .font(.system(size: 28, weight: .semibold))
                        .padding(.horizontal)
                        .padding(.bottom, 3)
                        .padding(.top)
                    
                    Text("Don’t miss the most userful information")
                        .foregroundColor(.black)
                        .font(.system(size: 17, weight: .regular))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        status = true
                        
                    }, label: {
                        
                        Text("Enable notifications")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("blue")))
                            .padding(.horizontal)
                    })
                    
                    Button(action: {
                        
                        status = true
                        
                    }, label: {
                        
                        Text("Skip")
                            .foregroundColor(Color("blue"))
                            .font(.system(size: 14, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 30)
                            .padding(.horizontal)
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

struct Notifications_Previews: PreviewProvider {
    static var previews: some View {
        Notifications()
    }
}
