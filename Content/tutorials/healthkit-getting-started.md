---
date: 2018-05-25 04:05
tags: Smart Intensity
---
# HealthKit - Getting Started - HKObjectType and Authorization


HealthKit is the most important API when it comes to building health, fitness and workout apps. HealthKit also has many intricacies and details which need introduction when getting started.

The data structures encourage precision while having the flexibility to store a variety of values. The way it asks users give app access HealthKit will probably be similar with many iOS developers. HealthKit follows many patterns in other iOS APIs such as Core Location or Core Data. At the same time it uses newer programming techniques and newer technology.





## Why I Am Building a Workout App

**High-intensity interval training**

**High-intensity interval training**

![](https://learningswift.brightdigit.com/wp-content/uploads/sites/2/2018/05/IMG_208F0706D0D0-1-1024x534.jpeg)

** a custom app which could notify me of when I reach certain heart rates for a period of time would be better.**

## HealthKit Structure - QuantityTypes and WorkoutTypes

```swift
HKObjectType
```

```swift
HKObjectType
```

```swift
HKQuantitiyType
```

```swift
HKQuantity.quantityType(forIdentifier: HKQuantityTypeIdentifier)
```

```swift
HKQuantityTypeIdentifier
```

```swift
HKQuantityType
```

```swift
HKObjectType.quantityType(forIdentifier: .heartRate)

```

```swift
HKObjectType
```

```swift
HKWorkoutType
```

```swift
HKObjectType.workoutType()
```

![](https://learningswift.brightdigit.com/wp-content/uploads/sites/2/2018/05/diagram.png)

## Requesting Authorization in HealthKit

**the user must allow an app permission in order to access HealthKit**

```swift
HKHealthStore.isHealthDataAvailable()
```

```swift
HKHealthStore
```

```swift
HKHealthStore()
```

```swift
HKHealthStore
```

```swift
.requestAuthoriation(toShare:, read:, completion:)
```

```swift
toShare
```

```swift
read
```

```swift
Set
```

```swift
HKSampleType
```

```swift
HKObjectType
```

```swift
Set
```

```swift
HKObjectType
```

![](https://learningswift.brightdigit.com/wp-content/uploads/sites/2/2018/05/Artboard-1-253x300.png)

**Whenever this method with new **

```swift
HKObjectType
```

** or **

```swift
HKSampleType
```

** objects (such as the first time the app is run), the permission screen is shown.**

```swift
requestAuthoriation
```

```swift
completion
```

```swift
completion
```

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

## Conclusion

-   HKObjectType - the base class for HealthKit data.
-   HKHealthStore - the access point for requesting authorization to read and data.
-   .requestAuthoriation(toShare:, read:, completion:) - requests authorization of what data to read and write on a HKHealthStore object.
-   When any change is made to the authorization requested, the permission sheet will show.