//
//  RecomsViewModel.swift
//  App203
//
//  Created by Вячеслав on 10/4/23.
//

import SwiftUI
import Alamofire

final class RecomsViewModel: ObservableObject {
    
    @Published var isLoading: Bool = false
    
    @AppStorage("viewed_videos") var viewed_videos: Int = 0
    
    @Published var lessons: [RecomsItem] = []
    
    @Published var selectedLesson: RecomsItem = RecomsItem(id: 1, categoryId: 1, title: "", image: "", video: "", duration: 1)
    @Published var isDetail: Bool = false
    
    func getVideos() {
        
        isLoading = true
        
        self.fetchVideos() { result in
            
            switch result {
                
            case .success(let success):
                
                self.lessons = success.rows
                
            case .failure(let failure):
                
                debugPrint("Parse error - \(failure)")
                
                self.isLoading = false
            }
        }
    }
    
    func fetchVideos(completion: @escaping (Result<RecomsModel, Error>) -> Void ) {
        
        isLoading = true
        
        let params: Parameters = [
            
            "token": "17009aa0-18d3-45b2-9082-705376859919",
        ]
        
        let request = AF.request("https://nonogert.space/api/v2/video", method: .get, parameters: params)
        
        request.responseDecodable(of: RecomsModel.self) { response in
            
            guard let value = response.value else {
                
                self.isLoading = false
                return
            }
                           
            switch response.result{
                
            case .success(_):
                
                completion(.success(value))
                self.isLoading = false
                
            case .failure(_):
                
                completion(.failure(response.error.debugDescription as! Error))
                self.isLoading = false
            }
        }
    }
}
