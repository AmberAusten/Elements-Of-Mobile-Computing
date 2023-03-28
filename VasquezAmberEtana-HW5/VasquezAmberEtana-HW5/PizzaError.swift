// Project: VasquezAmberEtana-HW5
// EID: kav835
// Course: CS329E

// PizzaError.swift


import Foundation

enum PizzaValidationError: Error {
    case size
    case crust
    case cheese
    case meat
    case veggie
}

extension PizzaValidationError: LocalizedError {
    public var errorDescription: String? {
      switch self {
        case .size:
          return NSLocalizedString("Pizza Size Required", comment: "Missing Property")
        case .crust:
          return NSLocalizedString("Missing Crust Option", comment: "Missing Property")
        case .cheese:
          return NSLocalizedString("Missing Cheese Option", comment: "Missing Property")
        case .meat:
          return NSLocalizedString("Missing Meat Option", comment: "Missing Property")
        case .veggie:
          return NSLocalizedString("Missing Veggie Option", comment: "Missing Property")
      }
    }
}
