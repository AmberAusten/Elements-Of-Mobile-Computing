// Project: VasquezAmberEtana-HW6
// EID: kav835
// Course: CS329E
//
// CoreDataStack.swift


import Foundation
import CoreData

class CoreDataStack {

    lazy var managedContext: NSManagedObjectContext = {
        let container = NSPersistentContainer(name: "PizzaModel")
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                print("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container.viewContext
    }()

    func saveContext() {
        guard managedContext.hasChanges else { return }
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Unresolved error \(error), \(error.userInfo)")
        }
    }
}
