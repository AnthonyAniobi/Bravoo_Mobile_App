import 'package:equatable/equatable.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase show User;

class UserModel extends Equatable {
  final String id;
  final String email;
  final String firstName;
  final String lastName;

  const UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      email: map['email'] as String,
      firstName: map['first_name'] as String? ?? '',
      lastName: map['last_name'] as String? ?? '',
    );
  }

  factory UserModel.fromSupabaseUser(supabase.User user) {
    final userMetadata = user.userMetadata ?? {};
    return UserModel(
      id: user.id,
      email: user.email ?? '',
      firstName: userMetadata['first_name'] as String? ?? '',
      lastName: userMetadata['last_name'] as String? ?? '',
    );
  }

  @override
  List<Object?> get props => [id, email, firstName, lastName];
}
