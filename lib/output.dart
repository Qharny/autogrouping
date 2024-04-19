import 'dart:io';

void storeDataToFile(List<List<dynamic>> data, String filename) {
  var file = File(filename);
  var sink = file.openWrite();

  for (var i = 0; i < data.length; i++) {
    sink.writeln('Group ${i + 1}:');
    for (var item in data[i]) {
      sink.writeln(item);
    }
    sink.writeln(); // Add a blank line between different groups
  }

  sink.close();
}