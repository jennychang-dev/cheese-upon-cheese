import Foundation

class ForasmaticManager {
    
    static var quoteText: String = ""
    static var quoteAuthor: String = ""
    
    static func generateCheesyQuote() {
        
        let quoteURLStr = "http://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=json"
        let url = URL(string: quoteURLStr)
        
        guard let quoteURL = url else {
            fatalError("can't generate url")
        }
        
        var request = URLRequest(url: quoteURL)
        request.httpMethod = "GET"
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request) { (responseData, response, responseError) in
            guard responseError == nil else {
                print("\(String(describing: responseError))")
                return
            }
            
            if let data = responseData, let utf8Representation = String(data: data, encoding: .utf8) {
                
                print("response: ", utf8Representation)
                
                guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as! [String: Any] else {
                    print("data returned is not json")
                    return
                }
                
                guard let quote = json["quoteText"] else {
                    fatalError("cannot retrieve quote")
                }
                
                guard let author = json["quoteAuthor"] else {
                    fatalError("cannot retrieve author")
                }
                
                
                self.quoteText = quote as? String ?? ""
                self.quoteAuthor = author as? String ?? ""
                
                print(self.quoteText)
                print(self.quoteAuthor)
                
            }
        }
        task.resume()
        
}
}
