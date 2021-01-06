# rn-screenshot-detector

## Getting started

Install

`$ yarn add rn-screenshot-detector`

React Native >= 0.60.0

`pod install` inside of the ios sub folder

#### IOS
Edit file `AppDelegate.m`
```objectivec
#import <RNScreenshotDetector/RNScreenshotDetector.h>

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  // ... setup code

  // Somewhere React Native will have placed something like
  RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL...]

  // Somewhere below this you can setup the screenshot detector to listen for events
  RNScreenshotDetector* screenshotDetector = [[RNScreenshotDetector alloc] init];
  [screenshotDetector setupAndListen:rootView.bridge];
}
```

React Native < 0.60.0

### Mostly automatic installation

`$ react-native link rn-screenshot-detector`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-screenshot-detector` and add `RnScreenShot.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRnScreenShot.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainApplication.java`
  - Add `import com.reactlibrary.RnScreenShotPackage;` to the imports at the top of the file
  - Add `new RnScreenShotPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-screenshot-detector'
  	project(':react-native-screenshot-detector').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-screenshot-detector/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-screenshot-detector')
  	```


## Usage
```javascript
import { DisableScreenShot, EnableScreenShot } from 'rn-screenshot-detector'


componentDidMount(){
	...
	DisableScreenShot(this.callBack);
}

componentWillUnmount(){
	...
	EnableScreenShot()
}

callBack=()=>{
Alert.alert("Warning","It isn't safe to take a screenshot")
}
```
For ios, we can not disable screenshot, so we just detect action screenshot.
For android, any action screenshot or recording screen will be return black screen. 
