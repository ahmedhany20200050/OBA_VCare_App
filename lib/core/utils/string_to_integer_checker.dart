mixin StringToIntChecker {
  String? checkStringToIntConvertion(String? value) {
    try {
      int.parse(value!);
      return null;
    } catch (_) {
      return "Please, write a number";
    }
  }
}
