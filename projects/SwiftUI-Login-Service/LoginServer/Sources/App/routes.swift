import Vapor

struct LoginRequest: Content {
    var username: String
    var password: String
}

public func routes(_ router: Router) throws {
    
    /*
     curl -w '\n%{http_code}\n' http://localhost:8080/login -X POST -H "Content-Type: application/json" -d "{\"username\": \"Connected\", \"password\": \"test\"}"
     */
    router.post("login") { req -> Future<HTTPStatus> in
        return try! req.content
            .decode(LoginRequest.self)
            .map(to: HTTPStatus.self) { loginRequest in
                switch (loginRequest.username, loginRequest.password) {
                case ("Connected", "test"): return .ok
                default: return .unauthorized
                }
            }
    }

}
