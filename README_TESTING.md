# Testing & Coverage

This project includes thorough tests to achieve (and sustain) 100% branch coverage, including error paths, refresh flows, pagination, and parsing edge cases.

## Pre-Requisites

Generate code before running tests:
```bash
dart run build_runner build --delete-conflicting-outputs
```

## Run Tests

```bash
dart test
```

## Coverage (LCOV)

```bash
dart test --coverage=coverage
dart run coverage:format_coverage --lcov --in=coverage --out=coverage/lcov.info --report-on=lib
```

Optionally generate HTML:
```bash
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

## What Is Covered

- Authorization success + invalid (format) response
- Refresh success + missing refresh token edge
- Pagination:
  - Single page
  - Multi-page stream
- Single plant retrieval
- Action completion:
  - Success (204)
  - Error (400) while expecting no content
- Auto-refresh logic:
  - 401 -> refresh -> success
  - 401 -> refresh -> still 401 -> auth exception
- Error mapping for 400, 401, 404, 500, other status
- Format exception for invalid JSON
- `configureRequest` hook invocation
- Model JSON parsing, copyWith, invalid dates
- Enum mapping (`ActionType.fromApiValue`)
- DateTime converter behaviors (valid/invalid/empty)

## Mutation Testing Suggestions

When performing manual mutation analysis, ensure tests fail if you mutate:
- Refresh branch (remove second 401 attempt)
- Authorization header line
- Pagination loop condition
- `ActionType.fromApiValue` logic
- DateTime converter to always return non-null
- Exception mapping (e.g., map 400 to wrong exception)
- Early return in `hasNext`

## Adding New Branches

If you add logic (e.g., token expiry pre-check), write tests covering:
- Expired token path
- Non-expired token path

## Tips

- Keep tests deterministic (no reliance on actual network).
- Use `MockClient` for all HTTP scenarios.
- Favor explicit expectations (`throwsA(isA<Type>())`).

Happy testing!