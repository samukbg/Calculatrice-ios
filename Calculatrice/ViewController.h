//
//  ViewController.h
//  Calculatrice
//
//  Created by Mayra Balestrini Godoy on 15/11/13.
//  Copyright (c) 2013 empresa. All rights reserved.
//

#import <UIKit/UIKit.h>

int signalOperation;
float resultat;
float numeroCourant;
NSString *operation;
bool apresCaseDecimale;
bool decimalDejaExistant;

@interface ViewController : UIViewController
- (IBAction)btnDecimalClicke:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *afficherResultat;
- (IBAction)boutonClear:(id)sender;
- (IBAction)boutonClicke:(id)sender;
- (IBAction)boutonOperation:(id)sender;

@end
