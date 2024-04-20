List<List<dynamic>> groupData(
    List<dynamic> data, int numOfGroups, int groupEntities) {
  List<List<dynamic>> groupedData = [];

  for (int i = 0; i < numOfGroups; i++) {
    var start = i * groupEntities;
    var end = (i + 1) * groupEntities;
    if (end > data.length) {
      end = data.length;
    }
    groupedData.add(data.sublist(start, end));
  }
  return groupedData;
}
