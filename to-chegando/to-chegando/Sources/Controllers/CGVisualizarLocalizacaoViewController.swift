//
//  CGVisualizarLocalizacaoViewController.swift
//  to-chegando
//
//  Created by Gustavo Bergamim on 18/01/18.
//  Copyright © 2018 Cast Group. All rights reserved.
//

import UIKit;
import MapKit

class CGVisualizarLocalizacaoViewController: UIViewController, MKMapViewDelegate, CGContatoView
{
    @IBOutlet weak var mapa: MKMapView!;
    
    var contato: CGContatoModel?;
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning();
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        let service = CGLocalizacaoService();
        service.obterLocalizacao((self.contato?.telefone)!, { (localizacao: CGLocalizacaoModel?) in
            if let unwrapped = localizacao
            {
                DispatchQueue.main.async
                {
                    self.adicionarMarcacao(CLLocationCoordinate2D(latitude: unwrapped.latitude, longitude: unwrapped.longitude))
                }
            }
        }) { (mensagem: String) in
            CGAlertaController(exibirErro: mensagem).exibir(self);
        }
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
        marcacao.title = self.contato?.nome;
        self.mapa.addAnnotation(marcacao);
        self.aproximarRegiao(coordenadas);
    }
    
    private func aproximarRegiao(_ coordenadas: CLLocationCoordinate2D)
    {
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05);
        let region = MKCoordinateRegion(center: coordenadas, span: span);
        self.mapa.setRegion(region, animated: true);
    }
}

