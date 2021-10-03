---
date: 2018-06-11 05:34
description: "The Apple Watch has become the premier device for health monitoring.
  So now that authorization is setup on the iPhone,\_let's take a look at how get
  authorization setup on the Apple Watch."
tags: Smart Intensity
---
The Apple Watch has become the premier device for health, fitness, and
workout tracking. So now that [authorization is setup on the
iPhone,](https://learningswift.brightdigit.com/healthkit-getting-started/) let\'s
take a look at how get authorization setup on the Apple Watch.

## Authorization on the Apple Watch

Just as on the iPhone, the code will be pretty much identical on the
Apple Watch when it comes to asking for authorization:

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

**However, the Apple Watch does not contain a way for the user to grant
access.** So what this method will do is prompt the user to go to their
iPhone and grant access. This will be through the Health app as the user
did previously on the iPhone example.
![](https://learningswift.brightdigit.com/wp-content/uploads/sites/2/2018/06/Simulator-Screen-Shot-Apple-Watch-Series-3-38mm-2018-06-08-at-14.36.24.png){.size-full
.wp-image-76 .aligncenter width="272" height="486"} On the iPhone app, a
method will need to be implemented in order to listen to this request
and prompt the user with the authorization request. This is where
`AppDelegate.applicationShouldRequestHealthAuthorization` comes in. On
the `AppDelegate`. implement
[`applicationShouldRequestHealthAuthorization`](https://developer.apple.com/documentation/uikit/uiapplicationdelegate/1622998-applicationshouldrequesthealthau)
and call
[`HKHealthKit.handleAuthorizationForExtension`](https://developer.apple.com/documentation/healthkit/hkhealthstore/1614153-handleauthorizationforextension).

    @UIApplicationMain
    class AppDelegate: UIResponder, UIApplicationDelegate {

      ...

      func applicationShouldRequestHealthAuthorization(_ application: UIApplication) {
        let healthStore = HKHealthStore()
        healthStore.handleAuthorizationForExtension { (success, error) -> Void in
          
        }
      }
    }

Now whenever the request for authorization is made on the Apple Watch
and with new `HKObjectType` or `HKSampleType` objects (such as the first
time the app is run), the iPhone will prompt the user with the request.
\[caption id=\"attachment_89\" align=\"aligncenter\"
width=\"640\"\]![iPhone and Apple Watch Simulation of Health Data
Authorization](https://learningswift.brightdigit.com/wp-content/uploads/sites/2/2018/06/ezgif.com-gif-maker.gif){.wp-image-89
.size-full width="640" height="640"} this is what it should look
like\[/caption\] After the prompt is completed by the user, the
`requestAuthorization` callback on the Apple Watch will be called and
from there, the usual code can begin.

## Conclusion

The Apple Watch is a very powerful device for getting health data. To
Apple\'s credit, they are protective of user\'s data and want to make
sure that users are giving that authorization. Since the Apple Watch
does not have the UI to grant that authorization, the API requires the
Apple Watch to:

-   let the user know they need to grant that permission on the iPhone
-   prompt the user with the Health authorization dialog on the iPhone
-   make the call once the authorization is complete on the iPhone
-   handle the result of the authorization from the iPhone on the Apple
    Watch

Following these steps correctly and the app can implement a variety of
powerful health, workout and fitness features.