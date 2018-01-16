//
//  CGLoginViewController.swift
//  to-chegando
//
//  Created by Gustavo Bergamim on 14/01/18.
//  Copyright © 2018 Cast Group. All rights reserved.
//

import UIKit

//TODO: Mover a view com a exibição do teclado (https://stackoverflow.com/questions/26070242/move-view-with-keyboard-using-swift)
class CGLoginViewController: UIViewController {

    @IBOutlet weak var textNumeroTelefone: CGLoginTextField!;
    @IBOutlet weak var buttonEntrar: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    weak var delegate : CGLoginDelegate?;
    
    private let service = CGLoginService();
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func cancelar(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil);
    }
    
    @IBAction func autenticar(_ sender: UIButton) {
        let numeroTelefone = self.textNumeroTelefone.text!;
        self.prepararProcessamento();
        service.validarUsuario(numeroTelefone: numeroTelefone, processarSucesso, processarFalha);
    }
    
    private func prepararProcessamento()
    {
        self.textNumeroTelefone.isEnabled = false;
        self.buttonEntrar.isHidden = true;
        self.activityIndicator.startAnimating();
    }
    private func finalizarProcessamento()
    {
        DispatchQueue.main.async
        {
            self.textNumeroTelefone.isEnabled = true;
            self.buttonEntrar.isHidden = false;
            self.activityIndicator.stopAnimating();
        }
    }
    
    private func processarSucesso()
    {
        self.finalizarProcessamento();
        self.dismiss(animated: true) {
            self.delegate?.sucesso();
        }
    }
    
    private func processarFalha()
    {
        self.finalizarProcessamento();
        CGAlertaController(exibirErro: "Este número de telefone não existe.").exibir(self);
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        resignFirstResponder();
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
