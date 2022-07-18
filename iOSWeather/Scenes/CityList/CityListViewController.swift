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
       @IBOutlet weak var namesTableView: UITableView!
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
           namesTableView.isHidden = false
           viewModel.performSearch()
       }
   }

   // MARK: - Private
   private extension CityListViewController {
       
       func setupVC() {
           namesTableView.dataSource = self
           namesTableView.delegate = self
           title = "Add new city"
           namesTableView.register(UINib.init(nibName: "CityTableViewCell", bundle: nil), forCellReuseIdentifier: "CityTableViewCell")
           tableView.dataSource = self
           tableView.delegate = self
           tableView.register(UINib.init(nibName: "CityTableViewCell", bundle: nil), forCellReuseIdentifier: "CityTableViewCell")


           setupBindings()
       }
       
       func setupBindings() {
           namesTableView.bindTo(viewModel.results)
           tableView.bindTo(viewModel.AddedCites)
           btnSearch.bindTo(viewModel.isButtonEnabled)
           activityIndicator.bindTo(viewModel.isLoadingEnabled)
          
       }
   }

   // MARK: - UITableViewDataSource
   extension CityListViewController: UITableViewDataSource,UITableViewDelegate {
       
       func tableView(_ tableView: UITableView,
                      numberOfRowsInSection section: Int) -> Int {
           if tableView == namesTableView {
               if viewModel.results.value.count == 0 {
                   namesTableView.isHidden = true
               }
             return viewModel.results.value.count
           }
           else {
             return viewModel.AddedCites.value.count
           }
           
       }
       
       func tableView(_ tableView: UITableView,
                      cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           if tableView == namesTableView {
               let itm = viewModel.getSearchResultVM(at: indexPath.row)
               
               let cell = tableView.dequeueReusableCell(withIdentifier: "CityTableViewCell", for: indexPath) as! CityTableViewCell

               cell.cityName.text = itm.trackName
               return cell
           }
          
            let itm = viewModel.getCity(at: indexPath.row)
            let cell = tableView.dequeueReusableCell(withIdentifier: "CityTableViewCell", for: indexPath) as! CityTableViewCell
            cell.cityName.text = itm.trackName
            return cell
       }
       
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           if tableView == namesTableView {
               let value = viewModel.results.value[indexPath.row]
               viewModel.addCity(weather: value)
               self.namesTableView.isHidden = true
           }
           
       }
       
   }
