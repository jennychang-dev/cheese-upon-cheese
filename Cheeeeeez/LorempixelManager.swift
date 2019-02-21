import Foundation
import UIKit

class LorempixelManager {
    
    static var photoImage: UIImage!
    
    static func generateRandomImage(completion: @escaping (_ image: UIImage) -> Void) {
        
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
            
            if let data = responseData {
                
                photoImage = UIImage(data: data)
            }
            
            DispatchQueue.main.async {
                completion(photoImage)
                }
            
        }
        task.resume()
        
    }
    
}
