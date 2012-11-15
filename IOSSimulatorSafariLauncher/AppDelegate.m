//
//  AppDelegate.m
//  IOSSimulatorSafariLauncher
//
//  Created by Michael Schieben on 15.11.12.
//  Copyright (c) 2012 Michael Schieben. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
	NSArray * arguments = [[NSProcessInfo processInfo] arguments];
	if([arguments count] < 2) {
		self.window.backgroundColor = [UIColor redColor];
		UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Missing Argument Error"
			message:@"Pass an valid url as first argument, when starting this app.\n----\nios-sim launch IOSSimulatorSafariLauncher.app --args http://example.com"
			delegate:nil
			cancelButtonTitle:@"OK"
			otherButtonTitles:nil];
    	[message show];
	} else {
		NSString * urlArgument = [arguments objectAtIndex: 1];
		
		NSString *urlRegEx = @"(http|https)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+";
    	NSPredicate *urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", urlRegEx];
    	if(![urlTest evaluateWithObject:urlArgument]) {
			self.window.backgroundColor = [UIColor orangeColor];
			UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"URL Error"
				message: [NSString stringWithFormat:@"\"%@\" is not a vaild url", urlArgument]
				delegate:nil
				cancelButtonTitle:@"OK"
				otherButtonTitles:nil];
			[message show];		
		} else {
			self.window.backgroundColor = [UIColor greenColor];
			[[UIApplication sharedApplication] openURL:[NSURL URLWithString: urlArgument]];
		}
	}
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
