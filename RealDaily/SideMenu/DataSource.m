//
//  DataSource.m
//  socioville
//
//  Created by Valentin Filip on 10.04.2012.
//  Copyright (c) 2012 App Design Vault. All rights reserved.
//

#import "DataSource.h"

@implementation DataSource

@synthesize items;

+ (DataSource *)dataSource {
    DataSource *source = [[DataSource alloc] init];
    
    
    source.items = @[
                     @{
                         @"title": @"HOME",
                         @"rows": @[
                                 @{@"name": @"Home"
                                   , @"imageName": @"menu-home"}
                                 ]
                         }
                     ,
                      @{
                          @"rows": @[
                                    @{@"name": @"Facebook"
                                      , @"imageName": @"menu-home"}
                                    , @{@"name": @"Twitter"
                                        , @"imageName": @"menu-eye"}
                                    ]
                      }
                      ,
                      @{
                          @"rows": @[
                                  @{@"name": @"Settings"
                                    , @"imageName": @"menu-clock"}
                                  ]
                          }];
    
    return source;
}

@end
