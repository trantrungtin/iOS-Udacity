import Foundation

let urlString = "https://itunes.apple.com/us/app/udacity/id819700933?mt=8"
let url = URL(string: urlString)

if let url = url {
    print("URL: \(url)") // URL: https://itunes.apple.com/us/app/udacity/id819700933?mt=8
    print("scheme:\t\t\(String(reflecting: url.scheme))") // Optional("https")
    print("user:\t\t\(String(reflecting: url.user))") // nil
    print("password:\t\(String(reflecting: url.password))") // nil
    print("host:\t\t\(String(reflecting: url.host))") // Optional("itunes.apple.com")
    print("port:\t\t\(String(reflecting: url.port))") // nil
    print("path:\t\t\(String(reflecting: url.path))") // "/us/app/udacity/id819700933"
    print("query:\t\t\(String(reflecting: url.query))") // Optional("mt=8")
    print("fragment:\t\(String(reflecting: url.fragment))") // nil
}

var iTunesBaseURLString = "https://itunes.apple.com/"
var simpleURL = URL(string: iTunesBaseURLString)
simpleURL?.appendPathComponent("us")
print("simpleURL: \(simpleURL!)" ) // https://itunes.apple.com/us
simpleURL?.appendPathComponent("app")
simpleURL?.appendPathComponent("udacity")
simpleURL?.appendPathComponent("id819700933")
print("simpleURL: \(simpleURL!)" ) // https://itunes.apple.com/us/app/udacity/id819700933
simpleURL?.appendPathComponent("?mt=8")
// but that won't work with queries and fragments
print("simpleURL: \(simpleURL!)" ) // https://itunes.apple.com/us/app/udacity/id819700933/%3Fmt=8
