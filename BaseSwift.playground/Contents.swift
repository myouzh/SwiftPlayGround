import UIKit
var helloStr = "Hello, swift playground"

/*/* --基础部分-- */*/
// 常量和变量
let maxWidth = 100
var wid = 10
// 定义多个变量和指定类型
var width = 30, height = 10, length:Double = 20.0
width = 20
// 类型转换
let twoThousand:UInt16 = 2_000
let one:UInt8 = 1
let twoThAndOne = twoThousand + UInt16(one)
// 类型别名
typealias AudioSample = Int16
var minVaule = AudioSample.min //类型最小值
// 元组
let httpError = (404,"Not Found")
let (code, msg) = httpError //访问元组内容
print("httpError:code:\(code),msg:\(msg)")
let (theCode, _) = httpError //只获取元组code内容
print("The code :\(httpError.0), The msg:\(httpError.1)") //通过下标访问
let http200Status = (statusCode:200,msg:"ok") //给元组元素命名
print("The code :\(http200Status.statusCode), The msg:\(http200Status.msg)")

// 可选类型
/* 可选类型表示两种可能： 或者有值， 你可以解析可选类型访问这个值， 或者根本没有值。
   类型后面带?表示, eg. Int?  String?
 */
let possibleNum = "afds"
let convertedNum = Int(possibleNum) //convertedNum的类型是Int?

var responseCode:Int? = 404
responseCode = nil //responseCode可以是空值

// 可选绑定
/*如果convertedNum有值,则把值赋值给actualNum,同时convertedNum可以被强制解析*/
if let actualNum = convertedNum {
    print("actualNum is \(actualNum) or \(convertedNum!)")
} else {
    print("actualNum is no value")
}

// 错误处理 ⚠️
func canThrowAnError() throws {
    print("出错了")
}
do {
    try canThrowAnError()
    // 没有错误消息抛出
} catch {
    // 有错误消息抛出进行处理
}

// 断言
let age = 3
assert(age > 0, "A person's age cannot be less than zero") //age如果小于0触发断言


/*/* --基础部分-- */*/

// 赋值运算符
let (x, y) = (3, 4)
//if x = y {
//    print("判断条件有误,swift中 x = y 并不返回任何值")
//}
// 数字运算符
let strA = "hello"
let strB = "world"
let strC =  strA + strB
// 比较运算符
if strA == "hello" {
   print("strA is hello")
}
(3, "apple") < (3, "bird") // true，因为 3 等于 3，但是 apple 小于 bird
// ("blue", false) < ("purple", true) // 错误，因为 < 不能比较布尔类型

// 空合运算符
/*(a ?? b) 将对可选类型 a 进行空判断，如果 a 包含一个值就进行解包，否则就返回一个默认值 b。
 表达式 a 必须是 Optional 类型。默认值 b 的类型必须要和 a 存储值的类型保持一致。*/
let a: Int? = nil
let b = a ?? 3  // a是空值, b取3

let defaultColorName = "red"
var userDefinedColorName: String?   //默认值为 nil
var colorNameToUse = userDefinedColorName ?? defaultColorName
// 区间运算符
/*区间运算符（a...b）定义一个包含从 a 到 b（包括 a 和 b）的所有值的区间。*/
for index in 1...5 {
    print("\(index) * 5 = \(index * 5)")
}
// 半开区间运算符
/*半开区间运算符（a..<b）定义一个从 a 到 b 但不包括 b 的区间。*/
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("第 \(i + 1) 个人叫 \(names[i])")
}
// 单侧区间
for name in names[2...] {
    print(name)
    // Brian
    // Jack
}
for name in names[..<2] {
    print(name)
    // Anna
    // Alex
}

// 逻辑运算符组合计算
/*Swift 逻辑操作符
 && 和 || 是左结合的，这意味着拥有多元逻辑操作符的复合表达式优先计算最左边的子表达式。*/


/*/* --字符串字面量-- */*/

