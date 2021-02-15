---
date: 2018-06-11 05:34
tags: Smart Intensity
---
# HealthKit – Apple Watch – Data and Authorization


The Apple Watch has become the premier device for health, fitness, and workout tracking. So now that authorization is setup on the iPhone, let's take a look at how get authorization setup on the Apple Watch.





## Authorization on the Apple Watch

```swift
if HKHealthStore.isHealthDataAvailable() {
  let healthStore = HKHealthStore()
  let heartRateQuantityType = HKObjectType.quantityType(forIdentifier: .heartRate)!
  let allTypes = Set([HKObjectType.workoutType(),
                      heartRateQuantityType
    ])
  healthStore.requestAuthorization(toShare: nil, read: allTypes) { (result, error) in
    if let error = error {
      // deal with the error
      return
    }
    guard result else {
      // deal with the failed request 
      return
    }
    // begin any necessary work if needed
  }
}

```

**However, the Apple Watch does not contain a way for the user to grant access.**

![](https://learningswift.brightdigit.com/wp-content/uploads/sites/2/2018/06/Simulator-Screen-Shot-Apple-Watch-Series-3-38mm-2018-06-08-at-14.36.24.png)

```swift
AppDelegate.applicationShouldRequestHealthAuthorization
```

```swift
AppDelegate
```

[applicationShouldRequestHealthAuthorization](https://developer.apple.com/documentation/uikit/uiapplicationdelegate/1622998-applicationshouldrequesthealthau)

[HKHealthKit.handleAuthorizationForExtension](https://developer.apple.com/documentation/healthkit/hkhealthstore/1614153-handleauthorizationforextension)

```swift
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  ...

  func applicationShouldRequestHealthAuthorization(_ application: UIApplication) {
    let healthStore = HKHealthStore()
    healthStore.handleAuthorizationForExtension { (success, error) -> Void in
      
    }
  }
}

```

```swift
HKObjectType
```

```swift
HKSampleType
```

![iPhone and Apple Watch Simulation of Health Data Authorization](https://learningswift.brightdigit.com/wp-content/uploads/sites/2/2018/06/ezgif.com-gif-maker.gif)

```swift
requestAuthorization
```

## Conclusion

-   let the user know they need to grant that permission on the iPhone
-   prompt the user with the Health authorization dialog on the iPhone
-   make the call once the authorization is complete on the iPhone
-   handle the result of the authorization from the iPhone on the Apple Watch