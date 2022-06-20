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