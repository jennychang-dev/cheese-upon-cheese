import Foundation

class LorempixelManager {
    
    static var imageData = Data()
    
    static func generateRandomImage()  {
        
        let imageStr = "http://lorempixel.com/400/200/sports/"
        let imageURL = URL(string: imageStr)
        let sessionTask = URLSession.shared
        
        guard let image = imageURL else {
            fatalError("not a valid url")
        }
        
        let request = URLRequest(url: image)
        let task = sessionTask.dataTask(with: request) {
            (responseData, response, responseError) in
            guard responseError == nil else {
                print("\(String(describing: responseError))")
                return
            }
            
            DispatchQueue.main.async {
                if let data = responseData {
                    self.imageData = data
                    return
                }
            }
            
        }
        task.resume()
        
    }
    
}
