import 'package:planta_client/planta_client.dart';

/// Example usage:
/// Demonstrates OTP authorization, list retrieval, streaming all plants,
/// retrieving a single plant, and completing an action.
///
/// NOTE: Replace the OTP and plant IDs with real values in a live context.
Future<void> main() async {
  final tokenStore = InMemoryTokenStore();
  final client = PlantaApiClient(tokenStore: tokenStore);

  try {
    // 1. Authorize via OTP (placeholder code).
    final tokens = await client.authorize('123456');
    print('Access Token (prefix): ${tokens.accessToken.substring(0, 6)}...');

    // 2. Fetch first page of plants.
    final firstPage = await client.getAddedPlants();
    print('First page plant count: ${firstPage.plants.length}');
    if (firstPage.hasNext) {
      print('Next cursor: ${firstPage.pagination?.nextPage}');
    }

    // 3. Stream all plants (across pagination).
    await for (final plant in client.streamAllAddedPlants()) {
      print('Plant ${plant.id} - ${plant.names?.localizedName}');
    }

    // 4. Retrieve details for first plant (if any).
    if (firstPage.plants.isNotEmpty) {
      final id = firstPage.plants.first.id;
      final details = await client.getAddedPlant(id);
      print(
        'Details: id=$id health=${details.health} site=${details.site?.name}',
      );
    }

    // 5. Complete an action (example watering).
    if (firstPage.plants.isNotEmpty) {
      await client.completeAction(
        plantId: firstPage.plants.first.id,
        actionType: ActionType.watering,
      );
      print('Watering action completed.');
    }
  } on PlantaApiException catch (e) {
    print('API error: $e');
  } finally {
    client.close();
  }
}
