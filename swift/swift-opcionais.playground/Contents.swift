//: Playground - noun: a place where people can play

import UIKit

//Usar variável sem iniciar = erro
//var rg : Int;
//print(rg);
//rg = 35;

//Definir variável com valor opcional
var nome : String?
print(nome);
nome = "Bacaglini";
print(nome);
//print(nome!);
if let nomeValue = nome
{
    print(nomeValue);
}

let nEnd = Int("100A");
print(nEnd);
//print(nEnd!);

//Nil coaliscing operator
let valor : String = "A";
let endereco = Int(valor) ?? 0;

//Implicit unwrapped optionals
var nome2 : String!;
print(nome2);