// 多行字符串字面量 开启和关闭引号（"""）
let quotation = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," \n the King said gravely, "and go on
till you come to the end; then stop."
"""
print(quotation)

let sparklingHeart = "\u{1F496}"

var emptyString = ""               // 空字符串字面量
var anotherEmptyString = String()  // 初始化方法
// 两个字符串均为空并等价。
// 字符
for character in "Dog!🐶" {
    print(character)
}
let catChars: [Character] = ["C", "a", "t", "!", "🐱"]
let catStr = String(catChars)
print(catChars, catStr)

// 访问和修改字符串
/*每一个 String 值都有一个关联的索引（index）类型，String.Index，它对应着字符串中的每一个 Character 的位置。*/
let greeting = "Guten tag!"
greeting[greeting.startIndex] //G
greeting[greeting.index(before: greeting.endIndex)] //!
greeting[greeting.index(after: greeting.startIndex)] //u
let index = greeting.index(greeting.startIndex, offsetBy: 1) //
greeting[index]//u
for index in greeting.indices {
    print("\(greeting[index])", terminator:"")
}
// 插入和删除
var welcome = "hello"
welcome.insert("!", at: welcome.endIndex) // hello!
welcome.insert(contentsOf: " there", at: welcome.index(before: welcome.endIndex)) // hello there!
welcome.remove(at: welcome.index(before: welcome.endIndex)) //hello there
print(welcome)
let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex //-6到最后一个
welcome.removeSubrange(range)


/*/* --集合类型-- */*/

// 数组
var threeNums = Array(repeating: 0.1, count: 3) //[0.1,0.1,0.1]
var otherThreeNums = Array(repeating: 3.1, count: 3)
var sixNums = threeNums + otherThreeNums  //同类型可相加 [0.1, 0.1, 0.1, 3.1, 3.1, 3.1]
var shoppingList:[String] = ["Eggs","Milk"] //字面量构造
var shoppins:[Any] = ["Eggs",123,shoppingList] //不同的元素
print(shoppins)
shoppingList.append("Flour")
shoppingList += ["Cheese","Butter"]
print(shoppingList)
shoppingList[3..<shoppingList.count] = ["Apples"] //第四个到最后被Apples替换
print(shoppingList)
shoppingList.insert("Maple Syrup", at: 0)
// 数组的遍历
for item in shoppingList {
    print(item,terminator:" ")
}
// 索引遍历
for (index, value) in shoppingList.enumerated() {
    print("\nItem \(index+1): \(value)")
}
// 集合
/*Swift 中的集合类型被写为 Set<Element>，这里的 Element 表示集合中允许存储的类型。和数组不同的是，集合没有等价的简化形式。*/
var letters = Set<Character>()
letters.insert("a")
letters = [] // letters 现在是一个空的 Set，但是它依然是 Set<Character> 类型
var favoriteGenres: Set<String> = ["Rock","Classical","Hip hop"]
print(favoriteGenres)
favoriteGenres.insert("Jazz")
if let removedGenre = favoriteGenres.remove("Rock") {
     // removedGenre 有值说明删除成功
     print("\(removedGenre)? I'm over it.")
} else {
      print("I never much cared for that.")
}
for genre in favoriteGenres {
    print(genre)
}
for genre in favoriteGenres.sorted() { //按Set顺序打印
    print(genre)
}
// 集合操作
/*
 使用 intersection(_:) 方法根据两个集合的交集创建一个新的集合。交集a&b
 使用 symmetricDifference(_:) 方法根据两个集合不相交的值创建一个新的集合。不同集!(a&b)
 使用 union(_:) 方法根据两个集合的所有值创建一个新的集合。 合集a||b
 使用 subtracting(_:) 方法根据不在另一个集合中的值创建一个新的集合。 差集a-b
 */

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]
houseAnimals.isSubset(of: farmAnimals)
// true 是否是他的子集
farmAnimals.isSuperset(of: houseAnimals)
// true  是否是他的父集
farmAnimals.isDisjoint(with: cityAnimals)
// true  是否和他没有交集

// 字典
var namesOfIntegers = [Int: String]()
namesOfIntegers[16] = "sixteen"
namesOfIntegers = [:] // namesOfIntegers 又成为了一个 [Int: String] 类型的空字典
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
if let oldValue = airports.updateValue("DUB Airports", forKey: "DUB") {
    print("The old value for DUB is \(oldValue)")
}
if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary does not contain a value for DUB.")
}


/*/* --控制流-- */*/

// for
let minutes = 60
for tickMark in 0..<minutes {
    tickMark //每一分钟60次 从0到59
}

let minuteInterval = 5
for tickMark in stride(from: 0, to: minutes, by: minuteInterval) { // minuteInterval为步长
    tickMark // 每5分钟渲染一个刻度线(0,5,10,15...45,50,55)
}
let hours = 12
let hourInterval = 3
for tickMark in stride(from: 3, through: hours, by: hourInterval) {
    tickMark // 每3小时渲染一个刻度线（3, 6, 9, 12）
}

// while
var w_index = 0

while w_index < 10 { //先判断条件,再执行
    w_index += 1  //0...9
}

repeat { //先执行,再判断条件
    w_index += 1 // 11
} while w_index < 10

// switch
let aCharacter:Character = "a"
switch aCharacter {
case "a", "A":
    print("The letter A")
case "X":
    fallthrough //贯穿下面的
default:
    print("Not the letter A")
}

let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("原点")
case (_, 0):
    print("X 轴")
case (0, _):
    print("Y 轴")
case (-2...2,-2...2):
    print("-2到2的一个正方形区域")
default:
    print("那个正方形区域外")
}
// switch值绑定
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):  //把第一个的值给X
    print("on the x-axis with an x value of \(x)")
case (0, let y):  //把第二个的值给y
    print("on the y-axis with a y value of \(y)")
case let (x, y):  //都赋值
    print("somewhere else at (\(x), \(y))")
}

// Where [case 分支的模式可以使用 where 语句来判断额外的条件。]
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case (_, _):
    print("兜底")
}

// guard
func greet(person: [String: String]) {
    guard let name = person["name"] else { //一个 guard 语句总是有一个 else 从句，如果条件不为真则执行 else 从句中的代码。
        return
    }
    print("hello \(name)!")
}

// 检测API可用
if #available(iOS 10, macOS 10.12, *) {
    
} else {
    
}


/*/* --函数-- */*/
// 忽略参数标签
///如果你不希望为某个参数添加一个标签，可以使用一个下划线（_）来代替一个明确的参数标签。
func someFunction(_ firstParamName:Int, secondParamName:Int) {
    
}
someFunction(1, secondParamName: 2) //就没有参数名

// 默认参数值
func someDefalutFunction(paramName:Int, paramWithDefalut:Int = 12) {
    // 如果第二个参数不传，则默认是12
}
someDefalutFunction(paramName: 1) //默认第二个参数12
someDefalutFunction(paramName: 1, paramWithDefalut: 2)

// 可变参数
func averageNums(_ numbers:Double...) -> Double {
    var total:Double = 0
    for number in numbers {
        total += number
    }
    return total/Double(numbers.count)
}
let ave1 = averageNums(1, 2, 3, 4, 5)
let ave2 = averageNums(3, 8.25, 18.75)

// 输入输出参数
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    a = a + b
    b = a - b
    a = a - b
}
var someInt = 3
var anotherInt = 108
swap(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

// 函数类型
func addTwoInts(_ a:Int, _ b:Int) -> Int {
    return a + b
}

func multiply(_ a: Int, _ b: Int) -> Int {
    return a * b
}

var mathFunction: (Int, Int) -> Int = addTwoInts

func printMathResult(_ mathFunction:(Int, Int) -> Int, _ a:Int, _ b:Int) {
    print("Result: \(mathFunction(a, b))")
}

printMathResult(addTwoInts, 3, 5) //8
printMathResult(multiply, 3, 5) //15
