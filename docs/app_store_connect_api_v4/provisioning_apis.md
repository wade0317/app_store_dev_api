# Provisioning APIs

Manage bundle IDs, capabilities, signing certificates, devices, and provisioning profiles.

## Overview

The Provisioning APIs allow you to programmatically manage all aspects of code signing and app provisioning for iOS, iPadOS, macOS, tvOS, and watchOS development. These APIs automate the tasks you would typically perform in the Apple Developer portal.

## Bundle IDs

### Bundle IDs Management
- **Description**: Manage the bundle IDs that uniquely identify your apps
- **Endpoint Base**: `/v1/bundleIds`
- **Operations**: Create, read, update, delete bundle IDs
- **Key Endpoints**:
  - `GET /v1/bundleIds` - List bundle IDs
  - `POST /v1/bundleIds` - Register new bundle ID
  - `GET /v1/bundleIds/{id}` - Get bundle ID details
  - `PATCH /v1/bundleIds/{id}` - Update bundle ID
  - `DELETE /v1/bundleIds/{id}` - Delete bundle ID

### Bundle ID Creation
```http
POST /v1/bundleIds
{
  "data": {
    "type": "bundleIds",
    "attributes": {
      "identifier": "com.example.myapp",
      "name": "My App",
      "platform": "IOS",
      "seedId": "{seedId}"
    }
  }
}
```

### Supported Platforms
- `IOS` - iOS and iPadOS
- `MAC_OS` - macOS
- `UNIVERSAL` - Cross-platform (iOS, iPadOS, macOS)

## Bundle ID Capabilities

### Capabilities Management
- **Description**: Manage the app capabilities for a bundle ID
- **Endpoint Base**: `/v1/bundleIdCapabilities`
- **Operations**: Enable, configure, and disable app capabilities
- **Key Endpoints**:
  - `GET /v1/bundleIdCapabilities` - List capabilities
  - `POST /v1/bundleIdCapabilities` - Enable capability
  - `GET /v1/bundleIdCapabilities/{id}` - Get capability details
  - `PATCH /v1/bundleIdCapabilities/{id}` - Update capability
  - `DELETE /v1/bundleIdCapabilities/{id}` - Disable capability

### Common Capabilities
- `ICLOUD` - iCloud
- `IN_APP_PURCHASE` - In-App Purchase
- `GAME_CENTER` - Game Center
- `PUSH_NOTIFICATIONS` - Push Notifications
- `WALLET` - Wallet
- `INTER_APP_AUDIO` - Inter-App Audio
- `MAPS` - Maps
- `ASSOCIATED_DOMAINS` - Associated Domains
- `APP_GROUPS` - App Groups
- `DATA_PROTECTION` - Data Protection
- `HOMEKIT` - HomeKit
- `HEALTHKIT` - HealthKit
- `WIRELESS_ACCESSORY_CONFIGURATION` - Wireless Accessory Configuration
- `APPLE_PAY` - Apple Pay
- `NETWORK_EXTENSIONS` - Network Extensions
- `HOT_SPOT` - Personal VPN
- `MULTIPATH` - Multipath
- `NFC_TAG_READING` - NFC Tag Reading
- `CLASSKIT` - ClassKit
- `AUTOFILL_CREDENTIAL_PROVIDER` - AutoFill Credential Provider
- `ACCESS_WIFI_INFORMATION` - Access WiFi Information
- `NETWORK_CUSTOM_PROTOCOL` - Custom Network Protocol
- `COREMEDIA_HLS_LOW_LATENCY` - Low Latency HLS
- `SYSTEM_EXTENSION_INSTALL` - System Extension
- `USER_MANAGEMENT` - User Management

### Enable Capability
```http
POST /v1/bundleIdCapabilities
{
  "data": {
    "type": "bundleIdCapabilities",
    "attributes": {
      "capabilityType": "PUSH_NOTIFICATIONS"
    },
    "relationships": {
      "bundleId": {
        "data": {
          "type": "bundleIds",
          "id": "{bundleIdId}"
        }
      }
    }
  }
}
```

## Certificates

### Certificate Management
- **Description**: Create, download, and revoke signing certificates for app development and distribution
- **Endpoint Base**: `/v1/certificates`
- **Operations**: Create, download, revoke certificates
- **Key Endpoints**:
  - `GET /v1/certificates` - List certificates
  - `POST /v1/certificates` - Create certificate
  - `GET /v1/certificates/{id}` - Get certificate details
  - `DELETE /v1/certificates/{id}` - Revoke certificate

### Certificate Types
- `IOS_DEVELOPMENT` - iOS App Development
- `IOS_DISTRIBUTION` - iOS App Store and Ad Hoc
- `MAC_APP_DEVELOPMENT` - Mac App Development
- `MAC_APP_DISTRIBUTION` - Mac App Store and Developer ID Application
- `MAC_INSTALLER_DISTRIBUTION` - Mac Installer Distribution
- `DEVELOPER_ID_KEXT` - Developer ID Kernel Extension
- `DEVELOPER_ID_APPLICATION` - Developer ID Application

