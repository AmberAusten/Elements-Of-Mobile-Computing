// Project: VasquezAmberEtana-HW6
// EID: kav835
// Course: CS329E

// Pizza.swift


import Foundation

class Pizza {
  let pSize: Size
  let crust: CrustType
  let cheese: CheeseType
  let meat: MeatType
  let veggies: VeggieType

  init(size: Size, crustType: CrustType, cheeseType: CheeseType, meatType: MeatType, veggieType: VeggieType) {
    self.pSize = size
    self.crust = crustType
    self.cheese = cheeseType
    self.meat = meatType
    self.veggies = veggieType
  }
    func summary() -> String{
      return """
      One \(pSize.stringValue) pizza with:
         \(crust.stringValue)
         \(cheese.stringValue)
         \(meat.stringValue)
         \(veggies.stringValue)
      """
    }
  }

