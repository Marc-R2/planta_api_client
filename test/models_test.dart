import 'package:planta_client/planta_client.dart';
import 'package:test/test.dart';

void main() {
  group('Models & Freezed', () {
    test('Tokens fromJson null expiresAt is null', () {
      final json = {
        'accessToken': 'abc',
        'refreshToken': 'def',
        'tokenType': 'Bearer',
        'expiresAt': null,
      };
      final t = Tokens.fromJson(json);
      expect(t.expiresAt, isNull);
    });

    test('Tokens fromJson invalid expiresAt becomes null (converter)', () {
      final json = {
        'accessToken': 'abc',
        'refreshToken': 'def',
        'tokenType': 'Bearer',
        'expiresAt': 'NOT_A_DATE',
      };
      final t = Tokens.fromJson(json);
      expect(t.expiresAt, isNull);
    });

    test('PlantImage invalid lastUpdated -> null (converter)', () {
      final img = PlantImage.fromJson({'url': 'u', 'lastUpdated': 'xxx'});
      expect(img.lastUpdated, isNull);
    });

    test('ActionInstance invalid date -> null', () {
      final ai = ActionInstance.fromJson({'date': '???', 'type': 'liquid'});
      expect(ai.date, isNull);
    });

    test('AddedPlantsPage.hasNext true/false variants', () {
      const p1 = AddedPlantsPage([], Pagination(nextPage: 'cursor1'));
      expect(p1.hasNext, isTrue);

      const p2 = AddedPlantsPage([], Pagination(nextPage: ''));
      expect(p2.hasNext, isFalse);

      const p3 = AddedPlantsPage([], null);
      expect(p3.hasNext, isFalse);
    });

    test('ActionType.fromApiValue & apiValue mapping', () {
      expect(ActionType.fromApiValue('watering'), ActionType.watering);
      expect(ActionType.fromApiValue('unknown'), isNull);
      expect(ActionType.fertilizing.apiValue, 'fertilizing');
    });

    test('AddedPlant minimal fromJson + copyWith', () {
      final plant = AddedPlant.fromJson({'id': 'p1'});
      final plant2 = plant.copyWith(health: 'good');
      expect(plant2.health, 'good');
      expect(plant2.id, 'p1');
      expect(plant2, isNot(equals(plant)));
    });

    test('Nested structures fromJson (actions, names, site)', () {
      final plant = AddedPlant.fromJson({
        'id': 'p2',
        'names': {'localizedName': 'Aloe'},
        'site': {'id': 's1', 'name': 'Living Room'},
        'actions': {
          'watering': {
            'next': {'date': '2024-01-01T00:00:00Z'},
            'completed': {'date': '2023-12-01T00:00:00Z'},
          },
        },
      });
      expect(plant.names?.localizedName, 'Aloe');
      expect(plant.site?.name, 'Living Room');
      expect(plant.actions?.watering?.next?.date, isNotNull);
    });
  });
}
