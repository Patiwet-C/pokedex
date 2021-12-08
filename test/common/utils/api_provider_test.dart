import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/common/utils/api_provider.dart';

void main() {
  group('ApiProvider', () {
    late ApiProvider sut;

    setUp(() {
      sut = ApiProvider();
    });

    test('Call get successfully and return status 200', () async {
      String endpoint = 'pokemon';

      await sut.get(endpoint: endpoint);

      expect(sut.statusCode, 200);
    });

    test('Call get successfully and return status 404', () async {
      String endpoint = 'bad-path';

      await sut.get(endpoint: endpoint);

      expect(sut.statusCode, 404);
    });

    test('Call getByUrl successfully and return status 200', () async {
      String path = 'https://pokeapi.co/api/v2/pokemon';

      await sut.getByUrl(urlString: path);

      expect(sut.statusCode, 200);
    });

    test('Call getByUrl successfully and return status 404', () async {
      String path = 'https://pokeapi.co/api/v2/bad-path';

      await sut.getByUrl(urlString: path);

      expect(sut.statusCode, 404);
    });

    test('Call getByUrl queryParams successfully and return status 200',
        () async {
      String path = 'https://pokeapi.co/api/v2/pokemon';
      Map<String, String> queryParams = {'limit': '20', 'offset': '20'};

      await sut.getByUrl(urlString: path, queryParams: queryParams);

      expect(sut.statusCode, 200);
    });

    test('Call getByUrl with queryParams successfully and return status 404',
        () async {
      String path = 'https://pokeapi.co/api/v2/bad-path';
      Map<String, String> queryParams = {'limit': '20', 'offset': '20'};

      await sut.getByUrl(urlString: path, queryParams: queryParams);

      expect(sut.statusCode, 404);
    });
  });
}
