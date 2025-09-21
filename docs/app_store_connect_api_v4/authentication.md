# App Store Connect API Authentication

## Overview

The App Store Connect API requires a JSON Web Token (JWT) to authorize each request you make to the API. You generate JWTs using an API key downloaded from App Store Connect.

## API Key Structure

An API key has two parts:
- **Public portion**: Kept by Apple
- **Private key**: Downloaded by you to sign tokens that authorize access to your data

## API Key Types

There are two types of API keys:

### Team Keys
- **Access**: All apps with varying levels of access based on selected roles
- **Permissions**: Can access all endpoints based on assigned role
- **Management**: Only Admin accounts can create team keys

### Individual Keys
- **Access**: Limited to the apps and permissions of the associated user
- **Limitations**:
  - Cannot use Provisioning endpoints
  - Cannot access Sales and Finance data
  - Cannot use `notaryTool`

## Creating API Keys

### Prerequisites
- App Store Connect account with appropriate permissions
- For team keys: Admin role required
- For individual keys: "Generate Individual API Keys" permission

### Generate a Team Key

1. Log in to [App Store Connect](https://appstoreconnect.apple.com/)
2. Select **Users and Access**, then select the **Integrations** tab
3. Select **App Store Connect API** in the left column
4. Make sure the **Team Keys** tab is selected
5. Click **Generate API Key** or the **Add (+)** button
6. Enter a name for the key (for reference only)
7. Under **Access**, select the role for the key
8. Click **Generate**

#### Available Roles
The roles that apply to keys are the same roles that apply to users on your team. For more information, see [Program Roles](https://developer.apple.com/support/roles/).

- **Admin**: Broad permissions, can create/delete users
- **App Manager**: Manage apps and app-related information
- **Developer**: Limited access to development resources
- **Marketing**: Marketing and promotional content management
- **Sales**: Access to sales and trend data

### Generate an Individual Key

1. Log in to [App Store Connect](https://appstoreconnect.apple.com/)
2. Go to your user profile
3. Scroll down to **Individual API Key**
4. Click **Generate API Key**

> **Note**: If you don't have the "Generate Individual API Keys" permission, the Generate API Key button won't show on your profile. A team Admin can grant you this permission.

## Downloading Private Keys

### Download Team Private Key

1. Log in to [App Store Connect](https://appstoreconnect.apple.com/)
2. Select **Users and Access**, then select the **Integrations** tab
3. Select **App Store Connect API** in the left column
4. Select **Team Keys** if not already selected
5. Click **Download API Key** link next to the new API key

### Download Individual Private Key

1. Log in to [App Store Connect](https://appstoreconnect.apple.com/)
2. Go to your user profile
3. Scroll down to **Individual API Key**
4. Click **Download API Key** link

> **Important**: The download link only appears if you haven't downloaded the private key. Apple doesn't keep a copy of the private key. The private key is available for download only once.

## Generating JWT Tokens

To make API requests, you need to create JWT tokens signed with your private key. The JWT must include:

### JWT Header
```json
{
  "alg": "ES256",
  "kid": "your-key-id",
  "typ": "JWT"
}
```

### JWT Payload
```json
{
  "iss": "your-issuer-id",
  "iat": 1234567890,
  "exp": 1234571490,
  "aud": "appstoreconnect-v1"
}
```

### Required Claims
- **iss** (Issuer): Your issuer ID from App Store Connect
- **iat** (Issued At): Current timestamp
- **exp** (Expiration): Token expiration (max 20 minutes from iat)
- **aud** (Audience): Must be "appstoreconnect-v1"

### Key Parameters
- **kid** (Key ID): Your 10-character key identifier from App Store Connect
- **alg** (Algorithm): Must be "ES256"

## Security Best Practices

> **Important**: Secure your private keys as you do for other credentials, such as usernames and passwords.

### Key Security
- Keep API keys secure and private
- Don't share your keys
- Don't store keys in code repositories
- Don't include keys in client-side code
- If a key becomes lost or compromised, revoke it immediately

### Token Security
- Use HTTPS for all API requests
- Keep tokens secure during transmission and storage
- Implement proper token expiration handling
- Don't log tokens in application logs

## Key Management

### Revoking API Keys
If an API key becomes inactive, lost, or compromised, revoke it immediately:

1. Log in to [App Store Connect](https://appstoreconnect.apple.com/)
2. Navigate to the appropriate keys section (Team or Individual)
3. Select the key to revoke
4. Click **Revoke**
5. Confirm the revocation

> **Important**: Once you revoke an API key, you can't reinstate it. Revoked keys are displayed for 30 days on the API Keys page under the Revoked heading.

### Key Rotation
- Regularly rotate API keys for security
- Plan key rotation to minimize service disruption
- Update all systems using the old key before revocation

## Usage in API Requests

Include the JWT in the Authorization header of your API requests:

```http
Authorization: Bearer YOUR_JWT_TOKEN
```

Example request:
```bash
curl -H "Authorization: Bearer YOUR_JWT_TOKEN" \
     -H "Content-Type: application/json" \
     https://api.appstoreconnect.apple.com/v1/apps
```

## Rate Limits

The App Store Connect API implements rate limiting. Monitor response headers for rate limit information and implement appropriate retry logic in your applications.

## Error Handling

Implement proper error handling for authentication-related errors:
- **401 Unauthorized**: Invalid or expired token
- **403 Forbidden**: Insufficient permissions
- **429 Too Many Requests**: Rate limit exceeded

## Additional Resources

- [Generating Tokens for API Requests](https://developer.apple.com/documentation/appstoreconnectapi/generating-tokens-for-api-requests)
- [Revoking API Keys](https://developer.apple.com/documentation/appstoreconnectapi/revoking-api-keys)
- [Identifying Rate Limits](https://developer.apple.com/documentation/appstoreconnectapi/identifying-rate-limits)