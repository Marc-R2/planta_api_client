# Planta API Client (Dart)

Unofficial Dart client for the (Beta) [Planta Public API](https://getplanta.com/apps/api).  
Implements authentication (OTP → tokens, refresh), plant listing & retrieval, action completion, auto-refresh, and fully Freezed-based models with defensive DateTime parsing.

> Status: Beta API – fields or endpoints may change. This library aims to be resilient and easy to maintain.

> [!Important]
> This API requires a paid Planta Premium subscription to access the public API!

## Features

- OTP authorization & refresh
- Get paginated plants (`getAddedPlants`)
- Stream all plants transparently (`streamAllAddedPlants`)
- Fetch a single plant
- Complete a care action (watering, fertilizing, etc.)
- Automatic single refresh attempt on 401
- Defensive DateTime parsing (invalid -> null, no crash)
- Extensive documentation comments
- Fully test-covered (100% branch coverage goal)
- Freezed models with:
  - `copyWith`
  - Equality
  - `fromJson` / `toJson`
  - Null-safe optional fields

## Quick Start

```bash
dart pub get
dart run build_runner build --delete-conflicting-outputs
```

```dart
import 'package:planta_client/planta_client.dart';

final tokenStore = InMemoryTokenStore();
final client = PlantaApiClient(tokenStore: tokenStore);

await client.authorize('YOUR_OTP_CODE');
final page = await client.getAddedPlants();

for (final plant in page.plants) {
  print('Plant: ${plant.id}');
}

await client.completeAction(
  plantId: page.plants.first.id,
  actionType: ActionType.watering,
);
```

## Architecture

| Layer | Responsibility |
|-------|----------------|
| `PlantaApiClient` | High-level HTTP orchestration, auth, pagination, actions |
| `TokenStore` | Abstract token persistence (only in-memory included) |
| `models/` | Freezed data models + converters |
| `errors.dart` | Typed exception hierarchy |
| `example/` | Usage demonstration |
| `test/` | High coverage unit tests (mock HTTP) |

## Pagination

Use `getAddedPlants(cursor: ...)` manually or just iterate with:

```dart
await for (final plant in client.streamAllAddedPlants()) {
  // handle plant
}
```

## Action Completion

```dart
await client.completeAction(
  plantId: 'PLANT_ID',
  actionType: ActionType.fertilizing,
);
```

Returns `void` (success indicated by no exception).

## Auto-Refresh Logic

1. Request is sent with current access token.
2. If 401 → perform `refresh()`.
3. Retry request with new access token.
4. If still 401 → throw `PlantaAuthException`.

## Defensive Date Parsing

All documented date fields use a custom converter:
- Empty or invalid values become `null` instead of throwing.

## Error Mapping

| HTTP | Exception |
|------|-----------|
| 400 | `PlantaBadRequestException` |
| 401 | `PlantaAuthException` |
| 404 | `PlantaNotFoundException` |
| 500 | `PlantaServerException` |
| Other | `PlantaApiException` |
| Invalid JSON | `PlantaFormatException` |

## Testing

Run:
```bash
dart run build_runner build --delete-conflicting-outputs
dart test
```

Coverage:
```bash
dart test --coverage=coverage
dart run coverage:format_coverage --lcov --in=coverage --out=coverage/lcov.info --report-on=lib
```

## Extending

Potential improvements:
- Persistent `TokenStore` (e.g., using `flutter_secure_storage`)
- Retry/backoff strategy for 500s/network issues
- Rate limit handling (429) if introduced
- Additional endpoints as Planta expands API
- CLI wrapper for scripting
