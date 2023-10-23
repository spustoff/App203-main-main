//
//  RecomsView.swift
//  App203
//
//  Created by Вячеслав on 10/4/23.
//

import SwiftUI

struct RecomsView: View {
    
    @StateObject var viewModel = RecomsViewModel()
    
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Recommendations")
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
                
                if viewModel.isLoading {
                    
                    ProgressView()
                        .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    if viewModel.lessons.isEmpty {
                        
                        VStack(alignment: .center, spacing: 7, content: {
                            
                            Image("empty")
                            
                            Text("Empty")
                                .foregroundColor(.black)
                                .font(.system(size: 18, weight: .semibold))
                                .multilineTextAlignment(.center)
                            
                            Text("You don't have any properties added yet")
                                .foregroundColor(.black)
                                .font(.system(size: 13, weight: .regular))
                                .multilineTextAlignment(.center)
                        })
                        .frame(maxHeight: .infinity, alignment: .center)
                        
                    } else {
                        
                        ScrollView(.vertical, showsIndicators: true) {
                            
                            LazyVStack {
                             
                                ForEach(viewModel.lessons, id: \.self) { index in
                                    
                                    Button(action: {
                                        
                                        viewModel.selectedLesson = index
                                        viewModel.isDetail = true
                                        
                                    }, label: {
                                        
                                        HStack(spacing: 10) {
                                            
                                            WebPic(urlString: index.image ?? "", width: 100, height: 70, cornerRadius: 10, isPlaceholder: true)
                                            
                                            VStack(alignment: .leading, spacing: 8, content: {
                                                
                                                Text(index.title ?? "")
                                                    .foregroundColor(.black)
                                                    .font(.system(size: 15, weight: .medium))
                                                    .multilineTextAlignment(.leading)
                                                    .lineLimit(2)
                                                
                                                Text("Duration: \(index.duration ?? 0) min.")
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 13, weight: .regular))
                                                    .multilineTextAlignment(.leading)
                                            })
                                            
                                            Spacer()
                                        }
                                    })
                                }
                            }
                            .padding([.horizontal, .bottom])
                        }
                    }
                }
            }
        }
        .onAppear {
            
            viewModel.getVideos()
        }
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            RecomsDetail(index: viewModel.selectedLesson)
        })
    }
}

#Preview {
    RecomsView()
}
