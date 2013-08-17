//
//  RTEViewController.m
//  TestApp42API
//
//  Created by Rajeev on 16/08/13.
//  Copyright (c) 2013 Rajeev. All rights reserved.
//

#import "RTEViewController.h"
#import "Shephertz_App42_iOS_API/Shephertz_App42_iOS_API.h"


@interface RTEViewController ()

@end

@implementation RTEViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self uploadAPI];
}

-(void)uploadAPI
{
    ServiceAPI *serviceObj = [[ServiceAPI alloc]init];
    serviceObj.apiKey = @"App42_App_key";
    serviceObj.secretKey = @"App42_secret_key";
    UploadService *uploadObj = [serviceObj buildUploadService];
    
    @try
    {
        Upload *upload = [uploadObj uploadFileForUser:@"ownedCharacters6.txt" userName:@"Rajeev2" fileData:[@"Warrior" dataUsingEncoding:NSUTF8StringEncoding] uploadFileType:TXT fileDescription:@"chararcters"];
      
        //Upload *upload = [uploadObj uploadFileForUser:@"ownedCharacters4.png" userName:@"Rajeev2" filePath:@"Default.png" uploadFileType:IMAGE fileDescription:@"Image"];
        NSLog(@"file=%@",upload.fileListArray);
        
    }
    
    @catch (App42Exception *exception)
    {
        NSLog(@"app42 exception");
        NSLog(@"httpError Code = %i",exception.httpErrorCode);
        NSLog(@"appError Code in App42Exception= %i",exception.appErrorCode);
        NSLog(@"exception reason = %@",exception.reason);
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
