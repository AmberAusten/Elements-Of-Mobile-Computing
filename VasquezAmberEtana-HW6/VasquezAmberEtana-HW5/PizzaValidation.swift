/// Project: VasquezAmberEtana-HW6
// EID: kav835
// Course: CS329E

// PizzaValidation.swift


import Foundation

class PizzaValidation {
  static func validate(size: Size?, crustType: CrustType?, cheeseType: CheeseType?, meatType: MeatType?, veggieType: VeggieType?) throws -> Pizza  {
    guard let sizeSafe = size else {
      throw PizzaValidationError.size
    }
    guard let crustSafe = crustType else {
      throw PizzaValidationError.crust
    }
    guard let cheeseSafe = cheeseType else {
      throw PizzaValidationError.cheese
    }
    guard let meatSafe = meatType else {
      throw PizzaValidationError.meat
    }
    guard let veggieSafe = veggieType else {
      throw PizzaValidationError.veggie
    }
     return Pizza (size: sizeSafe, crustType: crustSafe, cheeseType: cheeseSafe, meatType: meatSafe, veggieType: veggieSafe)
  }
}
