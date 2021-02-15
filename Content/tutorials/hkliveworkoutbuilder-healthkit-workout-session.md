---
date: 2018-06-18 07:23
tags: Smart Intensity
---
# HealthKit Workout Session with HKLiveWorkoutBuilder


We have setup the iPhone to request authorization and the Apple Watch. Let's begin a workout and track the user's heart rate with HKLiveWorkoutBuilder. In short, HKLiveWorkoutBuilder simplifies the way we track health data during workouts.


## Starting a HKWorkoutSession


To start a workout, you'll need the HKHealthStore, which was instantiated in the first step, as well as the HKWorkoutConfiguration which defines the activity type and location type of the workout you are doing. With those you can create the HKWorkoutSession with:


```swift
func startWorkoutWithHealthStore(_ healthStore: HKHealthStore, 
                                 andActivityType activityType: HKWorkoutActivityType
                                ) -> HKWorkoutSession {
  let configuration = HKWorkoutConfiguration()
  configuration.activityType = activityType
  
  let session : HKWorkoutSession
  do {
    session = try HKWorkoutSession(healthStore: healthStore, configuration: configuration)
  } catch let error {
    // let the user know about the error
    return
  }
  
  session.startActivity(with: Date())
  self.session = session
  self.healthStore = healthStore
  return session  
}
```


Since this call can throw an error, be sure to catch and handle that error properly. When the workout is completed you simply call session.end() to end the workout session.



To listen to workout state changes, implement the delegate HKWorkoutSessionDelegate and the method workoutSession(HKWorkoutSession, didChangeTo: HKWorkoutSessionState, fromState: HKWorkoutSessionState, date: Date):


```swift
func workoutSession(_ workoutSession: HKWorkoutSession, 
    didChangeTo toState: HKWorkoutSessionState, 
    from fromState: HKWorkoutSessionState, 
    date: Date) {

    DispatchQueue.main.async {
      // based on the change update the UI on the main thread
    }
  }
```

## Observing Changes


To track health data, you are going to want to use one of the plethora of HKQuery types but most likely a combination of HKObserverQuery and HKSampleQuery. The HKObserverQuery will indicate when a change has been made. HKSampleQuery will query the actual values.


```swift
  func observerQuery(_ query: HKObserverQuery, 
                     hasCompleted completed: HKObserverQueryCompletionHandler, 
                     withError error: Error?) {
    guard let healthStore = self.healthStore else {
      #warning("Throw Error Message to User if no healthStore available")
      return
    }
    guard let sampleType = query.objectType as? HKSampleType else {
      completed()
      return
    }
    // only query for the latest value
    let sort = [
      NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
    ]
    let sampleQuery = HKSampleQuery(sampleType: sampleType, predicate: nil, limit: 1, sortDescriptors: sort, resultsHandler: self.sampleQuery)
    
    healthStore.execute(sampleQuery)
    
  }
  
  func sampleQuery(_ query: HKSampleQuery, 
                   withSamples samples: [HKSample]?, 
                   andError error: Error?) {
    guard let quantityType = query.objectType as? HKQuantityType else {
      return
    }
    
    if let error = error {
      #warning("Theres an error with the query")
      return
    }
    
    guard let sample = samples?.first as? HKQuantitySample else {
      #warning("Theres no sample with the query.")
      return
    }
    
    DispatchQueue.main.async {
      // update the UI here
    }
  }  
```


When the workout is started, we begin the set of HKObserverQueries. In our callback, observerQuery(HKObserverQuery, hasCompleted: HKObserverQueryCompletionHandler,                      withError: Error?), if the objectType is a HKSampleType then we create a HKSampleQuery for the latest sample from that data.



On the HKSampleQuery callback, sampleQuery(HKSampleQuery, withSamples: [HKSample]?, andError: Error?), we get the quantity from the sample and update the UI on the main thread with that data .


## HKLiveWorkoutBuilder


While the process, isn't the most complicated, the frequency of results its very often. Luckily, HKLiveWorkoutBuilder simplifies the process while giving the app more frequent data. In short, HKWorkoutBuilder and its watchOS specific version HKLiveWorkoutBuilder makes it easy to build workouts, start them, and track data during a workout.



From WWDC 2018, we see a few changes made in the API with how to create and start a  HKWorkoutSession. However the main change is in how the we are creating a HKLiveWorkoutBuilder.


```swift
  func startWorkoutWithHealthStore(_ healthStore: HKHealthStore, andActivityType activityType: HKWorkoutActivityType, withSampleTypes sampleTypes: [HKSampleType]) -> HKWorkoutSession {
    let configuration = HKWorkoutConfiguration()
    configuration.activityType = activityType
    
    let session : HKWorkoutSession
    do {
      session = try HKWorkoutSession(healthStore: healthStore, configuration: configuration)
    } catch let error {
      // let the user know about the error
      return
    }

    let builder = session.associatedWorkoutBuilder()
    builder.delegate = self
    builder.dataSource = HKLiveWorkoutDataSource(healthStore: healthStore, workoutConfiguration: configuration) 
    session.delegate = self

    self.builder = builder
    self.session = session
    self.healthStore = healthStore

    session.startActivity(with: Date())

    builder.beginCollection(withStart: Date()) { (success, error) in
      // do something when the data collection begins
    }

    return session  
  }
```


As you can see we are passing a delegate to the HKLiveWorkoutBuilder. This is so we can collect health data as the workout progresses.


```swift
  func workoutBuilder(_ workoutBuilder: HKLiveWorkoutBuilder, 
    didCollectDataOf collectedTypes: Set<HKSampleType>) {
    
    for sampleType in collectedTypes {
      if let quantityType = sampleType as? HKQuantityType {
        guard let statistic = workoutBuilder.statistics(for: quantityType) else {
          continue
        }
        guard let quantity = statistic.mostRecentQuantity() else {
          continue
        }
        DispatchQueue.main.async {
          // update the UI based on the most recent quantitiy
        }
      } else {
        // handle other HKSampleType subclasses
      }
    }
  }
```


In the method workoutBuilder(HKLiveWorkoutBuilder, didCollectDataOf: Set), you can update the UI based on the data collected. For HKQuantityType, you can access the data by calling HKWorkoutBuilder.statistics(for: HKQuantityType). An HKStatistics object contains a variety of statistical info and in watchOS 5 added the method HKStatistics.mostRecentQuantity() which returns the most recent value. If you only need the most recent data, you can update your UI with that data on the main thread.


## Conclusion


The ability to create, manage, and track workouts in watchOS is simpler with HKWorkoutBuilder


-   HKWorkoutSessionDelegate allows you track the state of the workout session and update the UI accordingly.
-   You can track the health data using a combination of HKObserverQuery and other HKQuery subclasses such as HKSampleQuery to query HKSample data.
-   However, HKLiveWorkoutBuilder allows you to collect the workout data more frequently without needing to use queries.


If you are interested in learning more, watch the presentation, New Ways to Work with Workouts from WWDC 2018. For more info on how to develop with HealthKit, take a look at our recent posts here and for sign up for updates here.