//
//  ViewController.swift
//  testUpload
//
//  Created by Mohamed Ali on 22/10/2021.
//

import UIKit
import RappleProgressHUD

class EmplyeesViewController: UIViewController {
    
    // MARK:- TODO:- IBOutlets here:-
    @IBOutlet weak var tableView: UITableView!
    
    // MARK:- TODO:- This initialise new varibles here:-
    var Arr = Array<EmpModel>()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ConfigureTableView()
//        GetData()
    }
    
    // MARK:- TODO:- This Method For Upload Data to button Action
    @IBAction func UploadData(_ sender:Any) {
        RappleActivityIndicatorView.startAnimatingWithLabel("Please wait", attributes: RappleAppleAttributes)

        var dict = Array<[String:Any]>()
        
        for i in Arr {
            dict.append(["userName": i.EmpName, "age": i.EmpAge, "email": i.EmpEmail])
        }
        
        print(dict)
        
        let emp = empAPI()
        
        emp.Addemp(value: dict) { response in
            switch response {

            case .success(let success):
                guard let success = success else { return }
                if success.status == 1 {
                    RappleActivityIndicatorView.stopAnimation()
                    print("Add Success")
                }
            case .failure(let error):
                RappleActivityIndicatorView.stopAnimation()
                print(error.userInfo[NSLocalizedDescriptionKey] as? String ?? "")
            }
        }
    }
    // ------------------------------------------------
    
    
    // MARK:- TODO:- This Method For go to add emp Page action
    @IBAction func NextButtonAction (_ sender: Any) {
        let nextVc = self.storyboard?.instantiateViewController(withIdentifier: "AddEmployeeViewController") as! AddEmployeeViewController
        nextVc.delegate = self
        self.present(nextVc, animated: true)
    }
    // ------------------------------------------------
    
    
    // MARK:- TODO:- Regseter tableView.
    func ConfigureTableView() {
        tableView.register(UINib(nibName: "EmpCell", bundle: nil), forCellReuseIdentifier: "Cell")
    }
    // ------------------------------------------------
    
    
    // MARK:- TODO:- This Method For load Data from Array.
    func GetData() {
        let names = ["medo23","medo20"]
        let emails = ["m2@g.com","m3@g.com"]
        let ages = [21,23]
        
        for i in 0..<names.count {
            let n = names[i]
            let e = emails[i]
            let a = ages[i]
            
            let ob = EmpModel(EmpName: n, EmpAge: a, EmpEmail: e)
            Arr.append(ob)
        }
        
        print(Arr[0].EmpName)
    }
    // ------------------------------------------------

}

// MARK:- TODO:- This Method For TableView DataSource
extension EmplyeesViewController: UITableViewDataSource {
    
    // MARK:- TODO:- numbers of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Arr.count
    }
    // ------------------------------------------------
    
    // MARK:- TODO:- cell configure with employee model
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EmpCell
        
        cell.ConfigureCell(Emp: Arr[indexPath.row])
        
        return cell
    }
    // ------------------------------------------------
    
}

// MARK:- TODO:- this section for table view delegate
extension EmplyeesViewController: UITableViewDelegate {
    
    // MARK:- TODO:- this method for set cell hight
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
    }
    // ------------------------------------------------
}

// MARK:- TODO:- This Method for getting data from add employee Data
extension EmplyeesViewController: Employee {
    
    // MARK:- TODO:- Add Data to array and reload tableView.
    func employee(emp: EmpModel) {
        Arr.append(emp)
        tableView.reloadData()
    }
    // ------------------------------------------------
}
