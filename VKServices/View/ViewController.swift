//
//  ViewController.swift
//  VKServices
//
//  Created by gleba on 14.07.2022.
//

import UIKit

class ViewController: UIViewController {
    let dataManager = DataManager()
    var services = [Services]()
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: WRITE DATA FROM API TO "SERVICES"
        dataManager.getData(completition: { servicesData in
            self.services = self.dataManager.transitFromCodable(servicesData: servicesData)
            self.tableView.reloadData()
        })
    }


}

extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return services.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "serviceCell") as! ServiceTableViewCell
        cell.selectionStyle = .none
        cell.nameLabel.text = services[indexPath.row].name
        cell.descriptionLabel.text = services[indexPath.row].serviceDescription
        dataManager.getImage(url: services[indexPath.row].iconURL ?? "", completition: { image in
            cell.serviceIconView.image = image
            cell.activityIndicator.stopAnimating()
            cell.activityIndicator.isHidden = true
        })
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = services[indexPath.row]
        dataManager.openApp(appName: item.name ?? "", link: item.link ?? "vk.com")
    }
    
    
}
