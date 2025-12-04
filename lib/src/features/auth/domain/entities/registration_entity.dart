class RegistrationEntity {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String phone;

  RegistrationEntity({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phone,
  });

  RegistrationEntity copyWith({
    String? ninImage,
    String? profilePic,
    String? tempNinPicture,
    String? tempProfilePicture,
  }) {
    return RegistrationEntity(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
      phone: phone,
    );
  }

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "password": password,
    "phone": phone,
  };
}
