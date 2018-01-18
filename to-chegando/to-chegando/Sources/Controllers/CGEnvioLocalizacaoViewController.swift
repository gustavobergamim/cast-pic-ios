//
//  CGEnvioLocalizacaoViewController.swift
//  to-chegando
//
//  Created by Gustavo Bergamim on 16/01/18.
//  Copyright © 2018 Cast Group. All rights reserved.
//

import UIKit;
import MapKit;

class CGEnvioLocalizacaoViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, MKMapViewDelegate, CLLocationManagerDelegate
{
    @IBOutlet weak var pickerContato: UIPickerView!;
    @IBOutlet weak var mapa: MKMapView!;
    @IBOutlet weak var botaoEnviar: UIButton!
    
    private (set) var contatos: [CGContatoModel] = [];
    private (set) var locationManager: CLLocationManager?;
    var contatoSelecionado: CGContatoModel?;
//    private var coordenadaAtual: CLLocationCoordinate2D?;
    private var flagEnviarLocalizacao = false;

    override func viewDidLoad()
    {
        super.viewDidLoad();
        
        if (self.pickerContato != nil)
        {
            self.pickerContato.delegate = self;
        }
        
        if (self.mapa != nil)
        {
            self.botaoEnviar.setTitle(CGConstantes.labelIniciarEnvio, for: .normal);
            self.configurarGerenciadorDeLocalizacao();
//            self.configurarReconhecimentoDeGesto();
        }
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning();
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        if (self.pickerContato != nil)
        {
            let service = CGContatoService();
            self.contatos = service.listar();
            self.pickerContato.reloadAllComponents();
        }
    }
    
    @IBAction func enviarLocalizacao(_ sender: UIButton) {
        self.flagEnviarLocalizacao = !self.flagEnviarLocalizacao;
        let buttonTitle = self.flagEnviarLocalizacao ? CGConstantes.labelInterromperEnvio : CGConstantes.labelIniciarEnvio;
        sender.setTitle(buttonTitle, for: .normal);
    }
    
    @objc private func inserirMarcacao(gesture: UILongPressGestureRecognizer)
    {
        if (gesture.state == .began)
        {
            let pontoSelecionado = gesture.location(in: self.mapa);
            let coordenadas = self.mapa.convert(pontoSelecionado, toCoordinateFrom: self.mapa);
            self.adicionarMarcacao(coordenadas);
        }
    }
    
    private func configurarGerenciadorDeLocalizacao()
    {
        self.locationManager = CLLocationManager();
        self.locationManager!.delegate = self;
        self.locationManager!.desiredAccuracy = kCLLocationAccuracyBest;
        self.locationManager!.requestWhenInUseAuthorization();
        self.locationManager!.startUpdatingLocation();
    }
    
    private func configurarReconhecimentoDeGesto()
    {
        let gesture = UILongPressGestureRecognizer.init(target: self, action: #selector(CGEnvioLocalizacaoViewController.inserirMarcacao));
        gesture.minimumPressDuration = 1;
        self.mapa.addGestureRecognizer(gesture);
    }
    
    private func limparMarcacoes()
    {
        let marcacoesAtuais = self.mapa.annotations;
        self.mapa.removeAnnotations(marcacoesAtuais);
    }
    
    private func adicionarMarcacao(_ coordenadas: CLLocationCoordinate2D)
    {
        self.limparMarcacoes();
        let marcacao = MKPointAnnotation();
        marcacao.coordinate = coordenadas;
        marcacao.title = "Aqui!";
        self.mapa.addAnnotation(marcacao);
        self.aproximarRegiao(coordenadas);
    }
    
    private func aproximarRegiao(_ coordenadas: CLLocationCoordinate2D)
    {
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05);
        let region = MKCoordinateRegion(center: coordenadas, span: span);
        self.mapa.setRegion(region, animated: true);
    }
    
    
    func registrarLocalizacao(_ coordenadas: CLLocationCoordinate2D)
    {
        let numeroTelefoneOrigem = UserDefaults().string(forKey: CGConstantes.keyLogin);
        let service = CGLocalizacaoService();
        let localizacao = CGLocalizacaoModel(numeroTelefoneOrigem!, (self.contatoSelecionado?.telefone)!, coordenadas.latitude, coordenadas.longitude);
        service.salvarLocalizacao(localizacao, {
            
        }) { (mensagem: String) in
            CGAlertaController(exibirErro: mensagem).exibir(self);
        }
    }
    
    // MARK: - Navigation

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool
    {
        if (identifier == CGConstantes.segueConfirmarLocalizacao)
        {
            return self.pickerContato.selectedRow(inComponent: 0) >= 0;
        }
        return true;
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if (segue.identifier == CGConstantes.segueConfirmarLocalizacao)
        {
            let controller = segue.destination as? CGEnvioLocalizacaoViewController;
            let selectedRowIndex = self.pickerContato.selectedRow(inComponent: 0);
            controller!.contatoSelecionado = self.contatos[selectedRowIndex];
        }
    }

    // MARK: PickerView delegate and datasource
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return self.contatos.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return self.contatos[row].nome;
    }
    
    // MARK: MKMapViewDelegate, CLLocationManagerDelegate
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        if (!self.flagEnviarLocalizacao)
        {
            return;
        }
        
        if let userLocation = locations.last
        {
            self.aproximarRegiao(userLocation.coordinate);
            self.registrarLocalizacao(userLocation.coordinate);
        }
    }
}
