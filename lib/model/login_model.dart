class LoginModel {
  bool? status;
  String? message;
  String? token;
  User? user;

  LoginModel({this.status, this.message, this.token, this.user});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    token = json['token'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['token'] = token;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  String? id;
  String? firstName;
  String? lastName;
  String? mobile;
  String? email;
  int? isChangePassword;
  String? otp;
  Null profile;
  Roles? roles;
  List<String>? permissions;

  User(
      {this.id,
      this.firstName,
      this.lastName,
      this.mobile,
      this.email,
      this.isChangePassword,
      this.otp,
      this.profile,
      this.roles,
      this.permissions});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    mobile = json['mobile'];
    email = json['email'];
    isChangePassword = json['is_change_password'];
    otp = json['otp'];
    profile = json['profile'];
    roles = json['roles'] != null ? Roles.fromJson(json['roles']) : null;
    permissions = json['permissions'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['mobile'] = mobile;
    data['email'] = email;
    data['is_change_password'] = isChangePassword;
    data['otp'] = otp;
    data['profile'] = profile;
    if (roles != null) {
      data['roles'] = roles!.toJson();
    }
    data['permissions'] = permissions;
    return data;
  }
}

class Roles {
  String? id;
  String? name;
  String? guardName;
  int? status;
  String? discount;

  Roles({this.id, this.name, this.guardName, this.status, this.discount});

  Roles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    guardName = json['guard_name'];
    status = json['status'];
    discount = json['discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['guard_name'] = guardName;
    data['status'] = status;
    data['discount'] = discount;
    return data;
  }
}
