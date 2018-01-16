//: Playground - noun: a place where people can play

import UIKit

//Set
let set = Set<Int>([ 10, 20 ]);
let set2 : Set<Double>;
set2 = [ 10.1, 2.5, 3.8 ];

var set3 = Set<Int>(1...5);

var grupo = Set<Int>(1...5);
grupo.insert(6);
print(grupo.sorted());

var grupo2 = Set<Int>(10...15);
grupo2.insert(6);

var uniao = grupo.union(grupo2);
print(uniao.sorted());

var interseccao = grupo.intersection(grupo2);
print(interseccao.sorted());

var diferenca = grupo.symmetricDifference(grupo2);
print(diferenca.sorted());

var excecao = grupo.subtracting(grupo2);
print(excecao.sorted());


//Tupla
var valores = Set<Int>(1...5);
var resultado = valores.insert(6);
print(resultado.inserted);
print(resultado.memberAfterInsert);

let endereco = "Rua de Pedras, 1234, Cidade-UF, 12345-123";
let valoresTupla = ("Rua", "de Pedras", "1234", "Cidade", "UF", "12345-123");
let valoresTupla2 : (tipoLogradouro : String, logradouro : String, numero : Int, cidade : String, uf : String, cep : String) = ("Rua", "de Pedras", 1234, "Cidade", "UF", "12345-123");
print(valoresTupla.0);
print(valoresTupla2.tipoLogradouro);

let (tipoLogradouro, logradouro, _, _, _, cep) = valoresTupla2;
print(tipoLogradouro);
print(logradouro);
print(cep);


