class StringManipulation {
  String upperCaseFirstCharacter(String param) {
    String newWord = "";
    for(var i = 0; i < param.length; i++) {
      if (i == 0) {
        newWord = param[i].toUpperCase();
      } else {
        newWord+= param[i];
      }
    }
    return newWord;
  }
}
