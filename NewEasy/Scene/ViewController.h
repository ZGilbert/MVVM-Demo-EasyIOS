//
//  ViewController.h
//  NewEasy
//
//  Created by 朱潮 on 14-7-22.
//  Copyright (c) 2014年 zhuchao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "swift-bridge.h"
#import "DemoSceneModel.h"
@interface ViewController : Scene<SceneCollectionViewDelegate>
@property(nonatomic,retain)DemoSceneModel *demoSceneModel;
@property (strong, nonatomic) IBOutlet SceneCollectionView *collectionView;
@end

