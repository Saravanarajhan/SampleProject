//
//  Movie.h
//  Search
//
//  Created by kavindpadi meiyappan on 3/2/17.
//  Copyright © 2017 kavindpadi meiyappan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SearchModel.h"

@interface Movie : SearchModel
-(instancetype)initWithDictonary:(NSDictionary *)dictionary  NS_DESIGNATED_INITIALIZER;
@end
