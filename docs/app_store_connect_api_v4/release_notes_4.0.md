# App Store Connect API 4.0 Release Notes

Update your server-side code to use new features, and test your code against API changes.

## Overview

App Store Connect API version 4.0 provides resources that enable you to automate actions you take in App Store Connect.

### New Features

- **Webhooks** - Use the new `webhooks` endpoints to setup and configure notifications for events that happen with your apps, including App version state events and TestFlight feedback events. For more information about webhook notifications, see [Webhook notifications](https://developer.apple.com/documentation/appstoreconnectapi/webhook-notifications).

- **Accessibility Declarations** - The [Accessibility declarations](https://developer.apple.com/documentation/appstoreconnectapi/accessibility-declarations) resources are now available to automate creating, updating, and reading accessibility declarations for your app per device family. You can also now use [`Modify an App`](https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-apps-_id_) to update the `accessibilityURL` for your app. For more information about accessibility declarations, see [Configuring accessibility declarations for your app](https://developer.apple.com/documentation/appstoreconnectapi/configuring-accessibility-declarations).

- **TestFlight Feedback** - Get TestFlight feedback screenshots and crash logs from beta testers for your apps. For more information about beta-tester feedback, see [Beta feedback crash submissions](https://developer.apple.com/documentation/appstoreconnectapi/beta-feedback-crash-submissions) and [Beta feedback screenshot submissions](https://developer.apple.com/documentation/appstoreconnectapi/beta-feedback-screenshot-submissions).

- **Customer Review Summarizations** - You can now read the customer review summary for your apps by using [`Read customer review summarizations`](https://developer.apple.com/documentation/appstoreconnectapi/get-v1-apps-_id_-customerreviewsummarizations).

- **Background Assets** - You can now manage background assets for your app that you can upload and download separately from the Apple hosted app. For more information about these assets, see [Uploading and versioning Apple hosted background assets](https://developer.apple.com/documentation/appstoreconnectapi/managing-apple-hosted-background-assets).

- **Game Center Activities** - Activities for Game Center resources are now available; for more information, see [Game Center activities](https://developer.apple.com/documentation/appstoreconnectapi/game-center-activities).

- **Game Center Challenges** - You can now setup and configure Game Center challenges. For more information on these challenges, see [Game Center challenges](https://developer.apple.com/documentation/appstoreconnectapi/game-center-challenges).

### Improvements

- XcodeMetrics now includes `recommendedMetricGoal`. Use [`Get Power and Performance Metrics for an App`](https://developer.apple.com/documentation/appstoreconnectapi/get-v1-apps-_id_-perfpowermetrics) to view the available recommendations for your app metrics.

- There are new enums available for `mapAction` when creating or modifying an App Clip advanced experience. To learn more, see [`AppClipAdvancedExperience.Attributes.Place`](https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperience/attributes-data.dictionary/place-data.dictionary).

- [Uploading Assets to App Store Connect](https://developer.apple.com/documentation/appstoreconnectapi/uploading-assets-to-app-store-connect) now shows all media types that support upload to App Store Connect API.

- The attribute `streamlinedPurchasingEnabled` has a default value of `true` for the object [`App.Attributes`](https://developer.apple.com/documentation/appstoreconnectapi/app/attributes-data.dictionary).

- The attribute `APPLE_VISION_PRO` is now documented for [`Device.Attributes`](https://developer.apple.com/documentation/appstoreconnectapi/device/attributes-data.dictionary).

### Deprecations

- The attribute `challengeEnabled` is now deprecated from [`Enable Game Center for an app`](https://developer.apple.com/documentation/appstoreconnectapi/post-v1-gamecenterdetails) and [`Modify a Game Center detail for an app`](https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-gamecenterdetails-_id_). Use `challenges` instead.

- [`Create a leaderboard set member localization`](https://developer.apple.com/documentation/appstoreconnectapi/post-v1-gamecenterleaderboardsetmemberlocalizations) and [`Modify a leaderboard set member localization`](https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-gamecenterleaderboardsetmemberlocalizations-_id_) are deprecated.

### Removals

- Create an App Store version submission is now removed. Use [`Create a review submission`](https://developer.apple.com/documentation/appstoreconnectapi/post-v1-reviewsubmissions) instead.

- The `gamblingAndContests` and `seventeenPlus` properties are now removed from [`Read age rating declaration`](https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appinfos-_id_-ageratingdeclaration) and [`Modify an Age Rating Declaration`](https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-ageratingdeclarations-_id_). Use the `contests` or `gambling` properties instead.

## See Also

### Related Documentation

- [App Store Connect API 3.8 release notes](https://developer.apple.com/documentation/appstoreconnectapi/app-store-connect-api-3-8-release-notes)
- [App Store Connect API 3.7 release notes](https://developer.apple.com/documentation/appstoreconnectapi/app-store-connect-api-3-7-release-notes)
- [App Store Connect API 3.6 release notes](https://developer.apple.com/documentation/appstoreconnectapi/app-store-connect-api-3-6-release-notes)