//
//  SWQLiveCell.m
//  inke
//
//  Created by 沈王强 on 2017/8/17.
//  Copyright © 2017年 沈王强. All rights reserved.
//

#import "SWQLiveCell.h"

@interface  SWQLiveCell();  
@property (weak, nonatomic) IBOutlet UIImageView *headView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *onLineLabel;
@property (weak, nonatomic) IBOutlet UIImageView *bigImageView;

@end

@implementation SWQLiveCell

- (void) setLive:(SWQLive *)live{
    _live = live;
    
    [self.headView downloadImage:live.avatar placeholder:@"default_room"];
    [self.nameLabel setText:live.nickname];
    [self.locationLabel setText:live.game_name];
    [self.onLineLabel setText:live.online];
    [self.bigImageView downloadImage:live.room_src placeholder:@"default_room"];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
