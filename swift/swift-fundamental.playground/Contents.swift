//: Playground - noun: a place where people can play

import UIKit;

var str = "Hello, playground";

var variavel = "Variável Swift" + " " + "Teste";

print(variavel);

var varComTipo : String = "Variável com tipo";

let varSemTipo = "Constante sem tipo";

var valor1 = "Valor 1 " + varSemTipo;

print("Interpolando o valor \(varSemTipo) " + "Valor 1", "Escrever outra coisa");

var numero : Float = 2.0;
var numero2 : Double = 2.5;
var numero3 : Int = 10;

//Arrays
var mutableArray = [ 1, 2, 3 ];
let imutableArray = [ 1, 2, 3 ];
var array : [String] = [ "v1", "v2", "v3" ];
var array2 = [ "v1", "v2", "v3" ];

print(array);
print(array[2]);

array += ["v4"];
array[2] = "V3";
print(array);

//array[1..<3] = ["VX", "VY", "VZ", "VXX"];
var start = 1;
var end = 3;
array[start..<end] = ["VX", "VY", "VZ", "VXX"];
print(array);

array.removeFirst();
print(array);

array.remove(at: 2);
print(array);


//Dicionários
var dic : [String : Int] = [ "k1": 1, "k2": 2, "k3": 3 ];
dic["k4"] = 4;

dic.removeValue(forKey: "k2");


//Controle de fluxo
//var complete = false;
//while (!complete)
//{
//    print("Downloading...");
//    complete = true;
//}

//complete = false;
//repeat
//{
//    print("Teste...")
//    complete = true;
//} while (!complete);


var carros = [ "Carro 1", "Carro 2", "Carro 3" ];
for index in (0..<carros.count)
{
    print("O índice do carro \(carros[index]) é \(index)");
}

var carrosDic = [ "k1": "Carro 1", "k2": "Carro 2", "k3": "Carro 3" ];
for (chave, valor) in carrosDic
{
    print("O valor da chave \(chave) é \(valor)");
}

var cardValue = "t2";
switch cardValue {
    case "t1":
        print("urso");
    case "t2":
        print("urso pai");
    default:
        print("not found");
}

let distancia = 10;
switch distancia {
    case 0:
        print("aqui");
    case 1, 2, 3, 4, 5:
        print("perto");
    case 6...8:
        print("longe");
    case 9...10:
        print("muito longe");
    default:
        print("not found");
}


//Funções
func funcaoSemParametro()
{
    print("Função sem parâmetro");
}
funcaoSemParametro();

func funcaoComParametro(param : String)
{
    print("Função com o parâmetro '\(param)'");
}
funcaoComParametro(param: "Bergamim");

func funcaoComParametroSemNome(_ nome : String, _ sobrenome : String, idade : Int)
{
    print("Função com o parâmetro sem nome. Nome: '\(nome)' | Sobrenome: '\(sobrenome)' | Idade: \(idade)");
}
funcaoComParametroSemNome("Gustavo", "Bergamim", idade: 30);







