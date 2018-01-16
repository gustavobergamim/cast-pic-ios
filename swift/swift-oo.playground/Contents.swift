//: Playground - noun: a place where people can play

import UIKit

class Pessoa
{
    var nome : String;
    var genero : Character;
    var idade : Int;
    
    init(nome : String, genero : Character, idade : Int) {
        self.nome = nome;
        self.genero = genero;
        self.idade = idade;
    }
    
    func falar(_ sentenca : String = "PQLU")
    {
        print("Urso diz: \(sentenca)");
    }
    
    func apresentar()
    {
        falar("Oi, meu nome é \(self.nome).");
    }
}

var pessoa = Pessoa.init(nome: "Gustavo", genero: "M", idade: 30);
print(pessoa.nome);
pessoa.falar();
pessoa.apresentar();

var 🐻 = Pessoa.init(nome: "Andre", genero: "M", idade: 30);
🐻.falar("Porquê 🐻 gosta de 🐟");



class Veiculo
{
    static let unidadeMedida : String = "KM/h";
    
    var velocidadeMaxima : Double
    {
        return 250;
    }
    
    var velocidade : Double = 0.00
    {
        didSet
        {
            velocidade = min(velocidade, velocidadeMaxima);
        }
    }
    
    var velocidadeMilhas : Double
    {
        get
        {
            return self.velocidade / 1.60934;
        }
        set (novaVelocidadeMilhas)
        {
            self.velocidade = novaVelocidadeMilhas * 1.60934;
        }
    }
    
    var modelo : String;
    
    init(_ modelo : String)
    {
        self.modelo = modelo;
    }
    
    func descrever() -> String
    {
        return "Veículo: \(self.modelo) | Velocidade Atual: \(self.velocidade)";
    }
    
    func acelerar(_ velocidade : Double = 5.0)
    {
        self.velocidade += velocidade;
    }
    
    class func alert() -> String
    {
        return "Se beber, não dirija!";
    }
}

let 🚗 = Veiculo.init("Fusca");
print(🚗.descrever());
print(Veiculo.alert());
print(Veiculo.unidadeMedida);


protocol Som
{
    var nomeSom : String { get set };
    func emitirSom();
}

class Animal
{
    var cor : String;
    var genero : Character;
    //Internal [Default]
    //Private
    //Open e Public
    //FilePrivate
    private var patas : Int;
    
    init(_ cor : String, _ genero  : Character, _ patas : Int)
    {
        self.cor = cor;
        self.genero = genero;
        self.patas = patas;
    }
}

class Urso : Animal, Som
{
    var nomeSom : String = "Rugido";
    
    func emitirSom() {
        print("Arrrgghhhhhh");
    }
}

var bacaglini = Urso("parda", "M", 4);
var rato = Animal("branco", "M", 3);

//if (bacaglini is Animal)
//{
//    print("Baca é um animal.");
//}
//
//if (rato is Urso)
//{
//    print("Rato não é urso.");
//}

//Type Casting
//var rato2 = rato as! Urso;
//var urso2 = bacaglini as! Animal;

//switch urso2
//{
//    case is Urso:
//        print("Urso");
//    case is Animal:
//        print("Animal");
//    default:
//        print("Not found");
//}


//Extensions
extension String
{
    func trim() -> String
    {
        return self.trimmingCharacters(in: .whitespaces);
    }
}

var nome = "   Berga   ".trim();

//Enum
enum TipoCombustivel
{
    case gasolina;
    case etanol;
    case diesel;
    case gnv;
}

enum TipoCombustivel2
{
    case gasolina, etanol, diesel, gnv;
}

TipoCombustivel.etanol;
var tipoCombustivel : TipoCombustivel;
tipoCombustivel = .gasolina;


enum Medidas
{
    case peso(Double);
    case idade(Int);
    case tamanho(largura : Double, altura : Double);
}

let medida : Medidas = .tamanho(largura: 3.0, altura: 4.0);
switch medida
{
    case .peso:
        print("Peso");
    case .idade:
        print("Idade");
    case .tamanho (let t):
        print("Tamanho: \(t.largura) x \(t.altura)");
    default:
        print("Não definido");
}


//Struct
struct PessoaStruct
{
    var nome : String;
    var sobrenome : String;
    var idade : Int;
    
    func dizerOla()
    {
        print("Olá");
    }
}






class PessoaDeinit
{
    var nome : String;
    var amigo : PessoaDeinit?;
//    weak var amigo : PessoaDeinit?;
    
    init(_ nome : String)
    {
        self.nome = nome;
        self.amigo = nil;
    }
    
    deinit {
//        self.amigo = nil;
        print("Objeto \(nome) desalocado.");
    }
}

var berga : PessoaDeinit? = PessoaDeinit("Berga");
var baca : PessoaDeinit? = PessoaDeinit("Baca");
berga!.amigo = baca;
//berga!.amigo = PessoaDeinit("Baca");
//berga = nil;
baca = nil;
