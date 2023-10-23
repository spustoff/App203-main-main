//
//  AddFarm.swift
//  App203
//
//  Created by Вячеслав on 10/4/23.
//

import SwiftUI

struct AddFarm: View {
    
    @Environment(\.presentationMode) var router
    
    @StateObject var viewModel: MCFViewModel
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("New Crypto Farm")
                        .foregroundColor(.black)
                        .font(.system(size: 19, weight: .semibold))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .medium))
                            .padding(15)
                            .background(Circle().fill(.gray.opacity(0.1)))
                    })
                }
                .padding()
                
                ScrollView(.vertical, showsIndicators: true) {
                    
                    LazyVStack(spacing: 30) {
                        
                        VStack(alignment: .leading, spacing: 7, content: {
                            
                            Text("Name")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13, weight: .regular))
                                    .opacity(viewModel.name.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.name)
                                    .foregroundColor(.black)
                                    .font(.system(size: 13, weight: .regular))
                            })
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).stroke(.gray.opacity(0.2)))
                        })
                        
                        VStack(alignment: .leading, spacing: 7, content: {
                            
                            Text("Income")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("$0.00")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13, weight: .regular))
                                    .opacity(viewModel.income.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.income)
                                    .foregroundColor(.black)
                                    .font(.system(size: 13, weight: .regular))
                                    .keyboardType(.decimalPad)
                            })
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).stroke(.gray.opacity(0.2)))
                        })
                        
                        VStack(alignment: .leading, spacing: 7, content: {
                            
                            Text("Cryptocurrency")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13, weight: .regular))
                                    .opacity(viewModel.cryptocurrency.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.cryptocurrency)
                                    .foregroundColor(.black)
                                    .font(.system(size: 13, weight: .regular))
                            })
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).stroke(.gray.opacity(0.2)))
                        })
                        
                        VStack(alignment: .leading, spacing: 7, content: {
                            
                            Text("Description")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13, weight: .regular))
                                    .opacity(viewModel.text.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.text)
                                    .foregroundColor(.black)
                                    .font(.system(size: 13, weight: .regular))
                            })
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).stroke(.gray.opacity(0.2)))
                        })
                    }
                    .padding()
                }
                
                Spacer()
                
                Button(action: {
                    
                    viewModel.addFarm {
                        
                        viewModel.fetchFarms()
                        
                        router.wrappedValue.dismiss()
                    }
                    
                }, label: {
                    
                    Text("Create")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("blue")))
                        .padding()
                })
                .opacity(viewModel.name.isEmpty || viewModel.income.isEmpty || viewModel.cryptocurrency.isEmpty || viewModel.text.isEmpty ? 0.5 : 1)
                .disabled(viewModel.name.isEmpty || viewModel.income.isEmpty || viewModel.cryptocurrency.isEmpty || viewModel.text.isEmpty ? true : false)
            }
        }
    }
}

#Preview {
    AddFarm(viewModel: MCFViewModel())
}
