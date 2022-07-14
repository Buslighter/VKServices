//
//  ViewModel.swift
//  VKServices
//
//  Created by gleba on 14.07.2022.
//

import Foundation
import UIKit

class DataManager{
    //MARK: GET DATA FROM API
    func getData(completition: @escaping(Answer) -> Void){
        let url = URL(string: "https://publicstorage.hb.bizmrg.com/sirius/result.json")
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        var results: Answer?
        let task = URLSession.shared.dataTask(with: request){ (data,response,error) in
            if error == nil && data != nil{
                let decoder = JSONDecoder()
                do{
                    let object = try decoder.decode(Answer.self, from: data!)
                    results = object
                } catch{
                    print("Server response error happened : \(error)")
                }
            }
            DispatchQueue.main.async {
                completition(results!)
            }
        }
        task.resume()
    }
    //MARK: REWRITE FROM CODABLE CLASS
    func transitFromCodable(servicesData: Answer) -> [Services]{
        var services = [Services]()
        for i in servicesData.body.services{
            let item = Services()
            item.serviceDescription = i.serviceDescription
            item.iconURL = i.iconURL
            item.link = i.link
            item.name = i.name
            services.append(item)
        }
        return services
    }
    //MARK: GET IMAGE FROM URL
    func getImage(url: String, completition:@escaping(UIImage) -> Void){
        var image = UIImage()
        DispatchQueue.main.async {
            if let url = URL(string: url){
                if let data = try? Data(contentsOf: url){
                    image = UIImage(data: data) ?? UIImage(systemName: "square")!
                }
            }
            completition(image)
        }
        
    }
    //MARK: OPEN APP OR URL IN SAFARI
    func openApp(appName: String, link: String){
        var rightAppName = ""
        if appName == "ВКонтакте"{rightAppName = "VK"}else{rightAppName = appName}
        let appScheme = "\(rightAppName)://app"
        let appUrl = URL(string: appScheme)
        if UIApplication.shared.canOpenURL(appUrl ?? URL(string: "vk.com")! as URL){
            UIApplication.shared.open(appUrl!)
        }else{
            if let url = URL(string: link){
                UIApplication.shared.open(url)
            }
        }
        
    }
    
    
}
