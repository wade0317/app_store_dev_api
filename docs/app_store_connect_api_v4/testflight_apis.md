# TestFlight APIs

Manage your beta testing program, including beta testers and groups, apps, App Clips, and builds.

## Overview

TestFlight APIs allow you to programmatically manage beta testing for your iOS, iPadOS, macOS, tvOS, and watchOS apps. You can manage builds, beta testers, groups, and the overall beta testing experience.

## Prerelease Versions and Beta Testers

### Beta Testers
- **Description**: Manage individual beta testers
- **Endpoint Base**: `/v1/betaTesters`
- **Operations**: Invite, remove, and manage beta testers
- **Key Endpoints**:
  - `GET /v1/betaTesters` - List beta testers
  - `POST /v1/betaTesters` - Create beta tester
  - `GET /v1/betaTesters/{id}` - Get beta tester details
  - `PATCH /v1/betaTesters/{id}` - Update beta tester
  - `DELETE /v1/betaTesters/{id}` - Remove beta tester

### Beta Groups
- **Description**: Create and manage groups of beta testers
- **Endpoint Base**: `/v1/betaGroups`
- **Operations**: Create, update, delete beta groups and manage membership
- **Key Endpoints**:
  - `GET /v1/betaGroups` - List beta groups
  - `POST /v1/betaGroups` - Create beta group
  - `GET /v1/betaGroups/{id}` - Get beta group details
  - `PATCH /v1/betaGroups/{id}` - Update beta group
  - `DELETE /v1/betaGroups/{id}` - Delete beta group
  - `POST /v1/betaGroups/{id}/relationships/betaTesters` - Add testers to group
  - `DELETE /v1/betaGroups/{id}/relationships/betaTesters` - Remove testers from group

### Beta Group Builds
- **Description**: Manage which builds are available to beta groups
- **Endpoint Base**: `/v1/betaGroups/{id}/relationships/builds`
- **Operations**: Add and remove builds from beta groups
- **Key Endpoints**:
  - `GET /v1/betaGroups/{id}/builds` - List builds for group
  - `POST /v1/betaGroups/{id}/relationships/builds` - Add builds to group
  - `DELETE /v1/betaGroups/{id}/relationships/builds` - Remove builds from group

### Beta Tester Invitations
- **Description**: Send and manage beta testing invitations
- **Endpoint Base**: `/v1/betaTesterInvitations`
- **Operations**: Send invitations to beta testers
- **Key Endpoints**:
  - `POST /v1/betaTesterInvitations` - Send invitation

### Beta Apps
- **Description**: Manage apps in beta testing
- **Endpoint Base**: `/v1/betaApps`
- **Operations**: Configure beta testing settings for apps
- **Key Endpoints**:
  - `GET /v1/betaApps` - List beta apps
  - `GET /v1/betaApps/{id}` - Get beta app details

### Beta App Localizations
- **Description**: Manage localized beta app information
- **Endpoint Base**: `/v1/betaAppLocalizations`
- **Operations**: Create and manage localized beta app descriptions
- **Key Endpoints**:
  - `GET /v1/betaAppLocalizations` - List beta app localizations
  - `POST /v1/betaAppLocalizations` - Create localization
  - `GET /v1/betaAppLocalizations/{id}` - Get localization details
  - `PATCH /v1/betaAppLocalizations/{id}` - Update localization
  - `DELETE /v1/betaAppLocalizations/{id}` - Delete localization

### Beta Build Localizations
- **Description**: Manage localized build information for beta testing
- **Endpoint Base**: `/v1/betaBuildLocalizations`
- **Operations**: Create and manage "What to Test" notes
- **Key Endpoints**:
  - `GET /v1/betaBuildLocalizations` - List build localizations
  - `POST /v1/betaBuildLocalizations` - Create build localization
  - `GET /v1/betaBuildLocalizations/{id}` - Get localization details
  - `PATCH /v1/betaBuildLocalizations/{id}` - Update localization
  - `DELETE /v1/betaBuildLocalizations/{id}` - Delete localization

### Beta App Review Details
- **Description**: Manage beta app review information
- **Endpoint Base**: `/v1/betaAppReviewDetails`
- **Operations**: Update contact information and demo account details
- **Key Endpoints**:
  - `GET /v1/betaAppReviewDetails` - List review details
  - `GET /v1/betaAppReviewDetails/{id}` - Get review details
  - `PATCH /v1/betaAppReviewDetails/{id}` - Update review details

### Beta App Review Submissions
- **Description**: Submit beta apps for review
- **Endpoint Base**: `/v1/betaAppReviewSubmissions`
- **Operations**: Submit beta apps for Apple's review
- **Key Endpoints**:
  - `GET /v1/betaAppReviewSubmissions` - List submissions
  - `POST /v1/betaAppReviewSubmissions` - Create submission
  - `GET /v1/betaAppReviewSubmissions/{id}` - Get submission details

### Prerelease Versions
- **Description**: Manage prerelease versions of your app
- **Endpoint Base**: `/v1/preReleaseVersions`
- **Operations**: Get information about prerelease app versions
- **Key Endpoints**:
  - `GET /v1/preReleaseVersions` - List prerelease versions
  - `GET /v1/preReleaseVersions/{id}` - Get version details

## Beta Testing Workflow

### 1. App Setup
```http
# Get beta app details
GET /v1/betaApps/{appId}

# Create beta app localization
POST /v1/betaAppLocalizations
{
  "data": {
    "type": "betaAppLocalizations",
    "attributes": {
      "locale": "en-US",
      "description": "Beta version of our amazing app",
      "feedbackEmail": "beta@example.com",
      "marketingUrl": "https://example.com",
      "privacyPolicyUrl": "https://example.com/privacy",
      "tvOsPrivacyPolicy": "Privacy policy content..."
    },
    "relationships": {
      "app": {
        "data": {
          "type": "apps",
          "id": "{appId}"
        }
      }
    }
  }
}
```

