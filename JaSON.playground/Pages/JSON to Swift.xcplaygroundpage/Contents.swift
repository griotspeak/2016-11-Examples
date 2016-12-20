import Foundation

let string = "{\"name\":\"TJ\",\"power-level\":9001,\"occupation\":\"Mic Magician\",\"students\":[\"Adrian\",\"Amy\",\"Jon\"]}"
let jsonData = string.data(using: .utf8)!
let jsonObject = try! JSONSerialization.jsonObject(with: jsonData, options: []) as! [String:Any]

print(jsonObject)