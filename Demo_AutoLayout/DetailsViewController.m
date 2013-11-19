//
//  DetailViewController.m
//  Demo_AutoLayout
//
//  Created by William Remaerd on 11/17/13.
//  Copyright (c) 2013 William Remaerd. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@property(nonatomic, weak)IBOutlet UILabel *labelTitle;

@property(nonatomic, weak)IBOutlet UILabel *labelNotes;
@property(nonatomic, weak)IBOutlet UILabel *labelRating;
@property(nonatomic, weak)IBOutlet UILabel *labelAlbum;
@property(nonatomic, weak)IBOutlet UILabel *labelRelease;
@property(nonatomic, weak)IBOutlet UILabel *labelRecord;

@property(nonatomic, weak)IBOutlet UIButton *buttonTitle;
@property(nonatomic, weak)IBOutlet UIButton *buttonButton;
@property(nonatomic, weak)IBOutlet UIButton *buttonAttrs;
- (IBAction)tapTitle:(UIButton *)sender;

@end

@implementation DetailsViewController

- (void)loadView{
    [super loadView];
    
    self.buttonTitle.titleLabel.minimumScaleFactor = 0.5f;
    self.buttonTitle.titleLabel.adjustsFontSizeToFitWidth = YES;
    self.buttonButton.titleLabel.minimumScaleFactor = 0.5f;
    self.buttonButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    self.buttonAttrs.titleLabel.minimumScaleFactor = 0.5f;
    self.buttonAttrs.titleLabel.adjustsFontSizeToFitWidth = YES;
}

#pragma mark - Managing the detail item

- (IBAction)tapTitle:(UIButton *)sender{
    if (sender == self.buttonTitle) {
        
        static NSUInteger index = 0;
        static NSArray *texts = nil;
        if (texts == nil){
            texts = @[
                      @"T",
                      @"Veeeeeeeeeeeeeery Looooooooooooong Tiiiiiiiiiiitle",
                      @"Title"
                      ];
        }
        self.labelTitle.text = texts[index % 3];
        
        index++;
        
    } else if (sender == self.buttonButton) {
        
        static NSUInteger index = 0;
        static NSArray *texts0 = nil, *texts1 = nil, *texts2 = nil;
        if (texts0 == nil){
            texts0 = @[
                       @"T",
                       @"Veeery Loooong Tiitle",
                       @"Title"
                       ];
        }
        if (texts1 == nil) {
            texts1 = @[
                       @"Button",
                       @"B",
                       @"Veeery Loong Button"
                       ];
        }
        if (texts2 == nil) {
            texts2 = @[
                       @"Veerry Long Attr",
                       @"Attributes",
                       @"A"
                       ];
        }
        NSUInteger number = index % 3;
        [self.buttonTitle setTitle:texts0[number] forState:UIControlStateNormal];
        [self.buttonButton setTitle:texts1[number] forState:UIControlStateNormal];
        [self.buttonAttrs setTitle:texts2[number] forState:UIControlStateNormal];

        index++;

    } else if (sender == self.buttonAttrs) {
        
        static NSUInteger index = 0;
        static NSArray *texts0 = nil, *texts1 = nil;
        if (texts0 == nil) {
            texts0 = @[ @"N",
                       @"Veeeeeeeeeeeeeery Looooooooooooong Notes",
                       @"Notes"
                       ];
        }
        if (texts1 == nil) {
            texts1 = @[ @"Veeeeeeeeeeeeeery Looooooooooooong Year",
                        @"Year",
                        @"Y"
                        ];
        }
        self.labelNotes.text = texts0[index % 3];
        self.labelRelease.text = texts1[index % 3];

        index++;
        
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self.buttonButton.titleLabel addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
