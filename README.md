# Jukko iOS SDK Documentation

![Jukko](images/intro.png)

Welcome to the Jukko developer SDK documentation for iOS. Follow our step-by-step instructions to
integrate Jukko and start monetizing while converting your app into a catalyst for social
impact today!

If you have any questions during the integration process, you can reach us at [devs@jukko.com](mailto:devs@jukko.com) and we'll get back to you ASAP. Thanks for joining our movement to create a better world and a better way of doing business.

## Integration - CocoaPods

Add our latest pod to your project's podfile:

```podspec
pod 'JukkoSDK'
```

## Importing

Import to access public API.

### Swift

```swift
import JukkoSdk
```

### Objective-C

```obj-c
@import JukkoSdk;
```

## Requirements

The Jukko SDK support devices starting with iOS 10.0.

## Initialization

Initialization has to be done before the Jukko SDK can be customized and launched. The method will need an API key. The API key can be generated in the dashboard after registration.
You can register on [Jukko dashboard](https://dashboard.jukko.com).

After registering, you are ready to `initalize()` with API key:

### Swift

```swift
JukkoSdk.shared.initialize(apiKey: "API_KEY");
```

### Objective-C

```obj-c
[JukkoSdk.shared initializeWithApiKey:@"API_KEY"];
```

## Showing an ad

Next, you can show an ad by calling `showAd()` method:

`Swift`

```swift
JukkoSdk.shared.showAd(){ event in
    // Do your stuff
}
```

`Objective-C`

```obj-c
[JukkoSdk.shared showAdWithCompletion:^(ShowAdResult * event){
    // Do your stuff
}];
```

### Technical notes

1. Completion block of showAd function will be executed every time when you call showAd function, even when called during another showAd call or facing frequency limit.

2. SDK's ViewController is presented on custom window.

## ShowAdResult

When ads presentation is finished, completion block will be executed on caller's thread. It will contain `ShowAdResult` object with the following information:

1. `reason`: Reason why ad was closed. Possible variants are:
    * `closedByUser`: Ad view was closed by user interactions.
    * `timeout`: API servers were unresponsive.
    * `frequencyCapping`: `showAd()` called before frequency capping timeout ended.
    * `error`: Unspecified error. Look at the `message` field for description.
    * `networkConnectivity`: Network connectivity problems.
2. `message`: String containing an extended description of reason.
3. `events`: List of events that happened with ad activity. May be empty. Each event contains:
    * `timestamp` of the event (uses current timezone).
    * `adEvent` type of event. Possible variants:
        * `launch`: Ad activity opened.
        * `adShown`: Ad was shown to user.
        * `adUrlOpened`: User clicked on url, that opened in external browser.
        * `close`: Ad activity closed.

## Frequency capping

The Jukko SDK allows a developer to set frequency capping for ads. It counts the time since the last time when an ad was closed and ignores `showAd()` calls until frequency capping period ends. Frequency capping can be changed using:

* Swift & Objective-C:

```swift
JukkoSdk.shared.adsFrequency = timeInSeconds;
```

Set value to `0` to disable frequency capping.

## Console logging

By default, Jukko SDK logs only important messages, such as unrecoverable error reasons.

You can enable debug logging by calling:

* Swift & Objective-C:

```swift
JukkoSdk.shared.debugMode = true;
```

Log messages will contain `Jukko SDK` tag.
