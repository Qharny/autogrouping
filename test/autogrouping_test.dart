// import 'package:autogrouping/autogrouping.dart';
// import 'package:test/test.dart';

// void main() {
//   test('calculate', () {
//     expect(calculate(), 42);
//   });
// }


// writting test file for  my dart auto grouping project
import 'package:test/test.dart';
import '../main.dart';

// Import the code you want to test
// replace 'your_code_file.dart' with the actual filename

void main() {
  group('Grouping Test', () {
    test('Grouping test', () {
      // Test data
      List<dynamic> testData = ['John', 10, 3.14, 'Alice', 20, true, 'Bob'];

      // Expected result after grouping
      Map<Type, List<dynamic>> expectedGroupedData = {
        String: ['John', 'Alice', 'Bob'],
        int: [10, 20],
        double: [3.14],
        bool: [true]
      };

      // Call the function you want to test
      Map<Type, List<dynamic>> actualGroupedData = groupData(testData);

      // Compare the actual result with the expected result
      expect(actualGroupedData, equals(expectedGroupedData));
    });
  });
}
