// int calculate() {
//   return 6 * 7;
// }

import 'dart:io';

void main(List<String> args) {
  prompt();
}

void prompt() {
  print("Select your Input choice: \n");
  print("-----------\n");
  print(
      "1. Read External file \n2. Input Characters \n3. Input numbers \n4. exit");
  print("\nSelect 1, 2, 3 or 4: ");
  // get user input
  var input = int.parse(stdin.readLineSync() ?? '');
  // condition to select chose
  if (input == 1) {
    // get external file and red content
    try {
      File file =
          File("C://Users//MR_KABUTEYY//Desktop//test.txt"); // get file path
      print("Do you want to see file content? \n Y for Yes and N for No");
      var readContent = stdin.readLineSync();
      if (readContent?.toLowerCase() == 'y') {
        String contents = file.readAsStringSync();
        print(contents);
      } else if (readContent?.toLowerCase() == "n") {
        print("Continuing proccess");
      }
    } catch (e) {
      print("Error reading file $e");
    }
  }
  if (input == 2) {}
  if (input == 3) {}
  if (input == 4) {}
}