### 2. Create Beta Groups
```http
# Create internal beta group
POST /v1/betaGroups
{
  "data": {
    "type": "betaGroups",
    "attributes": {
      "name": "Internal Team",
      "isInternalGroup": true
    },
    "relationships": {
      "app": {
        "data": {
          "type": "apps",
          "id": "{appId}"
        }
      }
    }
  }
}

# Create external beta group
POST /v1/betaGroups
{
  "data": {
    "type": "betaGroups",
    "attributes": {
      "name": "External Testers",
      "isInternalGroup": false,
      "hasAccessToAllBuilds": false
    },
    "relationships": {
      "app": {
        "data": {
          "type": "apps",
          "id": "{appId}"
        }
      }
    }
  }
}
```

### 3. Manage Beta Testers
```http
# Create beta tester
POST /v1/betaTesters
{
  "data": {
    "type": "betaTesters",
    "attributes": {
      "email": "tester@example.com",
      "firstName": "John",
      "lastName": "Doe"
    }
  }
}

# Add tester to beta group
POST /v1/betaGroups/{groupId}/relationships/betaTesters
{
  "data": [
    {
      "type": "betaTesters",
      "id": "{testerId}"
    }
  ]
}
```

### 4. Distribute Builds
```http
# Add build to beta group
POST /v1/betaGroups/{groupId}/relationships/builds
{
  "data": [
    {
      "type": "builds",
      "id": "{buildId}"
    }
  ]
}

# Create build localization (What to Test)
POST /v1/betaBuildLocalizations
{
  "data": {
    "type": "betaBuildLocalizations",
    "attributes": {
      "locale": "en-US",
      "whatsNew": "- Fixed login issue\n- Improved performance\n- New feature X"
    },
    "relationships": {
      "build": {
        "data": {
          "type": "builds",
          "id": "{buildId}"
        }
      }
    }
  }
}
```

### 5. Send Invitations
```http
# Send beta tester invitation
POST /v1/betaTesterInvitations
{
  "data": {
    "type": "betaTesterInvitations",
    "relationships": {
      "betaTester": {
        "data": {
          "type": "betaTesters",
          "id": "{testerId}"
        }
      },
      "app": {
        "data": {
          "type": "apps",
          "id": "{appId}"
        }
      }
    }
  }
}
```

## Beta Testing Metrics

### Beta Tester Metrics
- **Description**: Get usage data for beta testers
- **Endpoint Base**: `/v1/betaTesters/{id}/metrics/betaTesterUsages`
- **Operations**: Retrieve beta tester usage statistics

### Beta Group Metrics
- **Description**: Get usage data for beta groups
- **Endpoint Base**: `/v1/betaGroups/{id}/metrics/betaTesterUsages`
- **Operations**: Retrieve beta group usage statistics

## Common Filtering and Includes

### Beta Testers
```http
# Filter beta testers by email
GET /v1/betaTesters?filter[email]=john@example.com

# Include beta groups and apps
GET /v1/betaTesters?include=betaGroups,apps
```

### Beta Groups
```http
# Filter beta groups by app
GET /v1/betaGroups?filter[app]=12345

# Include beta testers and builds
GET /v1/betaGroups?include=betaTesters,builds
```

### Builds
```http
# Filter builds by version
GET /v1/builds?filter[version]=1.0.0

# Include beta groups and beta build localizations
GET /v1/builds?include=betaGroups,betaBuildLocalizations
```

## Beta Testing States

### Build States
- `PROCESSING` - Build is being processed
- `FAILED` - Processing failed
- `EXPIRED` - Build has expired
- `READY_FOR_BETA_TESTING` - Available for beta testing
- `IN_BETA_TESTING` - Currently in beta testing
- `READY_FOR_BETA_SUBMISSION` - Ready for beta review
- `IN_BETA_REVIEW` - Under beta review
- `BETA_APPROVED` - Approved for beta testing
- `BETA_REJECTED` - Rejected for beta testing

### Beta Review States
- `WAITING_FOR_REVIEW` - Waiting for Apple review
- `IN_REVIEW` - Currently under review
- `REJECTED` - Rejected by Apple
- `APPROVED` - Approved by Apple

## Error Handling

Common TestFlight API errors:
- `BETA_GROUPS_BUILD_NOT_READY_FOR_BETA_TESTING` - Build not ready for beta testing
- `BETA_TESTERS_EMAIL_INVALID` - Invalid email address
- `BETA_GROUPS_BETA_TESTER_LIMIT_EXCEEDED` - Too many beta testers in group
- `BUILDS_EXPIRE_DAYS_INVALID` - Invalid expiration date

## Best Practices

1. **Manage Groups Effectively**: Use internal groups for team members and external groups for public beta testers
2. **Provide Clear Instructions**: Use beta build localizations to provide "What to Test" instructions
3. **Monitor Metrics**: Track beta tester engagement and feedback
4. **Manage Limits**: Be aware of TestFlight limits (100 beta testers per app, 10,000 total)
5. **Beta Review**: Submit beta apps for review when required for external testing

## Rate Limits

TestFlight APIs share the same rate limits as other App Store Connect APIs. Monitor the `X-Rate-Limit` headers in responses and implement proper retry logic.

## Documentation Links

- [TestFlight Documentation](https://developer.apple.com/documentation/appstoreconnectapi/prerelease-versions-and-beta-testers)
- [TestFlight Beta Testing Guide](https://developer.apple.com/testflight/)
- [Beta Testing Best Practices](https://developer.apple.com/app-store/testflight/)