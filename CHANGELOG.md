## [Unreleased]

## [0.1.0] - 2025-12-16

### Added
- **Account Resource:** Implemented full support for the Account module (`CampusIvy::Resources::Account`).
  - Added `token` method for full authentication.
  - Added `token_credentials` for username/password authentication.
  - Added `token_key` for client key authentication.
  - Added `logout` method.
- **Typing:** Integrated `sorbet-runtime` for strict type checking on all new methods.
- **Client:** Added `account` accessor to the main `CampusIvy::Client`.
- **Configuration:** Added ability to override `base_url` directly in configuration.
- **Testing:** Added comprehensive RSpec tests for the Account resource and fixed Client spec configuration.
