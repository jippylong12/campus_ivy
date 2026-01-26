## [Unreleased]

## [1.0.0] - 2026-01-26

### Added
- **Attendance:** Added `Attendance` resource.
- **Financial Aid (Awards & Disbursements):**
  - `AwardAndDisbursementTransmission`
  - `DisbursementBatchDetail`
  - `Packaging`
  - `StudentAwards`
  - `StudentAwardTransmissionLog`
  - `StudentDisbursementTransmissionLog`
- **Financial Aid (COD/ISIR/R2T4):**
  - `CODLog`, `CODResponseEC`, `CODResponsePN`, `CODResponseSP`
  - `StudentISIR` (including `verification_request` and `update_status`)
  - `StudentSelectedISIR`
  - `StudentR2T4`
- **Financial Aid (Analysis & Funding):**
  - `NetPriceCalculator`, `PayListAnalysis`
  - `StudentFAProgression`, `StudentFundingDetail`
  - `StudentFundingEstimate`, `StudentRemainingBalance`
- **Documents:**
  - `DocumentAnalysis`, `DocumentInventory`, `DocumentStatus`
  - `StudentDocument` (including import and blob search)
  - `StudentDocumentHistory`, `StudentDocumentTags`
- **System & User:**
  - `FunctionalAreaTask`, `Health` (check & ping)
  - `InstitutionBreaksByShift`, `NoteType`
  - `RegisteredStudent` (list & create)
  - `ServiceType`
  - `StudentNote` (list & create)
  - `StudentReference` (list & create)
  - `UserLoginOption`, `UserNotification` (list & mark_read)
  - `UserProfile`, `UserRole` (including xref)
- **Client:** Exposed all new resources via `CampusIvy::Client` accessors.

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
