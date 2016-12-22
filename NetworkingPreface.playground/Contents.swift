import Foundation

if let url = URL(string: "www.google.com") {
    let session = URLSession.shared

    let task = session.dataTask(with: url) { (optionalData, optionalResponse, optionalError) in
        if let data = optionalData,
            let string = String(data: data, encoding: .utf8) {
            print(string)
        } else {
            print("response: \(optionalResponse)")
            print("error: \(optionalError)")
        }
    }

    task.resume()


} else {
    print("why couldn't we create the URL?")
}
