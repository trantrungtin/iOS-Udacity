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