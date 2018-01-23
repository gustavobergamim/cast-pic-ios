//
//  ConsultaLivroTableViewController.swift
//  MyBooks
//
//  Created by Gustavo Bergamim on 20/01/18.
//  Copyright © 2018 Cast Group. All rights reserved.
//

import UIKit

class ConsultaLivroTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, LivroTableViewCellDelegate {
    
    @IBOutlet weak var textPesquisa: UITextField!
    @IBOutlet weak var botaoPesquisa: UIButton!
    @IBOutlet weak var tableLivros: UITableView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    var livros: [LivroModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableLivros.delegate = self
        self.tableLivros.dataSource = self
        self.loadingIndicator.stopAnimating()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.carregar()
    }

    @IBAction func pesquisar(_ sender: UIButton) {
        self.carregar()
    }
    
    func carregar() {
        self.botaoPesquisa.isEnabled = false
        self.loadingIndicator.isHidden = false
        self.loadingIndicator.startAnimating()
        let service = ConsultaLivroService()
        service.pesquisar(comTitulo: self.textPesquisa.text!, self, dataCallback: atualizarLista, completeCallback: complete)
    }
    
    func complete() {
        DispatchQueue.main.async {
            self.botaoPesquisa.isEnabled = true
            self.loadingIndicator.stopAnimating()
        }
    }
    
    func atualizarLista(livros: [LivroModel]) {
        DispatchQueue.main.async {
            self.livros = livros
            self.tableLivros.reloadData()
        }
    }
    
    // MARK: - LivroTableViewCellDelegate
    
    func adicionar(cell: UITableViewCell) {
        if let indexPath = self.tableLivros.indexPath(for: cell) {
            let livroModel = self.livros[indexPath.row]
            let dataContext = DataContext()
            livroModel.criarLivro(context: dataContext.context)
            dataContext.save()
            Alerta.exibir(mensagem: "Livro adicionado.", noController: self)
            self.carregar()
        }
    }
    
    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.livros.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellLivro", for: indexPath) as? LivroTableViewCell
        let livro = self.livros[indexPath.row]
        cell?.preencher(livro)
        cell?.delegate = self
        cell?.controller = self
        return cell!
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}
