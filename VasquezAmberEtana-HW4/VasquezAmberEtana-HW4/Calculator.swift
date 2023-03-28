// Project: VasquezAmberEtana-HW4
// EID: kav835
// Course: CS329E

// Calculator.swift
//
//

import Foundation

enum Operator{
    case add
    case subtract
    case multiply
    case divide
    
    var operation: String {
        switch (self){
            
        case .add:
            return "+"
        case .subtract:
            return "-"
        case .multiply:
            return "*"
        case .divide:
            return "/"
        }
    }
    
    var stringValue:String{
        switch (self){
            
        case .add:
            return "add"
        case .subtract:
            return "subtract"
        case .multiply:
            return "multiply"
        case .divide:
            return "divide"
        }
    }
}

class Calculator {
    var operation: Operator
    init(operation:Operator){
        self.operation = operation
    }
    func calculate(a:String, b:String) -> Float{
        let expression = NSExpression(format: "\(a) \(operation.operation) \(b)" )
        return (expression.expressionValue(with: nil, context: nil) ?? 0) as! Float
        
    }
}
