# ZHDragZoomImage
This is a demo that can help you implete a effection--dragding and zooming picture
# There is a method that you can integrate the frame with next two steps:
   * first: Create a imageView
- (UIImageView *)headerImageView{
   -  if (_headerImageView == nil){
     -    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"luochengduo"]];
     -    imageView.frame = CGRectMake(0, 0, kScreentWidth, 200);
     -    imageView.contentMode = UIViewContentModeScaleAspectFill;
     -    imageView.clipsToBounds = YES;
     -    return imageView;
     -}
   - else{
     -    return _headerImageView;
     -}
-}
    
  *Second:send the imageView and fatherView to ZHZoomModel
    - self.model = [[ZHZoomModel alloc] initWithItem:self.tableView andWithItemHeader:self.headerImageView];
    - 


#Display with Aniamtion
![Alt Text](https://github.com/stackJolin/ZHDragZoomImage/blob/master/ZHDragZoomImage/zoomOut.gif)
