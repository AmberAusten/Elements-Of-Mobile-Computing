// Project: VasquezAmberEtana-HW6
// EID: kav835
// Course: CS329E

// PizzaModel+CoreDataProperties.swift
//


import Foundation
import CoreData


extension PizzaModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PizzaModel> {
        return NSFetchRequest<PizzaModel>(entityName: "PizzaModel")
    }

    @NSManaged public var size: Int64
    @NSManaged public var crust: Int64
    @NSManaged public var meat: Int64
    @NSManaged public var cheese: Int64
    @NSManaged public var veggies: Int64

}

extension PizzaModel : Identifiable {

}
