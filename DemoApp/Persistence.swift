//
//  Persistence.swift
//  DemoApp
//
//  Created by Azruddin Shaikh on 03/12/24.
//

import CoreData
import SwiftUI

class CoreDataHelper {
    // MARK: - Singleton Instance
    static let shared = CoreDataHelper()
    
    private init() {} // Prevent direct instantiation
    
    // MARK: - Core Data Stack
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "DemoApp") // Replace with your Core Data model name
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    // MARK: - Core Data Operations
    
    /// Save the current context
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    /// Fetch data of a specific type
    /// - Parameters:
    ///   - entity: The entity type to fetch
    ///   - predicate: Optional NSPredicate for filtering
    /// - Returns: Array of fetched objects
    func fetch<T: NSManagedObject>(_ entity: T.Type, predicate: NSPredicate? = nil) -> [T] {
        let request = T.fetchRequest()
        request.predicate = predicate
        
        do {
            return try context.fetch(request) as? [T] ?? []
        } catch {
            print("Fetch error: \(error.localizedDescription)")
            return []
        }
    }
    
    /// Delete an object from the context
    /// - Parameter object: The NSManagedObject to delete
    func delete(_ object: NSManagedObject) {
        context.delete(object)
        saveContext()
    }
    
    /// Create a new object for a specific entity
    /// - Parameter entity: The entity type
    /// - Returns: A new instance of the entity
    func create<T: NSManagedObject>(_ entity: T.Type) -> T {
        return T(context: context)
    }
    
    func addMockData() {
        // Add a mock car
        let car = create(Car.self)
        car.body_type = "Hatchback"
        car.car_id = "123"
        car.car_name = "Peugeot 2008"
        car.din_no = "12345678"
        car.din_no_expiry_date = "20/01/2024"
        car.fuel_type = "Patrol"
        car.images = [
            UIImage(resource: .car),
            UIImage(resource: .car)
        ].compactMap { $0!.pngData() }
        car.km_driven = "21,930"
        car.manufactur_year = "2024"
        car.modal_name = "1.2 PureTech GT 5dr EAT8"
        car.thumbnail_path = "car"
        car.transmission = "Automatic"
        car.tuition = "1234 ABC"
        
        saveContext()
    }
}
