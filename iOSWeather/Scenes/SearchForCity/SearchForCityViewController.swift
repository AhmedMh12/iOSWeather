//
//  SearchForCityViewController.swift
//  iOSWeather
//
//  Created by Ahmed Mahouchi on 19/7/2022.
//

import UIKit

class SearchForCityViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnSearch: UIButton!
    @IBOutlet weak var txtSearch: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var namesTableView: UITableView!
    let viewModel = SearchForCityViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
    }
    
    // MARK: IBActions
    @IBAction func textFieldEditingChanged(_ sender: UITextField) {
       
    }
    
    @IBAction func searchButtonPressed(_ sender: Any) {
        viewModel.searchText = txtSearch.text
        viewModel.performSearch()
    }
}

// MARK: - Private
private extension SearchForCityViewController {
    
    func setupVC() {
       /* namesTableView.dataSource = self
        namesTableView.delegate = self
        title = "Add new city"
        namesTableView.register(UINib.init(nibName: "CityTableViewCell", bundle: nil), forCellReuseIdentifier: "CityTableViewCell")*/
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib.init(nibName: "CityTableViewCell", bundle: nil), forCellReuseIdentifier: "CityTableViewCell")


        setupBindings()
    }
    
    func setupBindings() {
        tableView.bindTo(viewModel.results)
       // tableView.bindTo(viewModel.AddedCites)
        btnSearch.bindTo(viewModel.isButtonEnabled)
        activityIndicator.bindTo(viewModel.isLoadingEnabled)
       
    }
}

// MARK: - UITableViewDataSource
extension SearchForCityViewController: UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        
          return viewModel.results.value.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let itm = viewModel.getSearchResultVM(at: indexPath.row)
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "CityTableViewCell", for: indexPath) as! CityTableViewCell

            cell.cityName.text = itm.trackName
            return cell
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let CityListVc = CityListViewController(nibName: "CityListViewController", bundle: nil)
            CityListVc.viewModel.AddedCites.value.append( viewModel.results.value[indexPath.row])
            self.navigationController!.pushViewController(CityListVc, animated: true)
    }
    
}