### Create Certificate
```http
POST /v1/certificates
{
  "data": {
    "type": "certificates",
    "attributes": {
      "certificateType": "IOS_DEVELOPMENT",
      "csrContent": "{base64EncodedCSR}"
    }
  }
}
```

## Devices

### Device Management
- **Description**: Register devices for development and testing
- **Endpoint Base**: `/v1/devices`
- **Operations**: Register, list, update, disable devices
- **Key Endpoints**:
  - `GET /v1/devices` - List devices
  - `POST /v1/devices` - Register device
  - `GET /v1/devices/{id}` - Get device details
  - `PATCH /v1/devices/{id}` - Update device

### Device Platforms
- `IOS` - iPhone, iPad, iPod touch
- `MAC_OS` - Mac
- `TVOS` - Apple TV
- `WATCHOS` - Apple Watch

### Register Device
```http
POST /v1/devices
{
  "data": {
    "type": "devices",
    "attributes": {
      "name": "John's iPhone",
      "platform": "IOS",
      "udid": "00008030-000A1F0A3A3E802E"
    }
  }
}
```

### Device Status
- `ENABLED` - Device is active
- `DISABLED` - Device is disabled

## Profiles

### Profile Management
- **Description**: Create, delete, and download provisioning profiles that enable app installations for development and distribution
- **Endpoint Base**: `/v1/profiles`
- **Operations**: Create, download, delete provisioning profiles
- **Key Endpoints**:
  - `GET /v1/profiles` - List profiles
  - `POST /v1/profiles` - Create profile
  - `GET /v1/profiles/{id}` - Get profile details
  - `DELETE /v1/profiles/{id}` - Delete profile

### Profile Types
- `IOS_APP_DEVELOPMENT` - iOS App Development
- `IOS_APP_STORE` - iOS App Store
- `IOS_APP_ADHOC` - iOS Ad Hoc
- `IOS_APP_INHOUSE` - iOS Enterprise
- `MAC_APP_DEVELOPMENT` - Mac App Development
- `MAC_APP_STORE` - Mac App Store
- `MAC_APP_DIRECT` - Mac Developer ID
- `TVOS_APP_DEVELOPMENT` - tvOS App Development
- `TVOS_APP_STORE` - tvOS App Store
- `TVOS_APP_ADHOC` - tvOS Ad Hoc
- `TVOS_APP_INHOUSE` - tvOS Enterprise

### Create Development Profile
```http
POST /v1/profiles
{
  "data": {
    "type": "profiles",
    "attributes": {
      "name": "My App Development",
      "profileType": "IOS_APP_DEVELOPMENT"
    },
    "relationships": {
      "bundleId": {
        "data": {
          "type": "bundleIds",
          "id": "{bundleIdId}"
        }
      },
      "certificates": {
        "data": [
          {
            "type": "certificates",
            "id": "{certificateId}"
          }
        ]
      },
      "devices": {
        "data": [
          {
            "type": "devices",
            "id": "{deviceId}"
          }
        ]
      }
    }
  }
}
```

### Create Distribution Profile
```http
POST /v1/profiles
{
  "data": {
    "type": "profiles",
    "attributes": {
      "name": "My App App Store",
      "profileType": "IOS_APP_STORE"
    },
    "relationships": {
      "bundleId": {
        "data": {
          "type": "bundleIds",
          "id": "{bundleIdId}"
        }
      },
      "certificates": {
        "data": [
          {
            "type": "certificates",
            "id": "{distributionCertificateId}"
          }
        ]
      }
    }
  }
}
```

### Profile States
- `ACTIVE` - Profile is valid and active
- `INVALID` - Profile is invalid (expired or revoked certificates)

## Merchant IDs

### Apple Pay Merchant ID Management
- **Description**: Manage your merchant ID for Apple Pay
- **Endpoint Base**: `/v1/merchantIds`
- **Operations**: Create, read, update, delete merchant IDs
- **Key Endpoints**:
  - `GET /v1/merchantIds` - List merchant IDs
  - `POST /v1/merchantIds` - Create merchant ID
  - `GET /v1/merchantIds/{id}` - Get merchant ID details
  - `PATCH /v1/merchantIds/{id}` - Update merchant ID
  - `DELETE /v1/merchantIds/{id}` - Delete merchant ID

### Create Merchant ID
```http
POST /v1/merchantIds
{
  "data": {
    "type": "merchantIds",
    "attributes": {
      "identifier": "merchant.com.example.myapp",
      "displayName": "My App Store"
    }
  }
}
```

### Merchant ID Capabilities
- **Endpoint Base**: `/v1/merchantIdCapabilities`
- **Operations**: Enable Apple Pay capabilities for merchant IDs

## Pass Type IDs

### Pass Type ID Management
- **Description**: Create, download, and revoke pass type IDs for Wallet passes
- **Endpoint Base**: `/v1/passTypeIds`
- **Operations**: Create, read, update, delete pass type IDs
- **Key Endpoints**:
  - `GET /v1/passTypeIds` - List pass type IDs
  - `POST /v1/passTypeIds` - Create pass type ID
  - `GET /v1/passTypeIds/{id}` - Get pass type ID details
  - `PATCH /v1/passTypeIds/{id}` - Update pass type ID
  - `DELETE /v1/passTypeIds/{id}` - Delete pass type ID

