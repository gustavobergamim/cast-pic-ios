//
//  CGContatoViewController.swift
//  to-chegando
//
//  Created by Gustavo Bergamim on 15/01/18.
//  Copyright © 2018 Cast Group. All rights reserved.
//

import UIKit;
import Photos;

class CGContatoViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var imagem: UIImageView!;
    @IBOutlet weak var textNome: UITextField!;
    @IBOutlet weak var textContato: UITextField!;
    
    var contato: CGContatoModel? = nil;
    private let service: CGContatoService = CGContatoService();
    private let imagePickerController: UIImagePickerController = UIImagePickerController();
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
        self.title = (self.contato != nil) ? "Editar Contato" : "Criar Contato";
        self.imagem.image = contato?.imagem;
        self.textNome.text = contato?.nome;
        self.textContato.text = contato?.telefone;
        self.imagePickerController.delegate = self;
        self.imagePickerController.allowsEditing = true;
        self.imagePickerController.sourceType = .photoLibrary;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        resignFirstResponder();
    }
    
    @IBAction func escolherImagem(_ sender: UIButton)
    {
        self.present(self.imagePickerController, animated: true, completion: nil);
    }
    
    @IBAction func salvar(_ sender: UIButton) {
        let contato = self.contato ?? CGContatoModel();
        contato.nome = self.textNome!.text!;
        contato.telefone = self.textContato!.text!;
        if let imagem = self.imagem!.image
        {
            contato.imagem = imagem;
        }
        let resultado = self.service.salvar(contato);
        if (resultado)
        {
            self.navigationController?.popViewController(animated: true);
        }
        else
        {
            CGAlertaController(exibirErro: "Ocorreu um erro ao salvar o contato.").exibir(self);
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - UIImagePickerControllerDelegate
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        picker.dismiss(animated: true, completion: nil);
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        let imagem = info[UIImagePickerControllerEditedImage] as? UIImage;
        self.imagem.image = imagem;
        self.imagePickerControllerDidCancel(picker);
    }
}
