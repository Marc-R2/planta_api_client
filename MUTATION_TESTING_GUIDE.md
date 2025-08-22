# Mutation Testing Resistance Guide

This document outlines the critical code paths and logic that have been specifically tested to resist mutation testing attacks. Each section explains why the logic is essential and cannot be altered without breaking functionality.

## Authentication Logic

### Token Null Checks
**Location:** `AuthenticationService.refresh()`
```dart
if (current == null || current.refreshToken == null) {
  throw PlantaAuthException('No refresh token available.');
}
```
**Why Critical:** Removing either null check would cause crashes or security vulnerabilities.
- `current == null`: Prevents attempting refresh without any stored tokens
- `current.refreshToken == null`: Prevents refresh attempts with incomplete token data

### Authorization Header Format
**Location:** All authenticated requests
```dart
req.headers['Authorization'] = 'Bearer ${tokens.accessToken}';
```
**Why Critical:** The exact format "Bearer " (with space) is required by the API.
- Removing "Bearer ": API would reject the authorization
- Changing the space: API would not recognize the token format
- Using wrong token field: Authentication would fail

### Token Storage Atomicity
**Location:** `AuthenticationService.authorize()` and `refresh()`
```dart
final tokens = Tokens.fromJson((json['data'] as Map).cast<String, dynamic>());
await tokenStore.save(tokens);  // This line cannot be removed
return tokens;
```
**Why Critical:** Tokens must be stored immediately after successful parsing.
- Removing `save()`: Tokens would be lost, requiring re-authentication
- Moving `save()` after `return`: Tokens would never be persisted

## HTTP Status Code Logic

### Retry Limit Enforcement
**Location:** `PlantService._authedRequest()` and `ActionService._authedRequest()`
```dart
try {
  return await sendWithToken(tokens);
} on PlantaAuthException {
  // Attempt refresh once on 401
  tokens = await authService.refresh();
  return sendWithToken(tokens);  // No retry loop - exactly one attempt
}
```
**Why Critical:** Must retry exactly once to avoid infinite loops or no retries.
- No retry: Temporary token expiry would cause permanent failures
- Multiple retries: Could create infinite loops on persistent auth failures

### Status Code Boundaries
**Location:** `HttpService._throwOnStatus()`
```dart
if (response.statusCode >= 200 && response.statusCode < 300) return;
```
**Why Critical:** The exact boundaries define success vs. error conditions.
- Changing `>= 200`: Would treat 200 OK as an error
- Changing `< 300`: Would treat 300 redirects as success
- Using `!=` instead of ranges: Would misclassify many status codes

### Error Type Mapping
**Location:** `HttpService._throwOnStatus()`
```dart
switch (status) {
  case 400: throw PlantaBadRequestException(message, errorType: errorType);
  case 401: throw PlantaAuthException(message, errorType: errorType);
  case 404: throw PlantaNotFoundException(message, errorType: errorType);
  case 500: throw PlantaServerException(message, errorType: errorType);
  default: throw PlantaApiException(message, statusCode: status, errorType: errorType);
}
```
**Why Critical:** Each status code must map to the correct exception type.
- Wrong exception types: Breaks error handling in client code
- Missing cases: Would fall through to generic exception
- Wrong status codes: Would misclassify error types

## Pagination Logic

### Cursor Parameter Handling
**Location:** `PlantService.getAddedPlants()`
```dart
final uri = Uri.parse('$baseUrl/v1/addedPlants')
    .replace(queryParameters: cursor != null ? {'cursor': cursor} : null);
```
**Why Critical:** Cursor must be included only when present.
- Always including cursor: Would send "null" string or crash
- Never including cursor: Would always return first page
- Wrong parameter name: API would not recognize pagination

### Stream Termination Logic
**Location:** `PlantService.streamAllAddedPlants()`
```dart
cursor = page.pagination?.nextPage;
} while (cursor != null && cursor.isNotEmpty);
```
**Why Critical:** Both conditions are necessary to prevent infinite loops.
- Only `!= null`: Would loop forever on empty string cursors
- Only `isNotEmpty`: Would crash on null cursors
- Wrong condition: Would terminate early or loop infinitely

### HasNext Logic
**Location:** `AddedPlantsPage.hasNext`
```dart
bool get hasNext =>
    pagination?.nextPage != null && pagination!.nextPage!.isNotEmpty;
```
**Why Critical:** Must check both null and empty conditions.
- Only null check: Would return true for empty strings
- Only empty check: Would crash on null values
- Wrong logic: Would cause incorrect pagination behavior

## JSON Parsing and Type Safety

### Data Type Validation
**Location:** `PlantService.getAddedPlants()`
```dart
final dataList = (json['data'] as List)  // This cast is critical
    .map((e) => AddedPlant.fromJson((e as Map).cast<String, dynamic>()))
    .toList();
```
**Why Critical:** Type casting ensures data structure assumptions.
- Removing `as List`: Would crash on unexpected data types
- Wrong cast type: Would cause runtime type errors
- Missing inner cast: Would fail on non-Map elements

### Message Field Extraction
**Location:** `HttpService._throwOnStatus()`
```dart
final message = json['message']?.toString() ?? 'Unknown error';
```
**Why Critical:** Must handle all possible message field states.
- No null check: Would crash on missing message fields
- No toString(): Would fail on non-string message values
- No fallback: Would use null as error message

### Enum Value Mapping
**Location:** `ActionType.fromApiValue()`
```dart
static ActionType? fromApiValue(String value) {
  for (final v in ActionType.values) {
    if (v.apiValue == value) return v;  // Exact match required
  }
  return null;  // Unknown values return null, don't crash
}
```
**Why Critical:** Must handle unknown enum values gracefully.
- No null return: Would crash on unknown API values
- Wrong comparison: Would match incorrectly
- Throwing exception: Would break on API changes

## DateTime Handling

### Defensive Parsing
**Location:** Custom DateTime converter
```dart
// Handles null, empty, and invalid date strings
@JsonKey(fromJson: _dateTimeFromJson)
DateTime? expiresAt;

static DateTime? _dateTimeFromJson(dynamic value) {
  if (value == null || value == '') return null;
  try {
    return DateTime.parse(value as String);
  } catch (_) {
    return null;  // Invalid dates become null, don't crash
  }
}
```
**Why Critical:** Must handle all possible date input states.
- No null check: Would crash on null values
- No empty check: Would crash on empty strings
- No try-catch: Would crash on invalid date formats
- Throwing instead of returning null: Would break on malformed data

## Request Configuration

### Hook Application
**Location:** `HttpService.sendRequest()`
```dart
if (configureRequest != null) {
  await configureRequest!(request);  // Must be called before sending
}
```
**Why Critical:** Configuration must be applied before request transmission.
- Not calling hook: Custom headers/tracing would be lost
- Calling after send: Too late to modify request
- Missing null check: Would crash when no hook provided

## Testing Completeness

Each of these critical logic paths has dedicated tests that would fail if the logic were mutated:

1. **Null check tests**: Verify exceptions are thrown when required values are null
2. **Boundary tests**: Test exact boundaries (199, 200, 299, 300, etc.)
3. **Retry limit tests**: Count exact number of requests to verify retry logic
4. **Type validation tests**: Send wrong data types and verify proper error handling
5. **Edge case tests**: Test empty strings, null values, and malformed data

This comprehensive approach ensures that mutation testing will detect any changes to critical business logic.