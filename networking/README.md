## Networking Terms
* Data: (Usually in the raw form) anything that is sent over the network.
* Client:
* Server:
* HTTP: Hypertext Transfer Protocol
* HTTPS: HTTP Secure,

## Requests and Responses
A HTTP response consists of a body and a status code.

* Body: Content of a response (such as the HTML that makes up a webpage
* Status code: 3 digit number signaling the type of response (success, failure, etc.)


## Status code

| **Status Code** | **Short Description** | **Category** |
|-----------------|-----------------------|--------------|
| 100             | Continue              | Information  |
| 200             | OK                    | Success      |
| 301             | Moved Permanently     | Redirection  |
| 403             | Forbidden             | Client Error |
| 404             | Not Found             | Client Error |
| 418             | I'm a teapot          | Client Error |
| 500             | Internal Server Error | Server Error |

## HTTP Verbs

| **Verb** | **CRUD Operation** |
|----------|--------------------|
| GET      | Read               |
| POST     | Create             |
| PUT      | Update (replace)   |
| PATCH    | Update (modify)    |
| DELETE   | Delete             |

### Swift URL

```swift
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
// but that won't work with queries and fragments
simpleURL?.appendPathComponent("?mt=8")
print("simpleURL: \(simpleURL!)" ) // https://itunes.apple.com/us/app/udacity/id819700933/%3Fmt=8

```

## URL Components

```swift
var udacityAppURL = URLComponents()
udacityAppURL.scheme = "https"
udacityAppURL.host = "itunes.apple.com"
udacityAppURL.path = "/us/app/udacity/id819700933"
udacityAppURL.queryItems = [URLQueryItem(name: "mt", value: "8")]
print(udacityAppURL) // https://itunes.apple.com/us/app/udacity/id819700933?mt=8
```

## URLSession and Data Tasks

URLSession: An object that coordinates a group of related network data transfer tasks.

"Tasks" are what URLSession calls network requests.

* **URLSessionDataTask**: Used for perfuming an HTTP request (GET, POST, etc.). (stored in memory)
* **URLSessionDownloadTask**: Downloading a file from a server.
* **URLSessionUploadTask**: Uploading a file to a server
* **URLSessionStreamTask**: Getting a continuous stream of data from a server.

Documents:
1. https://developer.apple.com/documentation/foundation/urlsessiondatatask
2. https://developer.apple.com/documentation/foundation/urlsessiontask

*After you create a task, you start it by calling its resume() method. The session then maintains a strong reference to the task until the request finishes or fails; you don’t need to maintain a reference to the task unless it’s useful for your app’s internal bookkeeping.*

## App Transport Security
Error message: *App Transport Security has blocked a cleartext HTTP connection since it is insecure. Use HTTPS instead or add Exception Domains to your app's Info.plist.*

Documents: https://developer.apple.com/library/archive/documentation/General/Reference/InfoPlistKeyReference/Articles/CocoaKeys.html#//apple_ref/doc/uid/TP40009251-SW60

*NSExceptionAllowsInsecureHTTPLoads*: When set to YES, allows you to make insecure connections (e.g to an HTTP server, or to an untrusted HTTPS server) for a domain whose security attributes you ***do*** control.

*NSThirdPartyExceptionAllowsInsecureHTTPLoads*: When set to YES, allows you to make insecure connections (e.g to an HTTP server, or to an untrusted HTTPS server) for a domain whose security attributes you don't control

## JSON
Javascript Object Notation: a data format often used to send data to and from web services.

### JSON Values and Their Corresponding Swift Types
| JSON Values                                   | Swift Type                             |
|-----------------------------------------------|----------------------------------------|
| Anything contained in braces, `{ ... }`           | struct (usually), class, or dictionary |
| Anything contained in brackets `[ ... ]`          | `Array`                                |
| Anything contained in quotes `" ... "`            | `String`                               |
| Any whole number, e.g. `10`                     | `Int`                                   |
| Anything with a decimal, e.g. `25.2`           | `Float` or `Double`                        |
| A boolean (without quotes), `true` or `false` | `Bool`                                   |

[JSONSerialization](https://developer.apple.com/documentation/foundation/jsonserialization): converts JSON data to and from Swift dictionaries
```swift
let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
let url = json["message"] as! String
```

Codable: a protocol used to convert data, like JSON, to and from Swift types
* Encodable: from Swift object to JSON
* Decodable: from JSON to Swift object

```swift
struct DogImage: Codable {
    let status: String
    let message: String
}

let decoder = JSONDecoder()
let imageData = try! decoder.decode(DogImage.self, from: data)
let url = imageData.message
```

## Escaping vs. Non-escaping
```swift
func dataTask(with url: URL, 
completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
    // ...
}
```
To understand the meaning of @escaping you need to know two terms: *synchronous* and *asynchronous*.
* A task is is synchronous if each line of code waits for the previous line of code to finish.
* Something is asynchronous if two tasks run independently from one another. In other words, one task doesn't need the other task to finish in order to execute. Each function calls dataTask() which means each image is downloaded on its own thread. Even though the functions are called in order, the threads run independently of one another, and we can't guarantee when each dataTask is finished. 

In general, if you need to do something asynchronous like making a network request, then you'll need to mark it with @escaping.

## Coding Keys
```swift
var json = """
{
    "food_name": "Lemon",
    "taste": "sour",
    "number of calories": 17
}
""".data(using: .utf8)!

struct Food: Codable {
    let name: String
    let taste: String
    let calories: Int
    
    // add CodingKeys enum here
    enum CodingKeys: String, CodingKey {
        case name = "food_name"
        case taste
        case calories = "number of calories"   
    }
}
```

## JSON Arrays
```swift
var json = """
[
    {
        "title": "Groundhog Day",
        "released": 1993,
        "starring": ["Bill Murray", "Andie MacDowell", "Chris Elliot"]
    },
    {
        "title": "Home Alone",
        "released": 1990,
        "starring": ["Macaulay Culkin", "Joe Pesci", "Daniel Stern", "John Heard", "Catherine O'Hara"]
    }
]
""".data(using: .utf8)!

struct Movie: Codable {
    let title: String
    let released: Int
    let starring: [String]
}

let decoder = JSONDecoder()
var comedies: [Movie]

comedies = try decoder.decode([Movie].self, from: json)
```

## Nested JSON
```swift
var json = """
{
    "name": "Neha",
    "studentId": 326156,
    "academics": {
        "field": "iOS",
        "grade": "A"
    }
}
""".data(using: .utf8)!

struct Academics: Codable {
    let field: String
    let grade: String
}

struct Student: Codable {
    let name: String
    let studentId: Int
    let academics: Academics
}
```

## API Key
Unique identifier for requests sent from an app

Benefits:
* Hosting costs
* Rate limiting
* Better service