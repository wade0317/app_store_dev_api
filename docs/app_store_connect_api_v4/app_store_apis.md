# App Store APIs

Manage all aspects of your app, App Clips, in-app purchases, and customer reviews in the App Store.

## Apps and App Metadata

### Apps
- **Description**: Manage your apps in App Store Connect
- **Endpoint Base**: `/v1/apps`
- **Operations**: Create, read, update, delete apps
- **Documentation**: [Apps API](https://developer.apple.com/documentation/appstoreconnectapi/apps)

### App Metadata
- **Description**: Manage the metadata of apps in App Store Connect
- **Endpoint Base**: `/v1/appInfos`, `/v1/appInfoLocalizations`
- **Operations**: Update app information, descriptions, keywords, categories
- **Documentation**: [App Metadata API](https://developer.apple.com/documentation/appstoreconnectapi/app-metadata)

### Custom Product Pages and Localizations
- **Description**: Create and manage your app's custom product pages and localizations
- **Endpoint Base**: `/v1/appCustomProductPages`
- **Operations**: Create custom product pages, manage localizations
- **Documentation**: [Custom Product Pages API](https://developer.apple.com/documentation/appstoreconnectapi/custom-product-pages-and-localizations)

### App Events and Metadata
- **Description**: Create and schedule in-app events and manage in-app event metadata
- **Endpoint Base**: `/v1/inAppEvents`
- **Operations**: Create, update, delete in-app events
- **Documentation**: [App Events API](https://developer.apple.com/documentation/appstoreconnectapi/app-events-and-metadata)

## App Clips

### App Clips and App Clip Experiences
- **Description**: Read App Clip information and manage App Clip experiences
- **Endpoint Base**: `/v1/appClips`, `/v1/appClipExperiences`
- **Operations**: Create and manage App Clip experiences
- **Documentation**: [App Clips API](https://developer.apple.com/documentation/appstoreconnectapi/app-clips-and-app-clip-experiences)

## Builds

### Builds
- **Description**: Manage builds for testers and submit builds for review
- **Endpoint Base**: `/v1/builds`
- **Operations**: List builds, get build details, update build metadata
- **Key Endpoints**:
  - `GET /v1/builds` - List builds
  - `GET /v1/builds/{id}` - Get build details
  - `PATCH /v1/builds/{id}` - Update build
- **Documentation**: [Builds API](https://developer.apple.com/documentation/appstoreconnectapi/builds)

### Build Bundles
- **Description**: Read metadata for app and App Clip binaries included in a build
- **Endpoint Base**: `/v1/buildBundles`
- **Operations**: Get build bundle information
- **Documentation**: [Build Bundles API](https://developer.apple.com/documentation/appstoreconnectapi/build-bundles)

### Build Icons
- **Description**: Get icons from your app's binary that are uploaded to App Store
- **Endpoint Base**: `/v1/buildIcons`
- **Operations**: Retrieve build icons
- **Documentation**: [Build Icons API](https://developer.apple.com/documentation/appstoreconnectapi/build-icons)

### App Encryption Declarations
- **Description**: View and assign to builds, the declarations about types of encryption used in your app
- **Endpoint Base**: `/v1/appEncryptionDeclarations`
- **Operations**: Manage encryption declarations
- **Documentation**: [App Encryption Declarations API](https://developer.apple.com/documentation/appstoreconnectapi/app-encryption-declarations)

## In-App Purchases and Subscriptions

### In-App Purchase
- **Description**: Create and manage in-app purchases, including localizations, price schedules, and submissions for review
- **Endpoint Base**: `/v1/inAppPurchases`
- **Operations**: Create, update, delete in-app purchases
- **Key Endpoints**:
  - `GET /v1/inAppPurchases` - List in-app purchases
  - `POST /v1/inAppPurchases` - Create in-app purchase
  - `GET /v1/inAppPurchases/{id}` - Get in-app purchase details
  - `PATCH /v1/inAppPurchases/{id}` - Update in-app purchase
- **Documentation**: [In-App Purchase API](https://developer.apple.com/documentation/appstoreconnectapi/in-app-purchase)

### Auto-Renewable Subscriptions
- **Description**: Create and manage auto-renewable subscriptions, including managing subscription groups and submissions for review
- **Endpoint Base**: `/v1/subscriptions`, `/v1/subscriptionGroups`
- **Operations**: Manage subscription groups, subscription products, and pricing
- **Documentation**: [Auto-Renewable Subscriptions API](https://developer.apple.com/documentation/appstoreconnectapi/auto-renewable-subscriptions)

### Promoted Purchases
- **Description**: Manage promoted in-app purchases and auto-renewable subscriptions, including their visibility and images
- **Endpoint Base**: `/v1/promotedPurchases`
- **Operations**: Manage promoted purchase visibility and assets
- **Documentation**: [Promoted Purchases API](https://developer.apple.com/documentation/appstoreconnectapi/promoted-purchases-top)

### Win-back Offers
- **Description**: Create and manage win-back offers for your auto-renewable subscriptions
- **Endpoint Base**: `/v1/winBackOffers`
- **Operations**: Create and manage win-back offers
- **Documentation**: [Win-back Offers API](https://developer.apple.com/documentation/appstoreconnectapi/win-back-offers)

### In-App Purchase and Subscription App Store Review Submissions
- **Description**: Manage submissions for App Store Review for in-app purchases and auto-renewable subscriptions, including their screenshots
- **Endpoint Base**: `/v1/inAppPurchaseSubmissions`
- **Operations**: Submit in-app purchases for review
- **Documentation**: [IAP Review Submissions API](https://developer.apple.com/documentation/appstoreconnectapi/in-app-purchase-and-subscription-app-store-review-submissions)

### Testing In-App Purchase and Subscriptions
- **Description**: Test in-app purchases and subscriptions in sandbox environment
- **Endpoint Base**: `/v1/sandboxTesters`
- **Operations**: Manage sandbox testers for IAP testing
- **Documentation**: [Testing IAP API](https://developer.apple.com/documentation/appstoreconnectapi/testing-in-app-purchase-and-subscriptions)

## Customer Reviews and Responses

### Customer Reviews
- **Description**: Get the customer reviews for your app
- **Endpoint Base**: `/v1/customerReviews`
- **Operations**: Retrieve customer reviews and ratings
- **Key Endpoints**:
  - `GET /v1/customerReviews` - List customer reviews
  - `GET /v1/customerReviews/{id}` - Get review details
- **Documentation**: [Customer Reviews API](https://developer.apple.com/documentation/appstoreconnectapi/customer-reviews)

### Customer Review Responses
- **Description**: Get, create, update, and delete your responses to customer reviews
- **Endpoint Base**: `/v1/customerReviewResponses`
- **Operations**: Manage responses to customer reviews
- **Key Endpoints**:
  - `GET /v1/customerReviewResponses` - List review responses
  - `POST /v1/customerReviewResponses` - Create review response
  - `PATCH /v1/customerReviewResponses/{id}` - Update review response
  - `DELETE /v1/customerReviewResponses/{id}` - Delete review response
- **Documentation**: [Customer Review Responses API](https://developer.apple.com/documentation/appstoreconnectapi/customer-review-responses)

## App Pricing and Availability

### Territories
- **Description**: Get a list of active App Store storefronts in which you make your app available
- **Endpoint Base**: `/v1/territories`
- **Operations**: List available territories
- **Key Endpoints**:
  - `GET /v1/territories` - List territories
- **Documentation**: [Territories API](https://developer.apple.com/documentation/appstoreconnectapi/territories)

## App Store Review Submissions

### Review Submissions
- **Description**: Create and manage your submissions for review, which can include your App Store version, App Store version experiments, custom product page versions, and in-app events
- **Endpoint Base**: `/v1/reviewSubmissions`
- **Operations**: Create and manage review submissions
- **Documentation**: [Review Submissions API](https://developer.apple.com/documentation/appstoreconnectapi/review-submissions)

### Review Submission Items
- **Description**: Manage the contents of your review submission, which can include your App Store version, App Store version experiments, custom product page versions, and in-app events
- **Endpoint Base**: `/v1/reviewSubmissionItems`
- **Operations**: Add/remove items from review submissions
- **Documentation**: [Review Submission Items API](https://developer.apple.com/documentation/appstoreconnectapi/review-submission-items)

### App Store Review Details
- **Description**: Manage the required information you provide for App Review
- **Endpoint Base**: `/v1/appStoreReviewDetails`
- **Operations**: Update review information and attachments
- **Documentation**: [App Store Review Details API](https://developer.apple.com/documentation/appstoreconnectapi/app-store-review-details)

### App Clip App Store Review Details
- **Description**: Manage required App Clip information you provide for App Review
- **Endpoint Base**: `/v1/appClipAppStoreReviewDetails`
- **Operations**: Update App Clip review information
- **Documentation**: [App Clip Review Details API](https://developer.apple.com/documentation/appstoreconnectapi/app-clip-app-store-review-details)

### App Store Review Attachments
- **Description**: Manage the attachments you upload to App Store Connect for App Review
- **Endpoint Base**: `/v1/appStoreReviewAttachments`
- **Operations**: Upload and manage review attachments
- **Documentation**: [Review Attachments API](https://developer.apple.com/documentation/appstoreconnectapi/app-store-review-attachments)

### App Store Version Submissions
- **Description**: Submit versions of your app to App Review
- **Endpoint Base**: `/v1/appStoreVersionSubmissions`
- **Operations**: Submit app versions for review
- **Documentation**: [Version Submissions API](https://developer.apple.com/documentation/appstoreconnectapi/app-store-version-submissions)

### Actors
- **Description**: Get information about who or which service made a review submission
- **Endpoint Base**: `/v1/actors`
- **Operations**: Get actor information
- **Documentation**: [Actors API](https://developer.apple.com/documentation/appstoreconnectapi/actors)

## App Store Publishing

### App Store Version Phased Releases
- **Description**: Manage phased releases of updates to your app
- **Endpoint Base**: `/v1/appStoreVersionPhasedReleases`
- **Operations**: Create, pause, resume phased releases
- **Documentation**: [Phased Releases API](https://developer.apple.com/documentation/appstoreconnectapi/app-store-version-phased-releases)

### App Store Version Release Requests
- **Description**: Manually release an App Store approved version of your app to the App Store
- **Endpoint Base**: `/v1/appStoreVersionReleaseRequests`
- **Operations**: Request manual release of approved versions
- **Documentation**: [Release Requests API](https://developer.apple.com/documentation/appstoreconnectapi/app-store-version-release-requests)

### App Pre-Orders
- **Description**: Manage the settings that make your app available for pre-order
- **Endpoint Base**: `/v1/appPreOrders`
- **Operations**: Configure pre-order availability
- **Documentation**: [App Pre-Orders API](https://developer.apple.com/documentation/appstoreconnectapi/app-pre-orders)

### App Availability
- **Description**: Manage territory and date settings that make your app available for pre-order
- **Endpoint Base**: `/v1/appAvailabilities`
- **Operations**: Configure app availability by territory
- **Documentation**: [App Availability API](https://developer.apple.com/documentation/appstoreconnectapi/app-availability)

## Apple Hosted Background Assets

### Background Assets
- **Description**: Assets for your app that you can upload and download separately from the Apple hosted app
- **Endpoint Base**: `/v1/backgroundAssets`
- **Operations**: Upload and manage background assets
- **Documentation**: [Background Assets API](https://developer.apple.com/documentation/appstoreconnectapi/background-assets)

## Featuring Nominations

### Featuring Nominations
- **Description**: Tell Apple about a noteworthy app or update to an existing one for consideration for featuring opportunities
- **Endpoint Base**: `/v1/featuringNominations`
- **Operations**: Submit featuring nominations
- **Documentation**: [Featuring Nominations API](https://developer.apple.com/documentation/appstoreconnectapi/featuring-nominations)

## App Store Version Experiments

### App Store Version Experiments
- **Description**: Test elements of your App Store product page
- **Endpoint Base**: `/v1/appStoreVersionExperiments`
- **Operations**: Create and manage A/B tests for app store pages
- **Documentation**: [Version Experiments API](https://developer.apple.com/documentation/appstoreconnectapi/app-store-version-experiments)

### App Store Version Experiment Treatments
- **Description**: Create and update the metadata and the optional icon that represent the treatment you apply to an App Store version experiment
- **Endpoint Base**: `/v1/appStoreVersionExperimentTreatments`
- **Operations**: Manage experiment treatments
- **Documentation**: [Experiment Treatments API](https://developer.apple.com/documentation/appstoreconnectapi/app-store-version-experiment-treatments)

### App Store Version Experiment Treatment Localizations
- **Description**: Manage the localized assets, including screenshots and previews, for an App Store version experiment treatment
- **Endpoint Base**: `/v1/appStoreVersionExperimentTreatmentLocalizations`
- **Operations**: Manage localized experiment assets
- **Documentation**: [Treatment Localizations API](https://developer.apple.com/documentation/appstoreconnectapi/app-store-version-experiment-treatment-localizations)

### App Store Version Promotions
- **Description**: Apply a version experiment treatment to your app's product page in the App Store, or to your upcoming App Store version
- **Endpoint Base**: `/v1/appStoreVersionPromotions`
- **Operations**: Promote experiment treatments
- **Documentation**: [Version Promotions API](https://developer.apple.com/documentation/appstoreconnectapi/app-store-version-promotions)

## Common Request Patterns

### Authentication
All App Store API requests require JWT authentication:
```http
Authorization: Bearer YOUR_JWT_TOKEN
Content-Type: application/json
```

### Filtering and Includes
Most list endpoints support filtering and including related resources:
```http
GET /v1/apps?filter[platform]=IOS&include=appInfos
```

### Pagination
List responses include pagination information:
```json
{
  "data": [...],
  "links": {
    "first": "...",
    "next": "...",
    "self": "..."
  },
  "meta": {
    "paging": {
      "total": 100,
      "limit": 20
    }
  }
}
```

### Error Handling
Errors follow JSON API format:
```json
{
  "errors": [
    {
      "id": "...",
      "status": "400",
      "code": "PARAMETER_ERROR.INVALID",
      "title": "A parameter has an invalid value",
      "detail": "The provided entity includes an invalid relationship"
    }
  ]
}
```