dynamic booleanConversion(dynamic answer) {
  String item = answer.toString().toLowerCase();
  switch (item) {
    case "yes":
      {
        return true;
      }

    case "no":
      {
        return false;
      }
    case "true":
      {
        return "Yes";
      }
    case "false":
      {
        return "No";
      }
  }
}

removeDuplicateItem(List item) {
  return item.toSet().toList();
}
