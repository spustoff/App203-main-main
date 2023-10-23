//
//  Reviews.swift
//  App203
//
//  Created by IGOR on 30/09/2023.
//

import SwiftUI
import StoreKit

struct Reviews: View {
    
    let telegram: URL
    let isTelegram: Bool
    let isContacts: Bool
    
    var body: some View {
        
        ZStack {
            
            Color("blue")
                .ignoresSafeArea()
                            
                VStack {
                    
                    Image("Reviews")
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
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 100, height: 7)
                        
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color("blue"))
                            .frame(width: 100, height: 7)

                    }
                    .padding()
                    
                    Text("Rate our app in the AppStore")
                        .foregroundColor(.black)
                        .font(.system(size: 28, weight: .semibold))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .padding(.bottom, 3)
                    
                    Text("Help make the app even better")
                        .foregroundColor(.black)
                        .font(.system(size: 17, weight: .regular))
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        if isTelegram == true {
                            
                            Join(telegram: telegram, isContacts: isContacts)
                                .navigationBarBackButtonHidden()
                            
                        } else if isTelegram == false {
                            
                            if isContacts == true {
                                
                                Manager()
                                    .navigationBarBackButtonHidden()
                                
                            } else if isContacts == false {
                                
                                Notifications()
                                    .navigationBarBackButtonHidden()
                            }
                        }
                        
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
        .onAppear {
            
            SKStoreReviewController.requestReview()
        }
    }
}

struct Reviews_Previews: PreviewProvider {
    static var previews: some View {
        Reviews(telegram: URL(string: "h")!, isTelegram: false, isContacts: false)
    }
}
