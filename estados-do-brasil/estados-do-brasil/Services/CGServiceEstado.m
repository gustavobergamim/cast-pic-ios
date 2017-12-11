//
//  CGServiceEstado.m
//  estados-do-brasil
//
//  Created by Gustavo Bergamim on 06/12/2017.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "CGServiceEstado.h"

@implementation CGServiceEstado

- (NSArray<CGEstado *> *)recuperarEstados
{
    NSMutableArray *arrayEstados = [@[] mutableCopy];
    
    CGEstado *estado = [CGEstado new];
    [estado setNome:@"Acre"];
    [estado setSigla:@"AC"];
    [estado setCapital:@"Rio Branco"];
    [estado setRegiao:CGEnumRegiaoNorte];
    [arrayEstados addObject:estado];
    
    estado = [CGEstado new];
    [estado setNome:@"Alagoas"];
    [estado setSigla:@"AL"];
    [estado setCapital:@"Maceió"];
    [estado setRegiao:CGEnumRegiaoNordeste];
    [arrayEstados addObject:estado];
    
    estado = [CGEstado new];
    [estado setNome:@"Amapá"];
    [estado setSigla:@"AP"];
    [estado setCapital:@"Macapá"];
    [estado setRegiao:CGEnumRegiaoNorte];
    [arrayEstados addObject:estado];
    
    estado = [CGEstado new];
    [estado setNome:@"Amazonas"];
    [estado setSigla:@"AM"];
    [estado setCapital:@"Manaus"];
    [estado setRegiao:CGEnumRegiaoNorte];
    [arrayEstados addObject:estado];
    
    estado = [CGEstado new];
    [estado setNome:@"Bahia"];
    [estado setSigla:@"BA"];
    [estado setCapital:@"Salvador"];
    [estado setRegiao:CGEnumRegiaoNordeste];
    [arrayEstados addObject:estado];
    
    estado = [CGEstado new];
    [estado setNome:@"Ceará"];
    [estado setSigla:@"CE"];
    [estado setCapital:@"Fortaleza"];
    [estado setRegiao:CGEnumRegiaoNordeste];
    [arrayEstados addObject:estado];
    
    estado = [CGEstado new];
    [estado setNome:@"Distrito Federal"];
    [estado setSigla:@"DF"];
    [estado setCapital:@"Brasília"];
    [estado setRegiao:CGEnumRegiaoCentroOeste];
    [arrayEstados addObject:estado];
    
    estado = [CGEstado new];
    [estado setNome:@"Espírito Santo"];
    [estado setSigla:@"ES"];
    [estado setCapital:@"Vitória"];
    [estado setRegiao:CGEnumRegiaoSudeste];
    [arrayEstados addObject:estado];
    
    estado = [CGEstado new];
    [estado setNome:@"Goiás"];
    [estado setSigla:@"GO"];
    [estado setCapital:@"Goiânia"];
    [estado setRegiao:CGEnumRegiaoCentroOeste];
    [arrayEstados addObject:estado];
    
    estado = [CGEstado new];
    [estado setNome:@"Maranhão"];
    [estado setSigla:@"MA"];
    [estado setCapital:@"São Luís"];
    [estado setRegiao:CGEnumRegiaoNorte];
    [arrayEstados addObject:estado];
    
    estado = [CGEstado new];
    [estado setNome:@"Mato Grosso"];
    [estado setSigla:@"MT"];
    [estado setCapital:@"Cuiabá"];
    [estado setRegiao:CGEnumRegiaoCentroOeste];
    [arrayEstados addObject:estado];
    
    estado = [CGEstado new];
    [estado setNome:@"Mato Grosso do Sul"];
    [estado setSigla:@"MS"];
    [estado setCapital:@"Campo Grande"];
    [estado setRegiao:CGEnumRegiaoCentroOeste];
    [arrayEstados addObject:estado];
    
    estado = [CGEstado new];
    [estado setNome:@"Minas Gerais"];
    [estado setSigla:@"MG"];
    [estado setCapital:@"Belo Horizonte"];
    [estado setRegiao:CGEnumRegiaoSudeste];
    [arrayEstados addObject:estado];
    
    estado = [CGEstado new];
    [estado setNome:@"Pará"];
    [estado setSigla:@"PA"];
    [estado setCapital:@"Belém"];
    [estado setRegiao:CGEnumRegiaoNorte];
    [arrayEstados addObject:estado];
    
    estado = [CGEstado new];
    [estado setNome:@"Paraíba"];
    [estado setSigla:@"PB"];
    [estado setCapital:@"João Pessoa"];
    [estado setRegiao:CGEnumRegiaoNordeste];
    [arrayEstados addObject:estado];
    
    estado = [CGEstado new];
    [estado setNome:@"Paraná"];
    [estado setSigla:@"PR"];
    [estado setCapital:@"Curitiba"];
    [estado setRegiao:CGEnumRegiaoSul];
    [arrayEstados addObject:estado];
    
    estado = [CGEstado new];
    [estado setNome:@"Pernambuco"];
    [estado setSigla:@"PE"];
    [estado setCapital:@"Recife"];
    [estado setRegiao:CGEnumRegiaoNordeste];
    [arrayEstados addObject:estado];
    
    estado = [CGEstado new];
    [estado setNome:@"Piauí"];
    [estado setSigla:@"PI"];
    [estado setCapital:@"Teresina"];
    [estado setRegiao:CGEnumRegiaoNordeste];
    [arrayEstados addObject:estado];
    
    estado = [CGEstado new];
    [estado setNome:@"Rio de Janeiro"];
    [estado setSigla:@"RJ"];
    [estado setCapital:@"Rio de Janeiro"];
    [estado setRegiao:CGEnumRegiaoSudeste];
    [arrayEstados addObject:estado];
    
    estado = [CGEstado new];
    [estado setNome:@"Rio Grande do Norte"];
    [estado setSigla:@"RN"];
    [estado setCapital:@"Natal"];
    [estado setRegiao:CGEnumRegiaoNordeste];
    [arrayEstados addObject:estado];
    
    estado = [CGEstado new];
    [estado setNome:@"Rio Grande do Sul"];
    [estado setSigla:@"RS"];
    [estado setCapital:@"Porto Alegre"];
    [estado setRegiao:CGEnumRegiaoSul];
    [arrayEstados addObject:estado];
    
    estado = [CGEstado new];
    [estado setNome:@"Rondônia"];
    [estado setSigla:@"RO"];
    [estado setCapital:@"Porto Velho"];
    [estado setRegiao:CGEnumRegiaoNorte];
    [arrayEstados addObject:estado];
    
    estado = [CGEstado new];
    [estado setNome:@"Roraima"];
    [estado setSigla:@"RR"];
    [estado setCapital:@"Boa Vista"];
    [estado setRegiao:CGEnumRegiaoNorte];
    [arrayEstados addObject:estado];
    
    estado = [CGEstado new];
    [estado setNome:@"Santa Catarina"];
    [estado setSigla:@"SC"];
    [estado setCapital:@"Florianópolis"];
    [estado setRegiao:CGEnumRegiaoSul];
    [arrayEstados addObject:estado];
    
    estado = [CGEstado new];
    [estado setNome:@"São Paulo"];
    [estado setSigla:@"SP"];
    [estado setCapital:@"São Paulo"];
    [estado setRegiao:CGEnumRegiaoSudeste];
    [arrayEstados addObject:estado];
    
    estado = [CGEstado new];
    [estado setNome:@"Sergipe"];
    [estado setSigla:@"SE"];
    [estado setCapital:@"Aracaju"];
    [estado setRegiao:CGEnumRegiaoNordeste];
    [arrayEstados addObject:estado];
    
    estado = [CGEstado new];
    [estado setNome:@"Tocantins"];
    [estado setSigla:@"TO"];
    [estado setCapital:@"Palmas"];
    [estado setRegiao:CGEnumRegiaoNorte];
    [arrayEstados addObject:estado];
    
    return arrayEstados;
}

- (NSDictionary<NSNumber *,NSArray<CGEstado *> *> *)recuperarEstadosPorRegiao
{
    NSArray *listaEstados = [self recuperarEstados];
    NSMutableDictionary *resultado = [@{} mutableCopy];
    
    for (CGEstado *estado in listaEstados)
    {
        NSMutableArray *listaEstadosRegiao = [resultado objectForKey:@(estado.regiao)];
        
        if (listaEstadosRegiao == nil)
        {
            listaEstadosRegiao = [@[] mutableCopy];
            [resultado setObject:listaEstadosRegiao forKey:@(estado.regiao)];
        }
        
        [listaEstadosRegiao addObject:estado];
    }
    return resultado;
}

@end
