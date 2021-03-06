//
//  FPCWebViewController.m
//  PracticaWineApp
//
//  Created by Francisco Payán Calero on 22/10/17.
//  Copyright © 2017 Francisco Payán Calero. All rights reserved.
//

#import "FPCWebViewController.h"

@interface FPCWebViewController ()

@end

@implementation FPCWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


-(id) initWithModel:(FPCWineModel *) aWebModel{
    if(self = [super initWithNibName:nil bundle:nil]){
        _webWineModel = aWebModel;
        self.title = @"Web Page";
    }
    return self;
}


-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    // Pintar view apartir de la barra de menú.
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self displayURL: self.webWineModel.wineCompanyWeb];
}

#pragma mark - UIWebViewDelegate
-(void) webViewDidFinishLoad:(UIWebView *)webView{
    [self.activityIndicatorView stopAnimating];
    [self.activityIndicatorView setHidden:YES];
}


#pragma mark - Utils
-(void) displayURL:(NSURL *) aURL{
    self.browser.delegate = self;
    self.activityIndicatorView.hidden = NO;
    [self.activityIndicatorView startAnimating];
    [self.browser loadRequest:[NSURLRequest requestWithURL:aURL]];
    
    
}



@end
