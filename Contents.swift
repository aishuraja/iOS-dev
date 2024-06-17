import Cocoa

//var greeting = "Hello, playground"
//var fname = "Aishwarya"
//let lname = "Raja"
//let quote = "All is well"
//let mqoute = """
//A day
//in
//my life
//"""
//print(fname.count)
//print(quote.hasPrefix("A day"))
//print(mqoute.hasSuffix("my life"))
//
//var score = 10
//score+=2
//print(score)
//print(score.isMultiple(of:6 ))
//
//
//
//let a = 0.1
//let b = 0.2
//print(a+b)

var boo1 = true
var boo2 = false
//using ! operator
print(boo1)
boo1 = !boo1
print(boo1)
//using toggle()
print("value of boo2:", boo2)
boo2.toggle()
print("value of boo2 using toggle:",boo2)


//string concadenation
let statement1 = "I have"
let statement2 = 5
let statement3 = "chocolates"
let result = statement1 + " " + String(statement2) + " " + statement3
print(result)

//To optimize use string interpolation
let result1 = "\(statement1) \(statement2) \(statement3)"
print(result1)
//another example:

let example = 84.7
print("My current weight is \(example) ")

//converting temperature from C to F
let tempc = 55.7
var tempf = ((tempc*9)/5) + 32
print("celius: \(tempc)°C Farhentient: \(tempf)°F")

// arrays
// try with append function
var names = ["Aishu", "John" ,"mathew"]
names.append("Hosanna")
print(names)
names.count
names.remove(at: 2)
names.count
print(names.contains("Aishu"))
print(names.sorted())
print(names.reversed())
 
// dictionaries
let employees = [
    "name": "Aishu",
    "job title" : "Software Engineer",
    "location" : "San Fransico"
]
print(employees["name", default: "unknown"] )
print(employees["job title", default: "unknown"])
// creating an empty dictinoary and set the key value
var marks = [String:Int]()
marks["Ishh"] = 100
marks["Kali"] = 80
marks["don"] = 50
marks["kuns"] = 20
print("the marks of students:",marks)

//sets
var actors = Set<String>()
actors.insert("Tom cruise")
actors.insert("Danzel Wahington")
actors.insert("Nicholas Cage")
actors.insert("Jacky chan")
print(actors)

//enum
enum weekday {
    case Monday, Tuesday, Wednesday, Thursday, Friday
}
var days = weekday.Monday
days = .Friday
days = .Thursday
