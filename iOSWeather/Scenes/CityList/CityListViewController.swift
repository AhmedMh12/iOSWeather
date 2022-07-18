//
//  CityListViewController.swift
//  iOSWeather
//
//  Created by Ahmed Mahouchi on 18/7/2022.
//

import UIKit

class CityListViewController: UIViewController {
       @IBOutlet weak var tableView: UITableView!
       @IBOutlet weak var btnSearch: UIButton!
       @IBOutlet weak var txtSearch: UITextField!
       @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
       
       let viewModel = CityListViewModel()
       
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
   private extension CityListViewController {
       
       func setupVC() {
           tableView.dataSource = self
           title = "Add new city"
           tableView.register(UINib.init(nibName: "CityTableViewCell", bundle: nil), forCellReuseIdentifier: "CityTableViewCell")

           setupBindings()
       }
       
       func setupBindings() {
           tableView.bindTo(viewModel.results)
           btnSearch.bindTo(viewModel.isButtonEnabled)
           activityIndicator.bindTo(viewModel.isLoadingEnabled)
          
       }
   }

   // MARK: - UITableViewDataSource
   extension CityListViewController: UITableViewDataSource {
       
       func tableView(_ tableView: UITableView,
                      numberOfRowsInSection section: Int) -> Int {
           viewModel.results.value.count
       }
       
       func tableView(_ tableView: UITableView,
                      cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let itm = viewModel.getSearchResultVM(at: indexPath.row)
           
           let cell = tableView.dequeueReusableCell(withIdentifier: "CityTableViewCell", for: indexPath) as! CityTableViewCell

           cell.cityName.text = itm.trackName
          
           
           return cell
       }
   }
