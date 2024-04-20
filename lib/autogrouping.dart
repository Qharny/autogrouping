import 'dart:io';
import 'package:autogrouping/grouping.dart';
import 'package:autogrouping/input_data.dart';
import 'package:autogrouping/output.dart';

void prompt() {
  // Prompt user to select choice
  stdout.write('AUTO GROUPING\n'
      '\n'
      'Select the data type:\n'
      '1. File (Read from an external file)\n'
      '2. Strings\n'
      '3. Numbers/Integers\n'
      'Enter your choice: ');

  // get user input
  var choice = int.parse(stdin.readLineSync() ?? '');

  List<dynamic> inputData = []; // List to store the data
  // a switch case to get choice
  switch (choice) {
    case 1:
      inputData = readFromFile();
      break;
    case 2:
      inputData = readStrings();
      break;
    case 3:
      inputData = readNumbers();
      break;
    default:
      print('Invalid input!');
      return;
  }
  // groupDetails();
  stdout.write('Enter number of Groups: ');
  var numOfGroups = int.parse(stdin.readLineSync()!);

  stdout.write("Enter number of entities in each group: ");
  var groupEntities = int.parse(stdin.readLineSync()!);

  print("Please wait... Your grouping will be done soon");

  var groupedData = groupData(inputData, numOfGroups, groupEntities);
  storeDataToFile(groupedData, 'output.txt');

  print('Grouping Completed. Check output.txt for the result.');
}
