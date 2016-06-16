//
//  ViewController.m
//  YCusProgressBar
//
//  Created by jw on 13-4-12.
//  Copyright (c) 2013年 jw. All rights reserved.
//
#define kUpgradeAlertDelay      3
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(ChangeProgressValue) userInfo:nil repeats:YES];
    
    

	
    
    UILocalNotification *localNotif = [[UILocalNotification alloc] init];
    if (localNotif == nil)
        return;
    
    
    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
	
	// Get the current date
	NSDate *pickerDate = [NSDate date];
	
	// Break the date up into components
	NSDateComponents *dateComponents = [calendar components:( NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit )
												   fromDate:pickerDate];
	NSDateComponents *timeComponents = [calendar components:( NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit )
												   fromDate:pickerDate];
    // Set up the fire time
    NSDateComponents *dateComps = [[NSDateComponents alloc] init];
    [dateComps setDay:[dateComponents day]];
    [dateComps setMonth:[dateComponents month]];
    [dateComps setYear:[dateComponents year]];
    [dateComps setHour:[timeComponents hour]];
	// Notification will fire in one minute
    [dateComps setMinute:[timeComponents minute]];
	[dateComps setSecond:[timeComponents second]];
    NSDate *itemDate = [calendar dateFromComponents:dateComps];
    [dateComps release];
    
    localNotif.fireDate = itemDate;
    localNotif.timeZone = [NSTimeZone defaultTimeZone];
	
	// Notification details
    localNotif.alertBody = @"自定义圆";
	// Set the action button
    localNotif.alertAction = @"View";
	
    localNotif.soundName = UILocalNotificationDefaultSoundName;
    localNotif.applicationIconBadgeNumber = 1;
	
	// Specify custom data for the notification
    //  NSDictionary *infoDict = [NSDictionary dictionaryWithObject:@"yes!" forKey:@"yes?"];
    //  localNotif.userInfo = infoDict;
	
	// Schedule the notification
   // [[UIApplication sharedApplication] scheduleLocalNotification:localNotif];
    [localNotif release];



    
	// Do any additional setup after loading the view, typically from a nib.
}

-(IBAction)Select:(id)sender;
{
//    UIButton *AButton=sender;
//	CGRect rect = self.FImageView.frame;
//	rect.origin.x = AButton.center.x - floorf(self.FImageView.frame.size.width/2.0f);
//	self.FImageView.frame = rect;
//	self.FImageView.hidden = NO;
//
//    self.FImageView.frame=rect;
}

-(void)ChangeProgressValue
{
    float progressValue = self.FCusProgressView.progress;
    
    progressValue+= 0.05f;
    NSLog(@"%f",progressValue);
    if (progressValue > 1.0)
    {
        progressValue = 0;
    }
    
    self.FCusProgressView.progress=progressValue;
    self.FProgressValueLabel.text=[NSString stringWithFormat:@"%.0f%%",progressValue*100];
}

- (BOOL)shouldAutorotate
{
    return NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_FProgressValueLabel release];
    [_FCusProgressView release];
    [_FImageView release];
    [super dealloc];
}
@end
