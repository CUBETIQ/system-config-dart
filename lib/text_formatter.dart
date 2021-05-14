class TextFormatter {
  String? text;

  TextFormatter(String? text) {
    this.text = text;
  }

  String? format(List<dynamic> args) {
    if (text == null) {
      return null;
    }

    var msg = text;
    args.asMap().forEach((index, element) {
      msg = msg?.replaceAll('{$index}', element);
    });

    return msg;
  }

  String? decorate(Map<String, dynamic> args) {
    if (text == null) {
      return null;
    }

    var msg = text;
    args.forEach((index, element) {
      msg = msg?.replaceAll('{$index}', element);
    });

    return msg;
  }
}
