//: Playground - noun: a place where people can play

import UIKit

//Closure é um pedaço auto-contido de código e funcionalidade que podem ser repassados e utilizados em outros trechos do código

func MeuMetodo() -> String
{
    return "Olá";
}

var closureSemParametroSemRetorno = {
    print("Olá");
};
closureSemParametroSemRetorno();

var closureSemParametroComRetorno = {
    () -> Int in
    return 10;
};
closureSemParametroComRetorno();

var closureComParametroComRetorno = {
    (nome : String) -> String in
    return "Nome: '\(nome)'";
};
closureComParametroComRetorno("Gustavo");

func soma(_ a : Int, _ b : Int) -> Int
{
    return a + b;
}

func subtrair(_ a : Int, _ b : Int) -> Int
{
    return a - b;
}

func calcular(_ a : Int, _ b : Int, operador : (Int, Int) -> Int) -> Int
{
    return operador(a, b);
}

calcular(1, 2, operador: soma);
calcular(1, 2, operador: subtrair);
calcular(1, 2, operador: {
    (a : Int, b : Int) -> Int in
    return (a + 3) * b;
});


//Simplificar: Pelo poder de inferência de tipo
calcular(1, 2, operador: {
    (a, b) in
    return (a + 3) * b;
});

calcular(1, 2, operador: {
    return ($0 + 3) * $1;
});

calcular(1, 2, operador: { $0 + $1 });
calcular(1, 2, operador: -);
calcular(1, 2) { $0 + $1 };

calcular(1, 2) {
    (a : Int, b : Int) -> Int in
    return (a + 3) * b;
};


//Exemplos de funções que usam closures
var numeros = [6, 4, 1, 2, 7, 8];
numeros.sort(by: >);
numeros.sort(by: <);

var nomes = [ "   Urso", "  Urso Glini", "Pouta Que La Ursa" ];
let nomesSemEspaco = nomes.map(){ $0.trimmingCharacters(in: CharacterSet.whitespaces) };
print(nomesSemEspaco);

let nomesUpperCased = nomesSemEspaco.map(){ $0.uppercased() };
print(nomesUpperCased);

