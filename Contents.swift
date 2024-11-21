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

// type annotation
let username : String = "type annotation"
print(username)
// array here
var array1 : [String] = [String]()
// dictionary here
var dict : [String:Int] = [String:Int]()
dict["one"] = 1
print(dict)
// sets here
var setz:Set<String> = Set(["set1","set2"])
print(setz)

//  checkpoint practice - create an array of strings , then print the no of items in the array and print the unique items from that
let arr = [1,2,3,3]
arr.count // length of the array
var unique = Set(arr) // using Set to find the unique values - as Set does not contain any duplicate values.
print(unique)
// set can be made from array using "Set(somearray)"

// conditions
var firstname = "Aishwarya"
var lastname = "Raja"
if firstname != lastname {
    print("the names are not equal")
}

var emptyname = ""
if emptyname .isEmpty{
    print("the name is not declared its empty!")
}

// switch condition
enum Weather {
    case sun, rain, wind, snow, unknown
}
let forecast = Weather.sun

switch forecast{
    
case.sun:
    print("its hot a day")
case.rain:
    print("its a rainy day, carry umbrela")
case.snow:
    print("its an ice but not nice day")
    
case.wind:
    print("Too windy")
case.unknown:
    print("weather is unpredictable")
}

// another swicth example

let conversation = 5
print("Lets begin the conversation!")
switch conversation {
case 5:
    print("Hi I am Ishh, I am a computer student and I love working with my projects ")
    fallthrough // carrys the entire case and prints everything , this is not neccsary most of the times
case 4:
    print("Ish: what about you?")
    fallthrough
case 3:
    print("other: I am ___ I live in Boston")
    fallthrough
case 2:
    print("Ish: Thats great to know , I live in Boston too! What you do in free time?")
    fallthrough
case 1:
    print("other: I watch movies and hang out with my friends and family")
    
default:
    print("Conversation doesnot exists:(")
}
//ternary conditional operator for quick test
let age = 18
let canVote = age>=18 ? "Yes can Vote": "Not allowed to vote, Reason: Under Age! "
print(canVote)

let Names = ["Ish","Vish","John"]
let namescount = Names.isEmpty ? "Yes its empty" : "\(Names.count) people are there in the list"
print(namescount)

// for loop
var platform = ["ios","macos","watchos","tvos"]
for os in platform{
    print("swift works good in \(os)")
}
//nested for loops
for i in 1...5{
    print("\(i) table:")
    
    for j in 1...5{
        print(" \(i) * \(j) = \(i*j)")
    }
    
}

//range
for i in 1...5{
    print("the for loop has range from 1 through 5:\(i)")
}
for i in 1..<5{
    print("the for loop has range from 1 up to 5:\(i)")
}
// use underscores
var lyric = "haters gonna"
for _ in 1...5{
    lyric+=" hate "
}

//while loop
var number = 1
while number<10{
    print("\(number) is less than 9")
    number+=1
}
print("Loop breaks!")

// using random
let id = Int.random(in: 2...10)  // gives the random number from the range 2 to 10
print(id)
// using random in while loop
var roll = 1
while roll != 20{
    roll = Int.random(in: 1...20)
    print("The roll shows \(roll)")
}
print("Value found!")

// practicing nested loops
let options = ["up","down","left","right"]
let secretoption = ["up","up","right"]
for i in options{
    for j in options{
        for k in options{
            var attempt = [i,j,k]
            print("the attempts:\(attempt)")
            if attempt == secretoption{
               
               print("The secretoption \(attempt) is unlocked!")

                
            }
            
        }
    }
}

// checkpoint 3 - solving fizzbuzz problem
// problem statement - goal is to loop from 1 through 100 and for each number,
// if its multiple of 3 - print "Fizz"
// if its multiple of 5 - print "Buzz"
// if its multiple of 3 and 5 - print "FizzBuzz"
// otherwise, for all numbers - print the respective numbers...

for i in 1...100{
    if i.isMultiple(of: 3) && i.isMultiple(of: 5){
        print("FizzBuzz")
        continue
    }
    else if i.isMultiple(of: 3){
        print("Fizz")
        continue
    }
    else if i.isMultiple(of: 5){
        print("Buzz")
    
    }
    else{
        print("No match- \(i)")
    }
}

// functions
func showvalues(number: Int, end: Int){
    for i in 1...end{
        print("\(i) * \(number) = \(i * number)")
    }
}
showvalues(number: 2, end: 20)

// return values from funtion
func letters(letter1: String, letter2: String) -> Bool {
    return letter1 == letter2
}

