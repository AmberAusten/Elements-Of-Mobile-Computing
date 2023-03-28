// Project: VasquezAmberEtana-HW6
// EID: kav835
// Course: CS329E

// PizzaOptions.swift


import Foundation
protocol BaseEnum: CaseIterable {
    var stringValue: String {get}
}


enum Size: Int,BaseEnum {
  case small = 0
  case medium = 1
  case large = 2

  var stringValue: String {
    switch (self) {
      case .small:
        return "Small"
      case .medium:
        return "Medium"
      case .large:
        return "Large"
    }
  }
}

enum CrustType: Int,BaseEnum {
  case thin = 0
  case thick = 1

  var stringValue: String {
    switch (self) {
      case .thin:
        return "Thin Crust"
      case .thick:
        return "Thick Crust"
    }
  }
}

enum CheeseType: Int,BaseEnum {
  case regular = 0
  case doubleCheese = 1
  case noCheese = 2

  var stringValue: String {
    switch (self) {
      case .regular:
        return "Regular Cheese"
      case .doubleCheese:
        return "Double Cheese"
      case .noCheese:
        return "No Cheese"
    }
  }
}

enum MeatType: Int,BaseEnum {
  case pepperoni = 0
  case sausage = 1
  case canadianBacon = 2

  var stringValue: String {
    switch (self) {
      case .pepperoni:
        return "Pepperoni"
      case .sausage:
        return "Sausage"
      case .canadianBacon:
        return "Canadian Bacon"
    }
  }
}


enum VeggieType: Int,BaseEnum {
  case mushroom = 0
  case onion = 1
  case greenOlive = 2
  case blackOlive = 3
  case noVeggie = 4

  var stringValue: String {
    switch (self) {
      case .mushroom:
        return "Mushroom"
      case .onion:
        return "Onion"
      case .greenOlive:
        return "Green Olive"
      case .blackOlive:
        return "Black Olive"
      case .noVeggie:
        return "None"
    }
  }
}
