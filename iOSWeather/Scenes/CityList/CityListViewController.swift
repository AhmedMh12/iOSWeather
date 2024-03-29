//
//  CityListViewController.swift
//  iOSWeather
//
//  Created by Ahmed Mahouchi on 18/7/2022.
//

import UIKit

class CityListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let viewModel = CityListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
        viewModel.getMyCityWeather()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
}

// MARK: - Private
private extension CityListViewController {
    
    func setupVC() {
        title = "Weather"
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib.init(nibName: "CityTableViewCell", bundle: nil), forCellReuseIdentifier: "CityTableViewCell")
        tableView.separatorColor = .clear
        let addCityBarButtonItem = UIBarButtonItem(title: "Add City", style: .done, target: self, action: #selector(addNewCity))
        self.navigationItem.rightBarButtonItem  = addCityBarButtonItem
        
        setupBindings()
    }
    
    func setupBindings() {
        tableView.bindTo(viewModel.AddedCites)
        
    }
    @objc func addNewCity(){
        let CityAddVc = SearchForCityViewController(nibName: "SearchForCityViewController", bundle: nil)
        self.navigationController!.pushViewController(CityAddVc, animated: true)
    }
}

// MARK: - UITableViewDataSource
extension CityListViewController: UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.AddedCites.value.count
        
        
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let itm = viewModel.getCity(at: indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityTableViewCell", for: indexPath) as! CityTableViewCell
        cell.cityName.text = itm.trackName
        cell.imgBg.layer.cornerRadius = 10
        cell.imgBg.clipsToBounds = true
        if itm.searchResult.weather?.first?.main == "Clear" && itm.searchResult.clouds?.all == 0 {
            cell.imgBg.image = UIImage(named: "sunnyCell")
        }
        else if itm.searchResult.weather?.first?.main == "Clouds" &&  itm.searchResult.clouds?.all ?? 0 > 0 {
            cell.imgBg.image = UIImage(named: "rainCloudsCell")
        }
        else if itm.searchResult.weather?.first?.main == "Rain" &&  itm.searchResult.clouds?.all ?? 0 > 0 {
            cell.imgBg.image = UIImage(named: "rainCloudsCell")
        }
        else {
            cell.imgBg.image = UIImage(named: "sunnyCell")
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let CityWeatherVc = CityWeatherViewController(nibName: "CityWeatherViewController", bundle: nil)
        CityWeatherVc.viewModel.weather = viewModel.AddedCites.value[indexPath.row]
        self.navigationController!.pushViewController(CityWeatherVc, animated: true)
        
        
        
    }
    
}
