//
//  ViewController.swift
//  Automatic SizingCell
//
//  Created by Mohamed El Hanafi on 05/03/2018.
//  Copyright © 2018 Mintit. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var data:[GOT]! = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        getChannelsFromJSON()
        tableView.register(UINib(nibName: "TableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "cell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.estimatedRowHeight = 100
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        let got = data[indexPath.row]
        cell.updateCellWithData(name: got.name, description: got.description, variable: got.variable)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        performSegue(withIdentifier: "CollectionView", sender: cell)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier ==  "CollectionView" {
            let vc = segue.destination as! CollectionViewController
            vc.data = self.data
        }
     }

    func getChannelsFromJSON() {
        if let path = Bundle.main.path(forResource: "channels", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                
                if let j: [AnyObject]? = jsonResult as! [AnyObject] {
                    for x in j! {
                        let name = x["name"] as! String
                        let description = x["description"] as! String
                        
                        let variable : String!
                        if let btDesc = x["variable"] as! String! {
                            variable = btDesc
                        }else{
                            variable = nil
                        }
                        let got = GOT(name: name, description: description, variable: variable)
                        self.data.append(got)
                        self.tableView.reloadData()
                    }
                }
            } catch let error{
                print(error.localizedDescription)
                
            }
        }
    }
}