### Create Pass Type ID
```http
POST /v1/passTypeIds
{
  "data": {
    "type": "passTypeIds",
    "attributes": {
      "identifier": "pass.com.example.myapp",
      "name": "My App Passes"
    }
  }
}
```

## Provisioning Workflow

### 1. Register Bundle ID
```http
POST /v1/bundleIds
{
  "data": {
    "type": "bundleIds",
    "attributes": {
      "identifier": "com.example.myapp",
      "name": "My App",
      "platform": "IOS"
    }
  }
}
```

### 2. Enable Capabilities
```http
POST /v1/bundleIdCapabilities
{
  "data": {
    "type": "bundleIdCapabilities",
    "attributes": {
      "capabilityType": "PUSH_NOTIFICATIONS"
    },
    "relationships": {
      "bundleId": {
        "data": {
          "type": "bundleIds",
          "id": "{bundleIdId}"
        }
      }
    }
  }
}
```

### 3. Create Certificates
```http
# Development certificate
POST /v1/certificates
{
  "data": {
    "type": "certificates",
    "attributes": {
      "certificateType": "IOS_DEVELOPMENT",
      "csrContent": "{base64EncodedCSR}"
    }
  }
}

# Distribution certificate
POST /v1/certificates
{
  "data": {
    "type": "certificates",
    "attributes": {
      "certificateType": "IOS_DISTRIBUTION",
      "csrContent": "{base64EncodedCSR}"
    }
  }
}
```

### 4. Register Devices (for Development)
```http
POST /v1/devices
{
  "data": {
    "type": "devices",
    "attributes": {
      "name": "Test iPhone",
      "platform": "IOS",
      "udid": "00008030-000A1F0A3A3E802E"
    }
  }
}
```

### 5. Create Provisioning Profiles
```http
# Development profile
POST /v1/profiles
{
  "data": {
    "type": "profiles",
    "attributes": {
      "name": "My App Development",
      "profileType": "IOS_APP_DEVELOPMENT"
    },
    "relationships": {
      "bundleId": {
        "data": {
          "type": "bundleIds",
          "id": "{bundleIdId}"
        }
      },
      "certificates": {
        "data": [
          {
            "type": "certificates",
            "id": "{devCertificateId}"
          }
        ]
      },
      "devices": {
        "data": [
          {
            "type": "devices",
            "id": "{deviceId}"
          }
        ]
      }
    }
  }
}
```

## Common Filtering and Includes

### Bundle IDs
```http
# Filter by platform
GET /v1/bundleIds?filter[platform]=IOS

# Include capabilities
GET /v1/bundleIds?include=bundleIdCapabilities

# Filter by identifier
GET /v1/bundleIds?filter[identifier]=com.example.myapp
```

### Certificates
```http
# Filter by type
GET /v1/certificates?filter[certificateType]=IOS_DEVELOPMENT

# Filter by display name
GET /v1/certificates?filter[displayName]=John Doe
```

### Devices
```http
# Filter by platform
GET /v1/devices?filter[platform]=IOS

# Filter by status
GET /v1/devices?filter[status]=ENABLED

# Filter by UDID
GET /v1/devices?filter[udid]=00008030-000A1F0A3A3E802E
```

### Profiles
```http
# Filter by type
GET /v1/profiles?filter[profileType]=IOS_APP_DEVELOPMENT

# Filter by state
GET /v1/profiles?filter[profileState]=ACTIVE

# Include related resources
GET /v1/profiles?include=bundleId,certificates,devices
```

## Best Practices

1. **Certificate Management**: Regularly rotate certificates before expiration
2. **Device Limits**: Be aware of device registration limits (100 per platform per year)
3. **Profile Validation**: Check profile states regularly and regenerate as needed
4. **Capability Dependencies**: Some capabilities require additional configuration
5. **Bundle ID Planning**: Use reverse domain notation and plan hierarchy carefully

## Error Handling

Common Provisioning API errors:
- `BUNDLE_ID_PLATFORM_MISMATCH` - Bundle ID platform doesn't match
- `CERTIFICATE_SIGNING_REQUEST_INVALID` - Invalid CSR content
- `DEVICE_UDID_ALREADY_EXISTS` - Device already registered
- `PROFILE_CERTIFICATE_NOT_VALID` - Certificate not valid for profile
- `BUNDLE_ID_CAPABILITY_NOT_ALLOWED` - Capability not allowed for bundle ID

## Rate Limits

Provisioning APIs are subject to rate limiting. Monitor response headers and implement retry logic with exponential backoff.

## Documentation Links

- [Provisioning API Documentation](https://developer.apple.com/documentation/appstoreconnectapi/bundle-ids)
- [Code Signing Guide](https://developer.apple.com/library/archive/documentation/Security/Conceptual/CodeSigningGuide/)
- [App Distribution Guide](https://developer.apple.com/documentation/xcode/distributing-your-app-for-beta-testing-and-releases)