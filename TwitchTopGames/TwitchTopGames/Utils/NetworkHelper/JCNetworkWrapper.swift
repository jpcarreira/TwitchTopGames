//
//  JCNetworkWrapper.swift
//
//  Created by João Carreira on 24/01/16.
//  Copyright © 2016 jpcarreira. All rights reserved.
//

import Foundation

struct JCNetworkWrapper {

    static func get(_ fromUrl: URL, headers: Dictionary<String, String>?, parameters: Dictionary<String, String>?, completionHandler: @escaping (AnyObject?, JCNetworkError?) -> Void) {

        let sessionConfiguration = URLSessionConfiguration.default

        if let getHeaders = headers {

            sessionConfiguration.httpAdditionalHeaders = getHeaders
        }

        let session = URLSession(configuration: sessionConfiguration)
        
        let dataTask = session.dataTask(with: fromUrl, completionHandler: { (data, response, error) in

            if error == nil {

                if let httpResponse = response as? HTTPURLResponse {

                    if httpResponse.statusCode == 200 {

                        if let jsonData = data {

                            do {

                                let unserializedJson = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers)

                                if let parsedJsonDictionary = unserializedJson as? [String: AnyObject] {

                                    completionHandler(parsedJsonDictionary as AnyObject?, nil)
                                    
                                } else if let parsedJsonArray = unserializedJson as? Array<AnyObject> {

                                    completionHandler(parsedJsonArray as AnyObject?, nil)
                                }
                                
                            } catch let error as NSError {

                                completionHandler(nil, JCNetworkError(errorCode: JCNetworkErrorCode.other.rawValue, errorDetails: error.userInfo as Dictionary<NSObject, AnyObject>?))
                            }
                        }
                        
                    } else {
                        
                        completionHandler(nil, JCNetworkError(errorCode: httpResponse.statusCode, errorDetails: nil))
                    }
                }
                
            } else {

                completionHandler(nil, JCNetworkError(errorCode: JCNetworkErrorCode.noResponse.rawValue, errorDetails: error?._userInfo as! Dictionary<NSObject, AnyObject>?))
            }
        }) 

        dataTask.resume()
    }

    static func post(_ toUrl: URL, headers: Dictionary<String, String>?, formData: Dictionary<String, String>?, completionHandler: @escaping (NSDictionary?, JCNetworkError?) -> Void) {

        JCNetworkWrapper.performHttpMethod("POST", url: toUrl, headers: headers, formData: formData, completionHandler: completionHandler)
    }

    static func put(_ toUrl: URL, headers: Dictionary<String, String>?, formData: Dictionary<String, String>?, completionHandler: @escaping (NSDictionary?, JCNetworkError?) -> Void) {

        JCNetworkWrapper.performHttpMethod("PUT", url: toUrl, headers: headers, formData: formData, completionHandler: completionHandler)
    }

    static func delete(_ url: URL, headers: Dictionary<String, String>?, formData: Dictionary<String, String>?, completionHandler: @escaping (NSDictionary?, JCNetworkError?) -> Void) {

        JCNetworkWrapper.performHttpMethod("DELETE", url: url, headers: headers, formData: formData, completionHandler: completionHandler)
    }

    fileprivate static func performHttpMethod(_ httpMethod: String, url: URL, headers: Dictionary<String, String>?, formData: Dictionary<String, String>?, completionHandler: @escaping (NSDictionary?, JCNetworkError?) -> Void) {

        let request = NSMutableURLRequest(url: url)
        request.httpMethod = httpMethod

        if let postHeaders = headers {

            for (key, value) in postHeaders {

                request.addValue(value, forHTTPHeaderField: key)
            }
        }

        if let parameters = formData {

            var jsonString: String = ""
            for (key, value) in parameters {

                jsonString += key + "=" + value + "&"
            }

            let bodyString = jsonString.substring(to: jsonString.characters.index(before: jsonString.endIndex))
            request.httpBody = (bodyString as NSString).data(using: String.Encoding.utf8.rawValue)
        }

        let task = URLSession.shared.dataTask(with: request as URLRequest) {data, response, error in

            if error == nil {

                if let httpResponse = response as? HTTPURLResponse {

                    if httpResponse.statusCode == 200 || httpResponse.statusCode == 201 {

                        if let jsonData = data {

                            do {

                                let jsonDictionary = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers)

                                if let parsedJsonDictionary = jsonDictionary as? [String: AnyObject] {

                                    completionHandler(parsedJsonDictionary as NSDictionary?, nil)
                                }
                                
                            } catch let error as NSError {

                                completionHandler(nil, JCNetworkError(errorCode: JCNetworkErrorCode.other.rawValue, errorDetails: error.userInfo as Dictionary<NSObject, AnyObject>?))
                            }
                        }
                        
                    } else if httpResponse.statusCode == 204 {

                        completionHandler(Dictionary<String, String>() as NSDictionary?, nil)

                    } else {
                        
                        completionHandler(nil, JCNetworkError(errorCode: httpResponse.statusCode, errorDetails: nil))
                    }
                }
                
            } else {
                
                completionHandler(nil, JCNetworkError(errorCode: JCNetworkErrorCode.noResponse.rawValue, errorDetails: error?._userInfo as! Dictionary<NSObject, AnyObject>?))
            }
        }

        task.resume()
    }
}
