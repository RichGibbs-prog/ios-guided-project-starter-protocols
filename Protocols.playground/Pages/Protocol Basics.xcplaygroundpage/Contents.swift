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

let me = Person(fullName: "Rich")

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

extension StarShip: Equatable {
    // All we need to do is compare each side and see if they have the same values or not
    static func == (lhs: StarShip, rhs: StarShip) -> Bool {
        if lhs.fullName == rhs.fullName {
            return true
        } else {
            return false
        }
    }
    
    
}


let enterprise = StarShip(prefix: "USS", name: "Enterprise")
enterprise.name = "Lambda"

let serenity = StarShip(prefix: nil, name: "Firefly")

let fullyNamedThings : [FullyNamed] = [me, enterprise]

for thing in fullyNamedThings {
    print(thing.fullName)
}
//: Protocols can also require that conforming types implement certain methods.
protocol GeneratesRandomNumbers {
// We intentionally don't write the implementation of this function in the protocol. We instead leave it to the adopters of the protocol to create their own implementation.
    func random() -> Int
}

class oneThroughTen: GeneratesRandomNumbers {
   func random() -> Int {
   /* 'return' is optional  */ Int.random(in: 1...10)
    }
}


let generator = oneThroughTen()

generator.random()
//: Using built-in Protocols
if 100 == 100 {
    print("They numbers are the same")
}

if serenity == enterprise {
    print("They are the same")
}

//: ## Protocols as Types

// Make a protocol called Animal

// The protocol needs to have a property called numberOfLegs: Int
// and a function called func speak()

// create two or more data types (class or struct) that adopt and conform to this protocol.

// cat and dog for example


protocol Animal {
    var numberOfLegs: Int { get }
    
    func speak()
}

struct Cat: Animal {
    var numberOfLegs: Int
    
    func speak() {
        print("Meow")
    }
    
    
}

struct Dog: Animal {
    var numberOfLegs: Int
    
    func speak() {
        print("Woof")
    }
    
    
}

let myCat = Cat(numberOfLegs: 4)

myCat.speak()
