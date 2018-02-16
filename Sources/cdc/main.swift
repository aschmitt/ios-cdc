import Foundation
import SwiftyRequest

class MyApi {
//   var request: RestRequest?
   
   init() {
      print("Init")    
   }
/*
    func call() -> Bool {
       print("call")
       self.request = RestRequest(method: .get, url: "https://www.test.de")
       self.request.responseString() { response in
          switch response.result {
          case .success(let result):
             print(result)
          case .failure(let error):
             print(error)
          }
       }

       if let data = request.messageBody {
          print(data)
          return true
       }
       print("No Data")
       return false
    }
*/
    func syncCall() {
           let url = URL(string: "https://www.test.de")
           let request = URLRequest(url: url!)
       
           let sessionConfiguration = URLSessionConfiguration.default;
            let urlSession = URLSession(
                configuration:sessionConfiguration, delegate: nil, delegateQueue: nil)
           let task = urlSession.dataTask(with: request) { data, response, error in
               print("Zsolt say connection succesful")
               guard let data = data, error == nil else { return }
               print(NSString(data: data, encoding: String.Encoding.utf8.rawValue) ?? "N/A")
           }
           task.resume()
let _ = readLine(strippingNewline: true)
    }

}

print("start")
//let result = MyApi().call()
let result = MyApi().syncCall()
