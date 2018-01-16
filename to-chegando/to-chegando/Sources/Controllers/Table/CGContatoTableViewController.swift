//
//  CGContatoTableViewController.swift
//  to-chegando
//
//  Created by Gustavo Bergamim on 15/01/18.
//  Copyright © 2018 Cast Group. All rights reserved.
//

import UIKit

class CGContatoTableViewController: UITableViewController {

    var contatos: [CGContatoModel] = [];
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        self.atualizarLista(recarregar: true);
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1;
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.contatos.count;
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellContato", for: indexPath) as? CGContatoTableViewCell;
        let contato = self.contatos[indexPath.row];
        cell?.preencher(contato, indexPath.row);
        return cell!;
    }
    
    private func atualizarLista(recarregar: Bool)
    {
        let service = CGContatoService();
        self.contatos = service.listar();
        if (recarregar)
        {
            self.tableView.reloadData();
        }
    }
    
    private func remover(_ indices: [IndexPath], recarregar: Bool)
    {
        let service = CGContatoService();
        indices.forEach { (index: IndexPath) in
            let contato = self.contatos[index.row];
            service.excluir(contato);
        }
        self.atualizarLista(recarregar: recarregar);
    }
 
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true;
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
            self.remover([indexPath], recarregar: false);
            tableView.deleteRows(at: [indexPath], with: .fade);
        }
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if (identifier == "editarContato")
        {
            let isSelecionado = self.tableView!.indexPathForSelectedRow != nil
                && self.tableView!.indexPathForSelectedRow!.count > 0;
            if (!isSelecionado)
            {
                CGAlertaController(exibirErro: "Selecione um contato para edição.").exibir(self);
            }
            return isSelecionado;
        }
        return true;
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "editarContato")
        {
            let rowIndex = self.tableView.indexPathForSelectedRow!.last!;
            let contato = self.contatos[rowIndex];
            let controller = segue.destination as? CGContatoViewController;
            controller!.contato = contato;
        }
    }

    

}
