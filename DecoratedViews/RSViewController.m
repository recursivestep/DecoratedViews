//
//  RSViewController.m
//  DecoratedViews
//
//  Created by Mark Williams on 06/06/2014.
//  Copyright (c) 2014 Mark Williams. All rights reserved.
//

#import "RSViewController.h"
#import "RSView.h"

@interface RSViewController ()

@end

@implementation RSViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	RSView *customView = [[RSView alloc] initWithFrame:self.view.frame];
	RSLabelViewBuilderDecorator *labelDecorator = [[RSLabelViewBuilderDecorator alloc] initWithFrame:self.view.frame];
	RSColouredViewBuilderDecorator *colourDecorator = [[RSColouredViewBuilderDecorator alloc] initWithFrame:self.view.frame];

	[colourDecorator decorateView:[labelDecorator decorateView:customView]];
	[colourDecorator buildView:customView];

	[self.view addSubview:customView];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
