import 'package:eventlog/Data/Proces.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Proces ...', () {
    final Proces proces =
        Proces(1, '2022-05-28 10:05:00', 'Jane Doe', 0123456789);

    expect(proces.proces_id, 1);
  });
}
