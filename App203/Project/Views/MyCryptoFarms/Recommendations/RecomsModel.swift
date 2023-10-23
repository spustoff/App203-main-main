//
//  RecomsModel.swift
//  App203
//
//  Created by Вячеслав on 10/4/23.
//

import SwiftUI

struct RecomsModel: Codable, Hashable {
    
    var errors: Bool
    
    var rows: [RecomsItem]
}

struct RecomsItem: Codable, Hashable {
    
    var id: Int?
    var categoryId: Int?
    var title: String?
    var image: String?
    var video: String?
    
    var duration: Int?
}
