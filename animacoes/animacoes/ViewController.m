//
//  ViewController.m
//  animacoes
//
//  Created by Gustavo Bergamim on 08/01/18.
//  Copyright © 2018 Cast Group. All rights reserved.
//

#import "ViewController.h"

#define degreesToRadians(x) (M_PI * x / 180)

@interface ViewController ()<UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UIImageView *logoApple;
@property (weak, nonatomic) IBOutlet UIPickerView *comboAnimacoes;
@property (nonatomic, strong) NSArray *listaAnimacoes;

@end

@implementation ViewController {
    int _xOriginal;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.listaAnimacoes = @[
                            @"Alpha",
                            @"Mover",
                            @"Mover - Transform",
                            @"Redimensionar",
                            @"Redimensionar - Transform",
                            @"Girar 1 - Transformação",
                            @"Animação com Blocks 1",
                            @"Animação com Blocks 2"];
    
    _xOriginal = self.logoApple.frame.origin.x;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions
- (IBAction)animar:(id)sender {
    
    NSInteger linha = [self.comboAnimacoes selectedRowInComponent:0];
    NSString *nomeAnimacao = self.listaAnimacoes[linha];
    
    if ([nomeAnimacao isEqualToString:@"Alpha"])
    {
        [self alpha];
    }
    else if ([nomeAnimacao isEqualToString:@"Mover"])
    {
        [self mover];
    }
    else if ([nomeAnimacao isEqualToString:@"Mover - Transform"])
    {
        [self moverTransform];
    }
    else if ([nomeAnimacao isEqualToString:@"Redimensionar"])
    {
        [self redimensionar];
    }
    else if ([nomeAnimacao isEqualToString:@"Redimensionar - Transform"])
    {
        [self redimensionarTransform];
    }
    else if ([nomeAnimacao isEqualToString:@"Girar 1 - Transformação"])
    {
        [self girar];
    }
    else if ([nomeAnimacao isEqualToString:@"Animação com Blocks 1"])
    {
        [self animarComBloco1];
    }
    else if ([nomeAnimacao isEqualToString:@"Animação com Blocks 2"])
    {
        [self animarComBloco2];
    }
}

#pragma mark - Animações
- (void)alpha{
    //Iniciando a animação dentro do contexto atual
    [UIView beginAnimations:nil context:NULL];
    //Duração da animação
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelegate:self];
    
    if (self.logoApple.alpha == 1) {
        self.logoApple.alpha = 0;
    }else{
        self.logoApple.alpha = 1;
    }
    
    //Finaliza a animação
    [UIView commitAnimations];
}

- (void) mover{
    //Iniciando a animação dentro do contexto atual
    [UIView beginAnimations:nil context:NULL];
    //Duração da animação
    [UIView setAnimationDuration:1];
    
    CGRect rect = self.logoApple.frame;
    int x = rect.origin.x;
    int y = rect.origin.y;
    int w = rect.size.width;
    int h = rect.size.height;
    
    if (x == _xOriginal) {
        self.logoApple.frame = CGRectMake(x+100, y, w, h);
    }else{
        self.logoApple.frame = CGRectMake(x-100, y, w, h);
    }
    
    //Finaliza a animação
    [UIView commitAnimations];
}

- (void) moverTransform{
    //Iniciando a animação dentro do contexto atual
    [UIView beginAnimations:nil context:NULL];
    //Duração da animação
    [UIView setAnimationDuration:1];
    
    int tx = self.logoApple.transform.tx;
    
    if (tx == 0) {
        self.logoApple.transform = CGAffineTransformMakeTranslation(100, 0);
    }else{
        self.logoApple.transform = CGAffineTransformIdentity;
    }
    
    //Finaliza a animação
    [UIView commitAnimations];
}

- (void) redimensionar{
    //Iniciando a animação dentro do contexto atual
    [UIView beginAnimations:nil context:NULL];
    //Duração da animação
    [UIView setAnimationDuration:1];
    
    if (self.logoApple.bounds.size.width == 68) {
        self.logoApple.bounds = CGRectMake(self.logoApple.bounds.origin.x, self.logoApple.bounds.origin.y, self.logoApple.bounds.size.width * 2, self.logoApple.bounds.size.height * 2);
    }else{
        self.logoApple.bounds = CGRectMake(self.logoApple.bounds.origin.x, self.logoApple.bounds.origin.y, 68, 77);
    }
    
    //Finaliza a animação
    [UIView commitAnimations];
}

- (void) redimensionarTransform{
    
    //Iniciando a animação dentro do contexto atual
    [UIView beginAnimations:nil context:NULL];
    //Duração da animação
    [UIView setAnimationDuration:1];
    
    int ty = self.logoApple.transform.a;
    
    if (ty == 1) {
        //Aumenta a imagem para 200%
        self.logoApple.transform = CGAffineTransformMakeScale(2, 2);
    } else{
        self.logoApple.transform = CGAffineTransformIdentity;
    }
    
    //Finaliza a animação
    [UIView commitAnimations];
}

- (void) girar
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    
    //deslocamento atual do eixo Y na matriz
    int ty = self.logoApple.transform.d;
    
    if (ty == 1)
    {
        self.logoApple.transform = CGAffineTransformMakeRotation(degreesToRadians(180));
    }
    else
    {
        self.logoApple.transform = CGAffineTransformIdentity;
    }
    
    [UIView commitAnimations];
}

- (void) animarComBloco1
{
    [UIView animateWithDuration:1.5 delay:0.5 options:UIViewAnimationOptionCurveEaseOut animations:^{
        int tx = self.logoApple.transform.tx;
        
        if (tx == 0)
        {
            self.logoApple.transform = CGAffineTransformMakeTranslation(100, 0);
        }
        else
        {
            self.logoApple.transform = CGAffineTransformIdentity;
        }
    } completion:nil];
    
    [UIView commitAnimations];
}

- (void) animarComBloco2
{
    if (self.logoApple.alpha == 0) {
        //Zera a transformação
        self.logoApple.alpha = 1;
        self.logoApple.transform = CGAffineTransformIdentity;
    }else{
        //Rotacionar e deixar a imagem transparente
        [UIView animateWithDuration:1.5 delay:0.5 options:UIViewAnimationOptionCurveEaseOut animations:^{
            int ty = self.logoApple.transform.d;
            
            if (ty == 1)
            {
                self.logoApple.transform = CGAffineTransformMakeRotation(degreesToRadians(180));
            }
            else
            {
                self.logoApple.transform = CGAffineTransformIdentity;
            }
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:1.5 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                self.logoApple.alpha = 0;
            } completion:nil];
        }];
    }
    
    [UIView commitAnimations];
}


#pragma mark AnimationDelegate - monitorar o início e fim da animação
- (void)animationWillStart:(NSString *)animationID context:(void *)context {
    NSLog(@"Animação iniciada.");
}

- (void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
    NSLog(@"Animação Finalizada.");
}

#pragma mark - pickerview delegate e datasource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.listaAnimacoes.count;
}

-  (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return self.listaAnimacoes[row];
}


@end