func pythogoras(side1:Double,side2:Double) -> Double{
   sqrt(side1*side1 + side2*side2) // return statement is not nesccary to mention if the function has only single expression in body. Swift automatically understands that the function returns a value.
}
pythogoras(side1: 3.0, side2: 4.0)

// customize paramater names :

//func isUppercase(string: String) -> Bool{
//    string == string.uppercased()
//}
//let string = "HELLO"
//isUppercase(string: string) // instead by calling this fucntion this way using the underscore

func isUppercase(_ string:String) -> Bool{
    string == string.uppercased()
}
let x = "BYE"

isUppercase(x)

// external and internal paramater names

func tables(for num:Int){
    for i in 1...10{
        print("\(i)* \(num) is \(i*num) ")
    }
}
tables(for: 5)

// default values
var characters = ["lana","hana","juna"]
print(characters.count)
characters.removeAll(keepingCapacity: true) // even after removing elements keeps the exisiting capacity of an array for future use if nesscary , by default the bool vlaue is false.
//print(characters.count)
characters.isEmpty


// checkpoint
enum SquareRootErrors : Error{
    case outbound, noroot
}

func integeres(_ number:Int) throws -> Int{
    if number<1 || number>10000{
        throw SquareRootErrors.outbound
    }
    
    for i in 1...10000{
        if number == i*i{
            return i
        }
    }
    throw SquareRootErrors.noroot
     
}
    
let input = 25
    do{
        let result = try integeres(input)
        print("the square root of \(input) is \(result)")
        
    }catch SquareRootErrors.outbound {
        print("error outbound")
    }catch SquareRootErrors.noroot{
        print("error - it has no root")
    }catch {
        print("unknown error")
    }

// closure

let team = ["floria", "andria", "Suzan","maria","mathew"]
let CaptainFirstTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzan"{
        return true
    } 
    else if name2 == "Suzan" {
        
        return false
    }
    
    return name1<name2
    
})
print(CaptainFirstTeam)

// tarling closure

let captainFirstTeam = team.sorted{ name1 , name2 in
    if name1 == "Suzan"{
        return true
    }
    else if name2 == "Suzan" {
        
        return false
    }
    
    return name1<name2
    
}
print(captainFirstTeam)

// shorthand syntax for closure

let captainfirstTeam = team.sorted {
    if $0 == "Suzan"{
        return true
    }
    else if $1 == "Suzan" {
        
        return false
    }
    
    return $0<$1
    
}

//let mONLY = team.filter{$0.hasPrefix("m")}
//print(mONLY)
//
//
//let luckyNumbers = [7,4,38,21,16,15,12,33,31,49]
//
//var evenNumbers = [Int]()
//for i in luckyNumbers{
//    if i/2 == 0{
//        evenNumbers.append(i)
//        
//        
//        
//        
//    }
//    let SortedNumbers = luckyNumbers.sorted { sname1 , sname2 in2
//
//        
//                                        
//        
//        
//        
//        
//    }
//        
//        
//    }

// structure

struct Employee {
    let name:String
    var vacationRemaining:Int
    
   mutating func takeVacation(days:Int){  // mutating allows to read and write the properties.
        if vacationRemaining > days{
            vacationRemaining -= days
            print("im going on vacation")
            print("Days remaining: \(vacationRemaining)")
            
        }else{
            print("oops, you dont have enough vacation remaining")
        }
    }
}

var siddhu = Employee(name: "siddhu", vacationRemaining: 10)
siddhu.takeVacation(days: 5)
print(siddhu.vacationRemaining)








// clear explanation topicwise - for my practice and reference 

import Cocoa

// 1. Creating contants and variables:

    // var is mutable - can be changed any time
var name = "Aishu"
print(name)

    // let is constant - can't be changed
let name_1 = "Raja"
print(name_1)
name = "Aishwarya" // will change aishu to aishwarya
    // name_1 = "raja" // wont change Raja to raja bcz its constant (let)
print("changed name:", name)


// 2. Strings:

let actor = "Tom Cruise"

    // Having quotes inside the string - use backslash \"...\"

let quote = "If you \"Believe\" in yourself , the universe \"Gives\" that to you"

    // To span your string in "multiple lines", use three quotes """ ..."""

let movie = """
A day in
the life of an
iOS Engineer
"""
print(movie)


// string provides a collection of properties and methods to work with

print(actor.count)
print(quote.hasPrefix("If"))
print(quote.hasSuffix("You")) // returns false has strings are case sensitive


// 3. Integers
    // performs mathematical operations as well
let score = 10
let highestScore = score + 10
let halvedScore = score / 2

var counter = 10
counter+=5

let nNumber = 120
print(nNumber.isMultiple(of: 5))

    // make new intgers in random way of choosing
