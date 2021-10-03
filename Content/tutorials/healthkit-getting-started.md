---
date: 2018-05-25 04:05
description: HealthKit is the most important API when it comes to building health,
  fitness and workout apps. HealthKit also has many intricacies and details which
  need introduction when getting started such as HKObjectType and HKHealthStore.
tags: Smart Intensity
---
HealthKit is the most important API when it comes to building health,
fitness and workout apps. HealthKit also has many intricacies and
details which need introduction when getting started. The data
structures encourage precision while having the flexibility to store a
variety of values. The way it asks users give app access HealthKit will
probably be similar with many iOS developers. HealthKit follows many
patterns in other iOS APIs such as Core Location or Core Data. At the
same time it uses newer programming techniques and newer technology.

## Why I Am Building a Workout App

As an independent software developer, exercise is an important part of
my schedule. It keeps me healthy, my mind active, and my body
stimulated. In order to make the most of my time, I started looking into
**[High-intensity interval
training](https://en.m.wikipedia.org/wiki/High-intensity_interval_training)**.
**High-intensity interval training** has many benefits but the main
strategy is to switch between breif periods of high levels and low
levels for an extended period of time. For instance, I've started
exercising on the stair stepper for 30 minutes. In that period of time,
I'll alternative the speed on the machine to get my heart rate to
fluctuate between  150 and 125 beats per minute - for 15 - 30 seconds
each. Right now I use the built-in Workout app on my Apple Watch and
check my heart rate throughout my exercise. \[caption
id=\"attachment_33\" align=\"alignnone\"
width=\"1024\"\]![](https://learningswift.brightdigit.com/wp-content/uploads/sites/2/2018/05/IMG_208F0706D0D0-1-1024x534.jpeg){.wp-image-33
.size-large width="1024" height="534"} An example of one of my workouts.
Notice how fluctuate my heart rate with the intensity of the
workout.\[/caption\] However **a custom app which could notify me of
when I reach certain heart rates for a period of time would be better.**
As an Apple Watch owner, who has built his fair share of apps for the
Apple Watch since day one, this presents itself as a great opportunity
to learn more about HealthKit.

## HealthKit Structure - QuantityTypes and WorkoutTypes

One of the key classes in HealthKit is `HKObjectType`. `HKObjectType` is
the base class which defines different data types. For instance in the
case of heart rate, will be a `HKQuantitiyType` . To access specific
types, call
`HKQuantity.quantityType(forIdentifier: HKQuantityTypeIdentifier)` with
the correct `HKQuantityTypeIdentifier` . For instance to get the heart
rate `HKQuantityType`:
`HKObjectType.quantityType(forIdentifier: .heartRate)`Another
`HKObjectType` is `HKWorkoutType`, which is accessed by calling
`HKObjectType.workoutType()`. \[caption id=\"attachment_41\"
align=\"aligncenter\"
width=\"800\"\]![](https://learningswift.brightdigit.com/wp-content/uploads/sites/2/2018/05/diagram.png){.wp-image-41
.size-full width="800" height="275"} HKObjectType Hierarchy\[/caption\]
The first thing we are going to use with these types is request
permission from the user to read and write to HealthKit.

## Requesting Authorization in HealthKit

One thing Apple tries to do their best at is making sure the user gives
permission to various APIs. Just as with location info and
notifications, **the user must allow an app permission in order to
access HealthKit**. The first thing which needs to be done, is to check
if HealthKit is available by calling
`HKHealthStore.isHealthDataAvailable()`. If HealthKit is unavailable
(such as on the IPad), deliver a notice to the user. Next get access to
HealthKit via the class, `HKHealthStore`. Call `HKHealthStore()` to
instantiate an object to use throughout your app. With the
`HKHealthStore` object, request authorization through the
`.requestAuthoriation(toShare:, read:, completion:)` method. The
`toShare` and `read` parameters take an optional `Set` of `HKSampleType`
(`HKObjectType` subclass for data samples) to write and an optional
`Set` of `HKObjectType` to read from. \[caption id=\"attachment_42\"
align=\"aligncenter\"
width=\"505\"\]![](https://learningswift.brightdigit.com/wp-content/uploads/sites/2/2018/05/Artboard-1-253x300.png){.wp-image-42
width="505" height="600"} Diagram of Requesting
Authorization\[/caption\] **Whenever this method with new**
`HKObjectType` **or** `HKSampleType` **objects (such as the first time
the app is run), the permission screen is shown.** `requestAuthoriation`
is an asynchronous method, which means the `completion` is called once
the request has been completed. The `completion`  closure is where
you\'d begin to interact with the user and begin queries for data. Let's
take a look at how to properly with request authorization.

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

## Conclusion

HealthKit is a complex but an easily workable API for building workout
and health app.

-   `HKObjectType` - the base class for HealthKit data.
-   `HKHealthStore` - the access point for requesting authorization to
    read and data.
-   `.requestAuthoriation(toShare:, read:, completion:)` - requests
    authorization of what data to read and write on a `HKHealthStore`
    object.
-   When any change is made to the authorization requested, the
    permission sheet will show.