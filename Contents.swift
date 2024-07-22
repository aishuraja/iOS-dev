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

let mONLY = team.filter{$0.hasPrefix("m")}
print(mONLY)


let luckyNumbers = [7,4,38,21,16,15,12,33,31,49]

var evenNumbers = [Int]()
for i in luckyNumbers{
    if i/2 == 0{
        evenNumbers.append(i)
        
        
        
        
    }
    let SortedNumbers = luckyNumbers.sorted { sname1 , sname2 in
        
        
                                        
        
        
        
        
    }
        
        
    }
