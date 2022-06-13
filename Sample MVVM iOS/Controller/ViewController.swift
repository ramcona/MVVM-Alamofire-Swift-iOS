//
//  ViewController.swift
//  Sample MVVM iOS
//
//  Created by Pak Ahmad on 13/06/22.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Outlet
    @IBOutlet weak var tblData: UITableView!
    
    //MARK: - View Model Injection
    private let viewModel = UniversitasViewModel()
    
    //MARK: - properties data
    private var listUnversitas:[Universitas] = [Universitas]()
    
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadTableView()
        attemptFetchListUniversitas()
        
        //hit to fetch data list universitas
        viewModel.getListUniversitas()
    }
    
    //MARK: - networking
    /*
     method for retrive data from network
     */
    

    private func attemptFetchListUniversitas(){
        
        //#1 receive loading status
        viewModel.statusLoading = {
            self.viewModel.isLoading ? self.showLoading() : self.finishLoading()
        }
        
        
        //#2 show error when have error when fetch data
        viewModel.showErrorMessage = {
            if let errorMsg = self.viewModel.errorMessage {
                print(errorMsg)
            }
        }
        
        //#3 get data from network
        viewModel.didFinish = {
            self.listUnversitas = self.viewModel.responseList
            
            self.loadDataFromNetwork()
        }
    }
    
    
    
    //MARK: - UI
    /*
     all about ui write at bellow
     */
    
    private func showLoading(){
        print("on Loading")
    }
    
    private func finishLoading(){
        print("finish load")
    }
    
    private func loadTableView(){
        tblData.delegate = self
        tblData.dataSource = self
        tblData.separatorStyle = .none
        tblData.register(UINib(nibName: "UniversitasTableViewCell", bundle: nil), forCellReuseIdentifier: "universitas")
    }
    
    private func loadDataFromNetwork(){
        tblData.reloadData()
    }


}

//MARK: - extension for process tableview
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listUnversitas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "universitas") as! UniversitasTableViewCell
        let data = listUnversitas[indexPath.row]
        
        //set data to cell
        cell.setData(data: data)
        
        return cell
    }
    
    
}

