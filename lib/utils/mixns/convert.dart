abstract class Convert {
  listToString(List listahan) {
    String result = "";
    for (int i = 0; i < listahan.length; i++) {
      result = '$result, ${listahan[i]}';
    }

    return result;
  }

  isAllergy(List container1, List container2) {
    List arr = [];
    arr.clear();
    arr = [...container1.where(container2.contains)];

    if (arr.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