let id = Int.random(in: 1...100) // provides any random no between 1 to 100



// 4. Decimals

let scores = 3.0 // either 3.0 or 3.1 its decimal

// 5. Booleans: True/False

let good = true
let bad = false
    // can change true to false or vice versa using toggle()
var isSaved = false
isSaved.toggle() // prints true


// 6. String interpolation - joining strings [ can create strings with any data and datatype]

let Name = "Aishwarya"
let age = "23"
let message = "I am \(name) and my age is \(age)"
print(message)


// 7. Arrays

var colors = ["Red", "Green", "Blue"]
let Nos = [ 1,2,3]
var readings = [0.2, 0.3, 0.5]

print(colors[0])
print(readings[2])

colors.append("white")
colors.remove(at: 0)
print(colors)
print(colors.count)

print(colors.contains("purple"))


// 8.Dictionaries:

let employee = [
    "name":"Ish",
    "job":"iOS developer"
    

]

print(employee["job", default: "Unknown"] ) // if job exists prints its value else prints the default value


// 9. Sets: similar to arrays and contains no duplicate values and they are unordered

var Numbers = Set([1,2,2,3,4,5,7,7])
print(Numbers)

    // To insert values use insert() not append as we dont have any orders here ie sets are unordered
Numbers.insert(10)
Numbers.contains(11)

// 10. enum - set of named values
enum Weekday{
    case monday, tuesday, wednesday
}
var day = Weekday.monday
day = .wednesday
print(day)

//11. Type annotations: declaring data type

var SCORE: Double = 0
var player:String = "MSD"
var luckyNumber:Int = 10
let pi: Double = 3.14
var isEnabled: Bool = true

    // to declare arrays, dict , set

var Colorss: Array<String> = ["Red", "Blue", "Green"]
var user: Dictionary<String, String> = ["id":"@Aishhhh"]
var books: Set<String> = Set(["The Bluest eye", "Foundation"])

    // above have special syntax - shorthand

var Colorz: [String] = ["Red", "Blue", "Green"]
var Users: [String:String] = ["id":"@Aishhhh"]

    // create an empty array
var teams: [String] = [String]()
    // or remove type annotation
var clues = [String]()

    // same for enum declarin its type
enum UIStyle{
    case light, dark , system
}

var style: UIStyle = .light


// 12. Conditions: if , else if, else
let Age = 18
if Age < 12{
    print("You can't vote!")
} else if Age < 18{
    print("You can vote soon!")
} else {
    print("You can vote!")
}

let temp = 26
// and
if temp > 20 && temp < 30{
    print("Its a nice day!")
}

// or
if temp > 20 || temp < 30{
    print("Its a nice day!")
}


// 13. Switch - check a value against multiple conditions using switch
    // Switch must be exhaustive - must have one case for each value on your enum

enum Weather {
    case sun ,rain , wind
}

let forecast = Weather.sun

switch forecast{
case .sun:
    print("Its hot day")
case . rain:
    print("Pack an umbrella")
default:
    print("Should be okay")
}


// 14. ternary condition : WTF - what (set condition)?? True or False
let AGE = 18
let canVote = AGE>=18 ? "Yes" : "No"
print(canVote)


// 15. Loops
let platforms = ["macOS","iOS","tvOS", "watchOS"]

for os in platforms{
    print("Swift works on \(os)")
}
// range
for i in 1...12{
    print("5 x \(i) is \(5*i) ")
}
var lyrics = "Haters gonna"
// not use i
for _ in 1..<5{
    lyrics += " hate"
}
print(lyrics)

// while - excutes as long as condition is true
var count = 10
while count > 0 {
    print("\(count)..")
    count -= 1

}

// Functions

func prinTimesTable(number:Int){
    for i in 1...12{
        print("number \(i)")
    }
    
}
prinTimesTable(number: 8)

// return
func rollDice() -> Int {
//    return Int.random(in: 1...6) - if single line no return is needed
    Int.random(in: 1...6)
}
let result = rollDice()
print(result)


// Returning multiple values from a fucntion
func getUser() -> (firstName:String, lastName: String){
    (firstName:"Aishwarya", lastName: "Raja")
}
let usr = getUser()
print("Name: \(usr.firstName) \(usr.lastName)")

// closure - chunk of code which can be called anytime

let team = ["floria", "andria", "Suzan","maria","mathew"]

let captainFirstTeam = team.sorted{ name1 , name2 in // here in keyword marks the end of the segement with our parameters and return type after that everything is main body of the closure - the actual code
    if name1 == "Suzan"{
        return true
    }
    else if name2 == "Suzan" {
        
        return false
    }
    
    return name1<name2
    
}
print(captainFirstTeam)



