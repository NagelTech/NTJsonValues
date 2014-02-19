//
//  MainViewController.m
//  NTJsonValuesSample
//
//  Created by Ethan Nagel on 2/18/14.
//  Copyright (c) 2014 Nagel Technologies, Inc. All rights reserved.
//

#import "MainViewController.h"

#import "NSDictionary+NTJsonValues.h"


@interface MainViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;

@end


@implementation MainViewController


- (id)init
{
    self = [super initWithNibName:NSStringFromClass(self.class) bundle:nil];
    
    if (self)
    {
    }
    
    return self;

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"TryGet Sample";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Parse JSON" style:UIBarButtonItemStyleBordered target:self action:@selector(parseJson:)];
    self.textView.text = @"Welcome!\nTap Parse JSON to see some stuff...\n";
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)log:(NSString *)format, ...
{
    va_list args;
    
    NSMutableString *text = [self.textView.text mutableCopy];
    
    va_start(args, format);
    
    [text appendString:[[NSString alloc] initWithFormat:format arguments:args]];
    
    va_end(args);
    
    [text appendString:@"\n"];
    
    self.textView.text = text;
    
    // scroll to bottom...
    
    [self.textView scrollRangeToVisible:NSMakeRange(self.textView.text.length, 0)];
    
    // required to work around iOS 7 bug...
    
    self.textView.scrollEnabled = NO;
    self.textView.scrollEnabled = YES;
}


-(IBAction)parseJson:(id)sender
{
    NSError *error;
    
    [self log:@"Loading JSON..."];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"sample" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    if ( !data )
    {
        [self log:@"ERROR: Failed to load JSON"];
        return ;
    }

    [self log:@"Parsing JSON..."];
    
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    
    if ( !json )
    {
        [self log:@"ERROR: failed to parse JSON - %@", error.description];
        return ;
    }
    
    [self log:@"Extracting some interesting values..."];
    
    [self log:@"Location: %@, %@", [json stringForKeyPath:@"name"], [json stringForKeyPath:@"sys.country" defaultValue:@"[NO COUNTRY]"]];
     
    [self log:@"Sunrise time: %@", [json dateForKeyPath:@"sys.sunrise"]];
    [self log:@"Sunrise time (serial): %lld", [json longForKeyPath:@"sys.sunrise"]];
    
    [self log:@"lat/lon: %f/%f", [json floatForKeyPath:@"coord.lat"], [json floatForKeyPath:@"coord.lon"]];
    

     
     
     
    
    
    
    
    
}

@end
