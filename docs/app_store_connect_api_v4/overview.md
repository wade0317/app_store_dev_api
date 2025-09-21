# App Store Connect API Overview

## Introduction

The App Store Connect API is a REST API that enables the automation of actions you take in App Store Connect. This powerful API allows developers to programmatically manage their app distribution workflow.

- **API Version**: 1.0+
- **OpenAPI Specification**: [Download here](https://developer.apple.com/sample-code/app-store-connect/app-store-connect-openapi-specification.zip)
- **Base URL**: `https://api.appstoreconnect.apple.com`

## Key Features

The App Store Connect API provides resources to automate these areas of App Store Connect:

### Core Functionality

- **In-App Purchases and Subscriptions**: Manage in-app purchases and auto-renewable subscriptions for your app
- **TestFlight**: Manage beta builds of your app, testers, and groups
- **Xcode Cloud**: Read Xcode Cloud data, manage workflows, and start builds
- **Users and Access**: Send invitations for users to join your team. Adjust their level of access or remove users
- **Provisioning**: Manage bundle IDs, capabilities, signing certificates, devices, and provisioning profiles
- **App Metadata**: Create new versions, manage App Store information, and submit your app to the App Store
- **App Clip Experiences**: Create an App Clip and manage App Clip experiences
- **Reporting**: Download sales and financial reports
- **Power and Performance Metrics**: Download aggregate metrics and diagnostics for App Store versions of your app
- **Customer Reviews and Review Responses**: Get the customer reviews for your app and manage your responses to customer reviews

## API Categories

### App Store
- App metadata management
- Custom product pages and localizations
- App events and metadata
- App Clips and App Clip experiences
- Builds and build bundles
- In-app purchases and subscriptions
- Customer reviews and responses
- App pricing and availability

### TestFlight
- Prerelease versions and beta testers
- Beta groups management
- Build distribution

### Game Center
- Game Center data and configurations
- Achievements and leaderboards

### Provisioning
- Bundle IDs
- Bundle ID capabilities
- Certificates
- Devices
- Profiles
- Merchant ID
- Pass type IDs

### Xcode Cloud
- Xcode Cloud workflows and builds
- CI/CD automation

### Webhooks
- Webhook notifications
- App Store status updates

### Reporting
- Sales and finance reports
- Power and performance metrics and logs
- Analytics data

### Users and Access
- Team user management
- User invitations
- Sandbox testers

## Important Notes

> **Important**: Changes you make using the App Store Connect API affect the production data you use for development and distribution.

The App Store Connect API returns responses from resources that are consistent JSON data and contain links to additional related resources. Use these relationships to navigate to the related resources—for example, to find beta testers within specific beta groups in TestFlight. Apply filtering to requests on specific resources to refine the response.

## Authentication

All API calls require JSON Web Tokens (JWT) for authorization. You obtain keys to create the tokens from your organization's App Store Connect account. See the Authentication documentation for details on creating API keys and generating tokens.

## Getting Started

1. Create API keys in App Store Connect
2. Generate JWT tokens for API requests
3. Make requests to the API endpoints
4. Handle responses and errors appropriately

For detailed implementation guides, see the specific sections for Authentication, API endpoints, and Error Handling.