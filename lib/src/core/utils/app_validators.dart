class AppValidators {
  static final _emailRegex = RegExp(
    r"^[-!#$%&'*+/0-9=?A-Z^_a-z{|}~](\.?[-!#$%&'*+/0-9=?A-Z^_a-z{|}~])*@[a-zA-Z](-?[a-zA-Z0-9])*(\.[a-zA-Z](-?[a-zA-Z0-9])*)+$",
  );

  static String? name(
    String? text, [
    String warningText = "Enter a valid name",
  ]) => (text?.length ?? 0) <= 2 ? warningText : null;

  static String? email(String? text) =>
      _emailRegex.hasMatch(text ?? "") ? null : "Enter a valid email";

  static String? password(String? text) => (text?.length ?? 0) > 4
      ? null
      : "Password must be at least 4 characters long";
}
