//
//  ViewController.m
//  Calculatrice
//
//  Created by Mayra Balestrini Godoy on 15/11/13.
//  Copyright (c) 2013 empresa. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize afficherResultat;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setAfficherResultat:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)boutonClicke:(id)sender {
    
    if (!apresCaseDecimale)
    {
        numeroCourant = numeroCourant *10 + (float ) [sender tag];
        afficherResultat.text = [NSString stringWithFormat:@"%.2f", numeroCourant];
    }
    else{
        afficherResultat.text= [afficherResultat.text stringByAppendingString:[NSString stringWithFormat:@"%d",[sender tag]]];
        numeroCourant = [afficherResultat.text floatValue];
    }

}

- (IBAction)boutonClear:(id)sender {
    apresCaseDecimale = NO;
    numeroCourant = 0;
    resultat = 0;
    afficherResultat.text = [NSString stringWithFormat:@"%.2f", numeroCourant];
}

- (IBAction)boutonOperation:(id)sender{
    
    operation = [sender currentTitle];
    void (^caseSelectione)() = @{
        @"+" : ^{
            resultat = resultat + numeroCourant;
            signalOperation = 1;
        },
        @"-" : ^{
            signalOperation = 2;
        },
        @"x" : ^{
            resultat = numeroCourant;
            signalOperation = 3;
        },
        @"/" : ^{
            resultat = numeroCourant;
            signalOperation = 4;
        },
        @"=" : ^{
            if (signalOperation == 1) {
                resultat = resultat + numeroCourant;
            }
            else if (signalOperation == 2 && resultat < 0) {
                resultat = resultat - numeroCourant;
            }
            else if (signalOperation == 3) {
                resultat = resultat * numeroCourant;
            }
            else if (signalOperation == 4) {
                resultat = resultat / numeroCourant;
            }
        },
    }[operation];
    
    if (caseSelectione != nil)
        caseSelectione();
    
    numeroCourant = 0;
    if (decimalDejaExistant == YES)
    {
        afficherResultat.text = [NSString stringWithFormat:@"%.2f",resultat];
    }
    else{
        afficherResultat.text = [NSString stringWithFormat:@"%.2f",resultat];
    }
    numeroCourant = [sender tag];
    apresCaseDecimale = NO;
    decimalDejaExistant = NO;
}

- (IBAction)btnDecimalClicke:(id)sender {
    if (decimalDejaExistant == NO)
    {
        if (apresCaseDecimale == NO)
        {
            apresCaseDecimale = YES;
            afficherResultat.text = [NSString stringWithFormat:@"%.f.",numeroCourant];
        }
        else
        {
            [afficherResultat setText:[[afficherResultat text] stringByAppendingString:@"."]];
        }
        decimalDejaExistant = YES;
    }
}
@end
