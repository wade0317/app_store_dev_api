# App Store Connect API v4.0 Complete Upgrade Plan

This document contains all new API endpoints and features discovered in App Store Connect API v4.0.

## Overview

App Store Connect API v4.0 introduces several new endpoint categories:
1. **Webhooks** - Event-driven notifications
2. **Background Assets** - Apple hosted background assets management
3. **Accessibility Declarations** - Accessibility information management
4. **Customer Review Summarizations** - Review summary endpoints
5. **TestFlight Beta Feedback** - Enhanced beta feedback with crash and screenshot data

---

## 1. Webhooks Endpoints (App Store Connect API 4.0+)

### Managing Webhook Notifications

#### GET Endpoints
- `GET /v1/apps/{id}/webhooks` - Read webhook information for an app
- `GET /v1/webhooks/{id}` - Read webhook information
- `GET /v1/webhooks/{id}/deliveries` - Read the deliveries for a webhook
- `GET /v1/webhooks/{id}/relationships/deliveries` - Get webhook delivery relationships

#### POST Endpoints
- `POST /v1/webhooks` - Create a webhook configuration
  - **Request Body**: `WebhookCreateRequest`
  - **Response**: `WebhookResponse` (201 Created)
- `POST /v1/webhookdeliveries` - Redeliver a previous notification
  - **Request Body**: `WebhookDeliveryCreateRequest`
- `POST /v1/webhookpings` - Test your webhook
  - **Request Body**: `WebhookPingCreateRequest`

#### PATCH Endpoints
- `PATCH /v1/webhooks/{id}` - Modify a webhook configuration
  - **Request Body**: `WebhookUpdateRequest`

#### DELETE Endpoints
- `DELETE /v1/webhooks/{id}` - Delete a webhook

### Webhook Objects and Types
- `object Webhook` - The data structure that represents a webhook resource
- `object WebhookCreateRequest` - The request body to create a webhook
- `object WebhookDeliveriesResponse` - Response containing webhook deliveries list
- `object WebhookDelivery` - Webhook delivery resource data structure
- `object WebhookDeliveryCreateRequest` - Request body for webhook delivery creation
- `object WebhookDeliveryResponse` - Single webhook delivery response
- `object WebhookEvent` - Webhook event resource data structure
- `object WebhookPing` - Webhook ping resource data structure
- `object WebhookPingCreateRequest` - Request body for webhook ping creation
- `object WebhookPingResponse` - Single webhook ping response
- `object WebhookResponse` - Single webhook response
- `object WebhookUpdateRequest` - Request body to update a webhook
- `object WebhooksResponse` - Response containing webhooks list
- `type WebhookEventType` - String representing webhook event types
- `object WebhookDeliveriesLinkagesResponse` - Webhook deliveries linkages response
- `object AppWebhooksLinkagesResponse` - App webhooks linkages response

---

## 2. Background Assets Endpoints (Apple Hosted Background Assets)

### Getting Background Asset Information
- `GET /v1/apps/{id}/backgroundassets` - List all assets packs for an app
- `GET /v1/apps/{id}/relationships/backgroundassets` - List the assets packs IDs for an app

### Relating Background Assets to Your App
- `POST /v1/backgroundassets` - Create asset pack record
- `POST /v1/backgroundassetversions` - Create asset pack version record

### Uploading Background Asset Files
- `PATCH /v1/backgroundassetuploadfiles/{id}` - Commit an uploaded asset pack to a background asset version

### Reading Background Asset Information
- `GET /v1/backgroundassets/{id}` - Read background assets information
- `GET /v1/backgroundassets/{id}/versions` - Read version details for a specific background asset
- `GET /v1/backgroundassets/{id}/relationships/versions` - Get background asset version relationships

### Reading Background Asset Version Information
- `GET /v1/backgroundassetversioninternalbetareleases/{id}` - Read background assets internal beta release information
- `GET /v1/backgroundassetversions/{id}` - Read background assets information
- `GET /v1/backgroundassetversions/{id}/backgroundassetuploadfiles` - Read background asset upload file information for a background asset version
- `GET /v1/backgroundassetversions/{id}/relationships/backgroundassetuploadfiles` - Get the background asset upload files resource ID for a background asset version

### Background Assets Objects and Types
- `object BackgroundAsset` - Background asset resource data structure
- `object BackgroundAsset.Relationships` - Background asset relationships
- `object BackgroundAsset.Attributes` - Background asset attributes
- `object App.Relationships.BackgroundAssets` - App background assets relationships
- `object AppBackgroundAssetsLinkagesResponse` - App background assets linkages response
- `object AppBackgroundAssetsLinkagesResponse.Data` - App background assets linkages data
- `type BackgroundAssetVersionState` - String representing background asset version state

