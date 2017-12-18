# DDAutoTracker


## 埋点的重要性

1. 提高增长率：精准营销分析，优化推广效果，改进落地页，提升转化率
2. 提升用户活跃度：更细分的自定义活跃与留存分析，全面提升用户活跃度
3. 精准运营：用户分群，用户画像，多维交叉分析，实现精准运营
4. 优化产品体验：通过行为分析，事件分析，漏斗分析，优化产品体验

## 常见的埋点方式

### 1. 代码埋点
通过手写代码的方式进行埋点。代码埋点存在高度耦合、依赖发版、无法动态更新、容易误删、重复埋点等问题。

### 2. 无埋点
无埋点方式主要是指不需要代码埋点，通过app端上报控件信息给埋点配置服务器，数据人员通过上报数据进行配置埋点信息，然后再下发给app端，实现无需添加代码、动态配置收集用户使用app的所有事件。

## 无埋点实现方式

iOS 无埋点方案主要依靠AOP（Aspect Oriented Programming）面向切片编程，通过预编译方式和运行期动态代理针对业务处理过程的实体及其属性和行为进行抽象封装，以获得更加清晰高效的逻辑单元划分。

iOS实现AOP编程，主要依赖iOS的runtime机制，method swizzling方法，method swizzling本质上就是对IMP（一个函数指针，保存了方法的地址）和SEL（类成员方法的指针，但不同于C语言中的函数指针，函数指针直接保存了方法的地址，但SEL只是方法编号）进行交换。

method swizzling是发生在运行时的，主要用于在运行时将两个method进行交换，我们可以将method swizzling代码写到任何地方，但是只有在这段method swizzling码执行完毕之后互换才起作用。

## method swizzling原理

在Objective-C中调用一个方法，其实是向一个对象发送消息，查找消息的唯一依据是selector的名字。利用Objective-C的动态特性，可以实现在运行时偷换selector对应的方法实现，达到给方法挂钩的目的。每个类都有一个方法列表，存放着selector的名字和方法实现的映射关系。IMP有点类似函数指针，指向具体的Method实现。
![method_swizzling.png](http://upload-images.jianshu.io/upload_images/2137852-c26e668dd1dd2326.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

利用method_exchangeImplementations、class_replaceMethod、method_setImplementation等方法偷换selector的IMP。

![method_swizzling_2.png](http://upload-images.jianshu.io/upload_images/2137852-96ceeb5f81db7fe7.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

例：
```
#import <UIKit/UIKit.h>

@interface UIViewController (DDTracker)

@end
```

```
#import "UIViewController+DDTracker.h"
#import <objc/runtime.h>

@implementation UIViewController (DDTracker)

+ (void)load {
Method originalSelector = class_getClassMethod(self, @selector(viewWillAppear:));
Method swizzledSelector = class_getClassMethod(self, @selector(swiz_viewWillAppear:));
method_exchangeImplementations(originalSelector, swizzledSelector);
}

- (void)swiz_viewWillAppear:(BOOL)animated
{
//在这里填写需要插入的代码
[self sendTrackerData];

//执行原来的代码，不影响代码逻辑
[self swiz_viewWillAppear:animated];
}

- (void)sendTrackerData {

}
```

## iOS常用UI控件

### UIControl

UIControl是UIView的子类，当然也是UIResponder的子类。UIControl是诸如UIButton、UISwitch、UITextField等控件的父类，通过endTrackingWithTouch:withEvent:方法可以监控UIControl的触摸事件。


### UITableView

UITableView是iOS主要列表控件，通过UITableViewDelegate的tableView:didSelectRowAtIndexPath:方法可以监控到UITableView的点击事件。

### UICollectionView

UICollectionView 这个类是iOS6 引进的API，它的布局更加灵活，简单来说就是多列的UITableView,UICollectionView的实现和UITableView的实现基本一样，也是存在datasource和delegate的，通过UICollectionViewDelegate的collectionView:didSelectItemAtIndexPath:方法可以监控到UICollectionView的点击事件。

### UIView

iOS中UIView添加UITapGestureRecognizer手势实现点击效果，通过UITapGestureRecognizer的initWithTarget:action:方法可以监控到UIView的点击事件。


## 事件ID

事件ID的组成主要是通过Viewcontroller（或TableCell）、Class和action通过一定规则拼接组成。

## 上报控件信息

当用户点击控件时，通过runtime运行时在执行响应方法后，调用接口，将控件ID以及当前class中绑定的数据取出来传给服务器。

## 配置信息下拉

```
[
    {
    "DD_TRACKER_EVENTID_KEY":"DDButtonViewController&&trackerButtonClick:"
    },
    {
    "DD_TRACKER_EVENTID_KEY":"DDTableViewController&&tableView:didSelectRowAtIndexPath:"
    },
    {
    "DD_TRACKER_EVENTID_KEY":"DDCollectionViewController&&collectionView:didSelectItemAtIndexPath:"
    },
    {
    "DD_TRACKER_EVENTID_KEY":"DDGestureViewController&&gestureLabelClick:"
    }
]
```

## 上报埋点事件

通过校验配置信息中的“ DD_TRACKER_EVENTID_KEY”字段来判断是否发送打点信息。

## 使用方法

```
#import "DDAppDelegate.h"

@implementation DDAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
// Override point for customization after application launch.

//开启打点
[[DDAutoTrackerManager sharedInstance] startWithCompletionBlockWithSuccess:^(NSDictionary *trackerDictionary) {
//成功打点回调
} debug:^(NSDictionary *trackerDictionary) {
//调试模式回调
}];
//开启调试模式
[DDAutoTrackerManager sharedInstance].isDebug = YES;
//读取本地配置文件
NSString * filePath = [[NSBundle mainBundle] pathForResource:@"tracker" ofType:@"json"];
NSData * jsonData = [NSData dataWithContentsOfFile:filePath];
if (jsonData) {
NSError *error;
NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:jsonData options: NSJSONReadingMutableContainers error: &error];
if (nil == error &&
jsonArray) {
[DDAutoTrackerManager sharedInstance].configArray = jsonArray;
}
}

return YES;
}

@end
```

注：建议将"DDAutoTracker.h"引用放在".pch"文件中

#### 数据绑定

大多数情况下，需要绑定一些控件信息。建议使用服务端返回的数据为准。调用“configInfoData:”方法配置需要上报的数据，例：
```
#import "DDViewController.h"

@interface DDViewController ()

@end

@implementation DDViewController

- (void)viewDidLoad {
[super viewDidLoad];
// Do any additional setup after loading the view.
//配置打点info信息
[self configInfoData:@{@"id":@"your id",
@"type":@"your type"}];
}

@end
```

## 结语

如果您觉得本项目对您有帮助，请点"star"支持一下，谢谢！

[文章地址](http://www.jianshu.com/p/9b279c2b1f7d)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

DDAutoTracker is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'DDAutoTracker'
```

## Author

wanghailiang, wanghailiang@luojilab.com

## License

DDAutoTracker is available under the MIT license. See the LICENSE file for more info.

