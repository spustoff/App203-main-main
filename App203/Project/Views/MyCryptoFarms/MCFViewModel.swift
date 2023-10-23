//
//  MCFViewModel.swift
//  App203
//
//  Created by IGOR on 30/09/2023.
//

import SwiftUI
import CoreData

final class MCFViewModel: ObservableObject {
    
    @Published var farms: [HistoryModel] = []
    
    @Published var isDetail: Bool = false
    @Published var selectedFarm: HistoryModel?
    
    @Published var name: String = ""
    @Published var income: String = ""
    @Published var cryptocurrency: String = ""
    @Published var text: String = ""
    
    @Published var isAdd: Bool = false
    @Published var isSettings: Bool = false
    
    func addFarm(completion: @escaping () -> (Void)) {
        
        CoreDataStack.shared.modelName = "HistoryModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let trans = NSEntityDescription.insertNewObject(forEntityName: "HistoryModel", into: context) as! HistoryModel
        
        trans.name = name
        trans.income = Int16(income) ?? 0
        trans.cryptocurrency = cryptocurrency
        trans.text = text
        
        CoreDataStack.shared.saveContext()
        
        completion()
    }
    
    func fetchFarms() {
        
        CoreDataStack.shared.modelName = "HistoryModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<HistoryModel>(entityName: "HistoryModel")

        do {
            
            let branch = try context.fetch(fetchRequest)
            
            self.farms = branch
            
        } catch let error as NSError {
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.farms = []
        }
    }
}
