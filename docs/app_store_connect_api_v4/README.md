# App Store Connect API v4 Documentation

This directory contains comprehensive documentation for Apple's App Store Connect API, extracted and converted from the official Apple Developer documentation.

## Documentation Files

### Core Documentation
- **[overview.md](./overview.md)** - Complete API overview, features, and introduction
- **[authentication.md](./authentication.md)** - API key creation, JWT token generation, and security

### API Categories
- **[app_store_apis.md](./app_store_apis.md)** - App Store management APIs
- **[testflight_apis.md](./testflight_apis.md)** - TestFlight beta testing APIs
- **[provisioning_apis.md](./provisioning_apis.md)** - Code signing and provisioning APIs

## API Overview

The App Store Connect API is a REST API that enables automation of tasks you perform in App Store Connect. Key features include:

### Main Categories
- **App Store**: App metadata, in-app purchases, customer reviews, pricing
- **TestFlight**: Beta testing, testers, groups, builds
- **Provisioning**: Bundle IDs, certificates, devices, profiles
- **Game Center**: Game data and configurations
- **Xcode Cloud**: CI/CD workflows and builds
- **Reporting**: Sales, finance, analytics, performance metrics
- **Users and Access**: Team management and permissions
- **Webhooks**: Event notifications

### Key Features
- **REST API** with JSON responses
- **JWT-based authentication** using API keys
- **Rate limiting** with proper headers
- **Filtering and pagination** support
- **Relationship includes** for related data
- **Error handling** following JSON API specification

## Getting Started

1. **Authentication Setup**
   - Create API keys in App Store Connect
   - Generate JWT tokens for requests
   - See [authentication.md](./authentication.md) for details

2. **Choose Your API Category**
   - App Store: [app_store_apis.md](./app_store_apis.md)
   - TestFlight: [testflight_apis.md](./testflight_apis.md)
   - Provisioning: [provisioning_apis.md](./provisioning_apis.md)

3. **Make API Requests**
   ```http
   GET https://api.appstoreconnect.apple.com/v1/apps
   Authorization: Bearer YOUR_JWT_TOKEN
   Content-Type: application/json
   ```

## Common Request Patterns

### Authentication Header
```http
Authorization: Bearer YOUR_JWT_TOKEN
Content-Type: application/json
```

### Filtering
```http
GET /v1/apps?filter[platform]=IOS&filter[bundleId]=com.example.app
```

### Including Related Data
```http
GET /v1/apps?include=appInfos,builds,betaGroups
```

### Pagination
```http
GET /v1/apps?limit=20&cursor=eyJpZCI6IjEyMzQ1Njc4OTAifQ
```

## API Base URL
```
https://api.appstoreconnect.apple.com
```

## Common Response Format

### Success Response
```json
{
  "data": [
    {
      "type": "apps",
      "id": "12345",
      "attributes": {
        "name": "My App",
        "bundleId": "com.example.myapp"
      },
      "relationships": {
        "appInfos": {
          "links": {
            "related": "/v1/apps/12345/appInfos"
          }
        }
      }
    }
  ],
  "links": {
    "self": "/v1/apps",
    "next": "/v1/apps?cursor=..."
  },
  "meta": {
    "paging": {
      "total": 150,
      "limit": 20
    }
  }
}
```

### Error Response
```json
{
  "errors": [
    {
      "id": "error-id",
      "status": "400",
      "code": "PARAMETER_ERROR.INVALID",
      "title": "A parameter has an invalid value",
      "detail": "The provided entity includes an invalid relationship"
    }
  ]
}
```

## Rate Limiting

The API implements rate limiting with headers:
```http
X-Rate-Limit-Limit: 1000
X-Rate-Limit-Remaining: 999
X-Rate-Limit-Reset: 1640995200
```

## Important Notes

> **Warning**: Changes made using the App Store Connect API affect production data used for development and distribution.

### Security Best Practices
- Keep API keys secure and private
- Use HTTPS for all requests
- Implement proper token expiration handling
- Don't store keys in code repositories
- Rotate keys regularly

### API Limits
- JWT tokens expire after 20 minutes maximum
- Rate limits apply to all endpoints
- Some resources have specific limits (e.g., 100 beta testers per app)

## Resources

### Official Documentation
- [App Store Connect API](https://developer.apple.com/documentation/appstoreconnectapi)
- [OpenAPI Specification](https://developer.apple.com/sample-code/app-store-connect/app-store-connect-openapi-specification.zip)

### Related Tools
- [App Store Connect](https://appstoreconnect.apple.com/)
- [Apple Developer Portal](https://developer.apple.com/account/)
- [TestFlight](https://developer.apple.com/testflight/)

### Support
- [Apple Developer Forums](https://developer.apple.com/forums/)
- [Apple Developer Support](https://developer.apple.com/support/)
- [Bug Reporting](https://developer.apple.com/bug-reporting/)

## Version Information

- **API Version**: 1.0+
- **Documentation Version**: v4 (2025)
- **Last Updated**: January 2025

## Contributing

This documentation is generated from Apple's official API documentation. For updates or corrections, please refer to the official Apple Developer documentation or submit feedback through Apple's channels.