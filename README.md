# Jukko SDK documentation

Welcome to the Jukko developer SDK documentation. Follow our step-by-step instructions to
integrate Jukko and start monetizing while converting your app into a catalyst for social
impact today!

If you have any questions during the integration process, you can reach us at [devs@jukko.com](mailto:devs@jukko.com)
and we'll get back to you ASAP. Thanks for joining our movement to create a better world and
a better way of doing business.

[TOC]

### Integration - CocoaPods

In your project's podfile write:

```
  pod 'JukkoSdk'
```

### Usage 

Import to access public API.

* Swift: 

```swift
    import JukkoSdk
```
* Objective-C:

```obj-c
    @import JukkoSdk;
```

#### Initialization
Initialization has to be done before Jukko SDK can be customized and launched. The method will need an API key. The API key can be generated in the dashboard after registration.
You can register on [Jukko website](https://jukko.com).

* Swift:

```swift
    JukkoSdk.shared.initialize(apiKey: "API_KEY");
```
* Objective-C:

```obj-c
    [JukkoSdk.shared initializeWithApiKey:@"API_KEY"];
```

#### Showing an ad

You can show an ad by calling `showAd()` method:

* Swift:

```swift
     JukkoSdk.shared.showAd(){(event) in
          // Do your stuff
     }
```
* Objective-C:

```obj-c
	[JukkoSdk.shared showAdWithCompletion:^(AdClosedEvent * event){
        	// Do your stuff
    }];
```
#### AdClosedEvent
When ads presentation is finished, completion block will be executed on caller's thread. It will contain `AdClosedEvent` object with the following information:

1. `reason`: reason why ad was closed. Possible variants are:
    * `closedByUser`: Ad view was closed by user interactions.
    * `timeout`: Api servers were unresponsive.
    * `networkConnectivity`: Network connectivity problems.
    * `frequencyCapping`: `showAd()` called before frequency capping timeout ended.
    * `error`: Unspecified error. Look at the `message` field for description.
2. `message`: string containing an extended description of reason.
3. `events`: list of events that happened with Ad activity. May be null. Each event contains:
    * `timestamp` of the event (uses current timezone).
    * `adEvent` type of event. Possible variants:
        * `launch`: Ad activity opened.
        * `close`: Ad activity closed.
        * `introShown`: NPO campaign intro was shown to user.
        * `progressShown`: NPO campaign progress was shown to user.
        * `outroShown`: NPO campaign outro was shown to user.
        * `adShown`: Ad was shown to user.
        * `adUrlOpened`: user clicked on url, that opened in external browser.

##### Technical notes:
1.  Completion block of showAd function will be executed every time when you call showAd function: even when called during another showAd call or facing frequency limit.

2.  SDK's WebViewController is presented modally by `present` function of application's rootViewController.

	Presenting 2 viewControllers simultaneously by one parent VC is not allowed by Apple. Keep this in mind, don't call `showAd` function if, for example, AlertViewController is already presented, advert won't be shown.


#### Frequency capping

Jukko SDK allows a developer to set frequency capping for ads. It counts the time since the last time when an ad was closed and ignores `showAd()` calls until frequency capping period ends. Frequency capping can be changed using:

* Swift & Objective-C:

```swift
    JukkoSdk.shared.adsFrequency = timeInSeconds;
```

Default value is 0.


#### Console logging

By default, Jukko SDK logs only important messages, like unrecoverable error reasons.

You can enable debug logging by calling:

* Swift & Objective-C:

```swift
    JukkoSdk.shared.debugMode = true;
```
Log messages will contain `Jukko SDK` tag.

### Requirements

Jukko SDK support devices starting with iOS 10.0.