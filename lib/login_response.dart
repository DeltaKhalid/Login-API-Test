class LoginResponse {
  late String status;
  late String token;
  late UserData data;

  LoginResponse({required this.status, required this.token, required this.data});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      status: json['status'],
      token: json['token'],
      data: UserData.fromJson(json['data']),
    );
  }
}

class UserData {
  late int id;
  late String username;
  late String email;
  late String first_name;
  late String last_name;
  late bool is_staff;
  late bool is_superuser;
  late bool is_active;
  late String date_joined;

  UserData({
    required this.id,
    required this.username,
    required this.email,
    required this.first_name,
    required this.last_name,
    required this.is_staff,
    required this.is_superuser,
    required this.is_active,
    required this.date_joined,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      first_name: json['first_name'],
      last_name: json['last_name'],
      is_staff: json['is_staff'],
      is_superuser: json['is_superuser'],
      is_active: json['is_active'],
      date_joined: json['date_joined'],
    );
  }
}
