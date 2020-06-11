import 'package:flutter_test/flutter_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:DoMyBidding/widgets/date_format.dart';

void main() {
  test('date format', () {
    DateTimeFormatter dateTimeFormatter = DateTimeFormatter();

    Timestamp timestamp = Timestamp.fromMillisecondsSinceEpoch(1591909701000);

    expect(dateTimeFormatter.dateToString(timestamp), equals("11-06-2020"));
  });
}
