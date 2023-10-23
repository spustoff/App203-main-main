//
//  MCFView.swift
//  App203
//
//  Created by IGOR on 30/09/2023.
//

import SwiftUI
import StoreKit

struct MCFView: View {
    
    @AppStorage("income") var income: Int = 0
    @AppStorage("nfarms") var nfarms: Int = 0
    @StateObject var viewModel = MCFViewModel()
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("My Crypto farms")
                        .foregroundColor(.black)
                        .font(.system(size: 24, weight: .semibold))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isSettings = true
                        }
                        
                    }, label: {
                        
                        Image("settings")
                    })
                }
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 5) {
                        
                        Text("Income")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .medium))
                        
                        Text("$ \(viewModel.farms.map(\.income).reduce(0, +))")
                            .foregroundColor(.white)
                            .font(.system(size: 26, weight: .semibold))
                        
                        Text("Number of farms: \(viewModel.farms.count)")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 110)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("blue")))
                    
                    if viewModel.farms.isEmpty {
                        
                        HStack {
                            
                            Image("empty")
                            
                            VStack(alignment: .leading, spacing: 8, content: {
                                
                                Text("Empty")
                                    .foregroundColor(.black)
                                    .font(.system(size: 19, weight: .semibold))
                                    .multilineTextAlignment(.leading)
                                
                                Text("You don't have any crypto farms added yet")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .multilineTextAlignment(.leading)
                            })
                        }
                        .padding()
                        
                    } else {
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            
                            HStack {
                                
                                ForEach(viewModel.farms, id: \.self) { index in
                                
                                    Button(action: {
                                        
                                        viewModel.selectedFarm = index
                                        viewModel.isDetail = true
                                        
                                    }, label: {
                                        
                                        VStack(alignment: .leading) {
                                                                        
                                            Text("+$ \(index.income)")
                                                .foregroundColor(.black)
                                                .font(.system(size: 14, weight: .regular))
                                                .padding(7)
                                                .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                                            
                                            Text(index.name ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 16, weight: .semibold))
                                            
                                        }
                                        .padding()
                                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                                        .frame(width: 250, height: 160)
                                        .background(
                                        
                                            Image("mf")
                                                .resizable()
                                                .cornerRadius(15)
                                        )
                                    })
                                }
                            }
                        }
                    }
                    
                    Button(action: {
                        
                        viewModel.isAdd = true
                        
                    }, label: {
                        
                        Text("Add farm")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("blue")))
                            .padding(.vertical)
                    })
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                     
                        NavigationLink(destination: {}, label: {
                            
                            VStack(spacing: 9) {
                                
                                Image("educations")
                                
                                Text("Education")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .medium))
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 90)
                            .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.3)))
                        })
                        .opacity(0.4)
                        .disabled(true)
                        
                        NavigationLink(destination: {
                            
                            CurrenciesView()
                                .navigationBarBackButtonHidden()
                            
                        }, label: {
                            
                            VStack(spacing: 9) {
                                
                                Image("currencies")
                                
                                Text("My currencies")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .medium))
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 90)
                            .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.3)))
                        })
                        
                        NavigationLink(destination: {
                            
                            RecomsView()
                                .navigationBarBackButtonHidden()
                            
                        }, label: {
                            
                            VStack(spacing: 9) {
                                
                                Image("recommendations")
                                
                                Text("Recommendations")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .medium))
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 90)
                            .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.3)))
                        })
                        
                        NavigationLink(destination: {
                            
                            AchievesView()
                                .navigationBarBackButtonHidden()
                            
                        }, label: {
                            
                            VStack(spacing: 9) {
                                
                                Image("achievements")
                                
                                Text("Achievements")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .medium))
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 90)
                            .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.3)))
                        })
                    })
                }
            }
            .padding()
        }
        .overlay (
        
            ZStack {
                
                Color.black.opacity(viewModel.isSettings ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isSettings = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Text("Settings")
                            .foregroundColor(.black)
                            .font(.system(size: 19, weight: .semibold))
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isSettings = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 12, weight: .medium))
                                .padding(10)
                                .background(Circle().fill(.gray.opacity(0.1)))
                        })
                    }
                    
                    Button(action: {
                        
                        SKStoreReviewController.requestReview()
                        
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "star.fill")
                                .foregroundColor(Color("blue"))
                                .font(.system(size: 14, weight: .regular))
                            
                            Text("Rate our app")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                    })
                    
                    Button(action: {
                        
                        guard let url = URL(string: "https://www.termsfeed.com/live/4ab6eb63-c52f-41f3-88c4-835a5ccbfef0") else { return }
                        
                        UIApplication.shared.open(url)
                        
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "doc.fill")
                                .foregroundColor(Color("blue"))
                                .font(.system(size: 14, weight: .regular))
                            
                            Text("Usage Policy")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                    })
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.white.ignoresSafeArea())
                .frame(maxHeight: .infinity, alignment: .bottom)
                .offset(y: viewModel.isSettings ? 0 : UIScreen.main.bounds.height)
            }
        )
        .onAppear {
            
            viewModel.fetchFarms()
        }
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            if let index = viewModel.selectedFarm {
                
                FarmDetail(index: index)
            }
        })
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddFarm(viewModel: viewModel)
        })
    }
}

struct MCFView_Previews: PreviewProvider {
    static var previews: some View {
        MCFView()
    }
}
