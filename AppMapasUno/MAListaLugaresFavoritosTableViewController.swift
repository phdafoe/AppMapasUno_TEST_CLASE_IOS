//
//  MAListaLugaresFavoritosTableViewController.swift
//  AppMapasUno
//
//  Created by formador on 20/2/17.
//  Copyright © 2017 formador. All rights reserved.
//

import UIKit


typealias diccionario = [String : String]
var customLugares = [diccionario]()
var customLugarSeleccionado = -1


class MAListaLugaresFavoritosTableViewController: UITableViewController {
    
    let taskManager = APITaskManager.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        
        taskManager.cargarDatos()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return taskManager.latitud.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = taskManager.latitud[indexPath.row]["latitud"]
        cell.detailTextLabel?.text = taskManager.longitud[indexPath.row]["longitud"]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        customLugarSeleccionado = indexPath.row
        return indexPath
    }
    
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "muestraMapaSinSeleccionDeCelda"{
            customLugarSeleccionado = -1
        }
    }
    

}