---

## 3. Accessibility Declarations

### Getting Accessibility Declaration Information
- `GET /v1/apps/{id}/accessibilityDeclarations` - List all accessibility declarations for an app
- `GET /v1/apps/{id}/relationships/accessibilityDeclarations` - Get accessibility declaration relationship IDs for an app

### Managing Accessibility Metadata
- `GET /v1/accessibilityDeclarations/{id}` - Read accessibility declaration information
- `POST /v1/accessibilityDeclarations` - Create an accessibility declaration
  - **Request Body**: `AccessibilityDeclarationCreateRequest`
- `PATCH /v1/accessibilityDeclarations/{id}` - Modify an accessibility declaration
- `DELETE /v1/accessibilityDeclarations/{id}` - Delete an accessibility declaration

### Accessibility Objects and Types
- `object AccessibilityDeclaration` - Accessibility declaration resource data structure
- `object AccessibilityDeclaration.Attributes` - Accessibility declaration attributes
- `object AccessibilityDeclarationResponse` - Single accessibility declaration response
- `object AccessibilityDeclarationsResponse` - Response containing accessibility declarations list
- `object AccessibilityDeclarationCreateRequest` - Request body for creating accessibility declaration
- `object AccessibilityDeclarationCreateRequest.Data` - Create request data structure
- `object AccessibilityDeclarationCreateRequest.Data.Attributes` - Create request attributes
- `object AccessibilityDeclarationCreateRequest.Data.Relationships` - Create request relationships
- `object AccessibilityDeclarationCreateRequest.Data.Relationships.App` - App relationship in create request
- `object AccessibilityDeclarationCreateRequest.Data.Relationships.App.Data` - App relationship data
- `object App.Relationships.AccessibilityDeclarations` - App accessibility declarations relationships

---

## 4. Customer Review Summarizations

### Reading Customer Review Summaries

#### GET Endpoints
- `GET /v1/apps/{id}/customerReviews` - List All Customer Reviews for an App
- `GET /v1/apps/{id}/relationships/customerReviews` - Get customer review relationships for an app
- `GET /v1/apps/{id}/customerReviewSummarizations` - Read customer review summarizations

### Customer Review Objects and Types
- `object App.Relationships.CustomerReviews` - Customer reviews relationships
- `object App.Relationships.CustomerReviewSummarizations` - Customer review summarizations relationships

---

## 5. TestFlight Beta Feedback

### Getting Beta Feedback (Crash and Screenshot Data)

#### GET Endpoints
- `GET /v1/apps/{id}/betaFeedbackCrashSubmissions` - List all beta feedback crash submissions for an app
- `GET /v1/apps/{id}/betaFeedbackScreenshotSubmissions` - List all beta feedback screenshot submissions for an app
- `GET /v1/apps/{id}/metrics/betaTesterUsages` - Read beta tester metrics for an app

### Beta Feedback Objects and Types
- Enhanced beta feedback with crash and screenshot data support
- Beta tester usage metrics for comprehensive feedback analysis

---

## Implementation Notes

### Version Requirements
- All new endpoints require **App Store Connect API 4.0+**
- Webhooks are event-driven and require proper server-side handling
- Background Assets support Apple-hosted asset management with versioning

### Authentication
- All endpoints use standard JWT authentication as per existing API
- Same authorization patterns apply for new endpoints

### Error Handling
- Standard error responses apply (400, 401, 403, 409, 422, 429)
- All endpoints return `ErrorResponse` objects for error conditions

---

## Summary

This document provides a comprehensive overview of all new API endpoints introduced in **App Store Connect API v4.0**. The major additions include:

1. **Webhooks** (11 endpoints) - Event-driven notifications for real-time updates
2. **Background Assets** (10 endpoints) - Apple-hosted asset management with versioning
3. **Accessibility Declarations** (6 endpoints) - Accessibility metadata management
4. **Customer Review Summarizations** (3 endpoints) - Enhanced review data access
5. **TestFlight Beta Feedback** (3 endpoints) - Crash and screenshot submission data

All endpoints follow standard REST patterns with JWT authentication and provide comprehensive error handling. These additions significantly expand the API's capabilities for automation and integration workflows.

*Document completed - all App Store Connect API v4.0 endpoints documented.*