import Foundation

//: # Protocols
//: Protocols are, as per Apple's definition in the _Swift Programming Language_ book:
//:
//: "... a blueprint of methods, properties, and other requirements that suit a particular task or piece of functionality. The protocol can then be adopted by a class, structure, or enumeration to provide an actual implementation of those requirements. Any type that satisfies the requirements of a protocol is said to conform to that protocol."
//:
//: The below example shows a protocol that requires conforming types have a particular property defined.
// Anyone using this protocal must have a fullName property.
protocol FullyNamed {
    var fullName: String { get }
}

// The ": FullyNamed" is the "adoption" or promise that we will follow the protocol's requirements
struct Person: FullyNamed {
    var fullName: String
}

class StarShip: FullyNamed {
      
    // The starship could have a prefix but not all will
    var prefix: String?
    var name: String
    
    init(prefix: String?, name: String) {
        self.name = name
        self.prefix = prefix
    }
    
    // Conformance to the FullyNamed protocol
    var fullName: String {
        if let unwrappedPrefix = prefix {
            return "\(unwrappedPrefix) \(name)"
        } else {
            return name 
        }
    }
    
}

//: Protocols can also require that conforming types implement certain methods.



//: Using built-in Protocols



//: ## Protocols as Types


