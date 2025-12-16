# AGENTS.md - System Context & Architecture Spec for campus_ivy

## 1. Project Identity
**Name:** campus_ivy
**Type:** Ruby Gem (API Wrapper)
**Purpose:** Provide a clean, idiomatic Ruby interface for the Campus Management API.

## 2. Tech Stack Requirements
- **Language:** Ruby 3.2+
- **HTTP Client:** `faraday` (Strict requirement: do not use Net::HTTP directly).
- **JSON Parsing:** `faraday_middleware` or `faraday` v2 JSON adapter.
- **Testing:** `rspec`, `webmock`, `vcr`.
- **Linting:** `rubocop`.

## 3. Testing Requirements
- **Verification:** The agent must run relevant tests for any work performed.
- **Coverage:** New modules or functions must include comprehensive test suites (specs).
- **Strategy:** Prefer integration testing with VCR over extensive unit mocking for API interactions.

## 4. Mandatory Architecture Patterns
The agent must implement the following four patterns without deviation:

### A. The Client & Resource Pattern
* **Entry Point:** `CampusIvy::Client` must be the primary interface.
* **Isolation:** Do not crowd the Client class with API methods.
* **Implementation:**
    * Create a `lib/campus_ivy/resources/` directory.
    * The `Client` class initializes these resource classes (e.g., `def students; Resources::Students.new(self); end`).
    * Usage must look like: `client.students.find('id')`.

### B. The Middleware Pattern
* **Requirement:** Use a custom Faraday connection stack in a dedicated `Connection` module.
* **Handling:**
    * Automatically handle Authentication headers.
    * Automatically parse JSON requests and responses.
    * **Crucial:** Use middleware to intercept non-200 status codes and raise specific exceptions (`CampusIvy::Error`, `CampusIvy::RateLimitError`) *before* returning data.

### C. The Entity/Object Pattern
* **Requirement:** Never return raw Hashes to the user.
* **Implementation:**
    * Wrap all API responses in a lightweight object (e.g., `CampusIvy::Object`).
    * Allow dot-notation access (e.g., `student.first_name`, NOT `student['first_name']`).
    * Use `OpenStruct` or a custom `Data` class for immutability.

### D. The Configuration Pattern
* **Requirement:** Support both global module configuration and instance-level overrides.
* **Snippet Reference:**
    ```ruby
    CampusIvy.configure { |c| c.api_key = 'xyz' }
    # VS
    client = CampusIvy::Client.new(api_key: 'abc')
    ```

## 5. Coding Standards (Rubocop)
- Use keyword arguments for all optional parameters.
- Keep methods under 15 lines.
- No `puts` statements in library code (use a Logger if necessary).
- RSpec: Use `let`, `expect`, and `vcr` cassettes. Do not mock internal implementation details; mock the HTTP network layer.