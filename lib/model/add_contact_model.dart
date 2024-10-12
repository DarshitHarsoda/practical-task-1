class AddContactModel {
  bool? status;
  String? message;
  Data? data;

  AddContactModel({this.status, this.message, this.data});

  AddContactModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? firstName;
  String? lastName;
  String? mobile;
  String? email;
  String? profile;
  Null companyId;
  Null branchId;
  Null departmentId;
  String? id;
  String? updatedAt;
  String? createdAt;
  Null companyName;
  Null company;

  Data(
      {this.firstName,
      this.lastName,
      this.mobile,
      this.email,
      this.profile,
      this.companyId,
      this.branchId,
      this.departmentId,
      this.id,
      this.updatedAt,
      this.createdAt,
      this.companyName,
      this.company});

  Data.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    mobile = json['mobile'];
    email = json['email'];
    profile = json['profile'];
    companyId = json['company_id'];
    branchId = json['branch_id'];
    departmentId = json['department_id'];
    id = json['id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    companyName = json['company_name'];
    company = json['company'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['mobile'] = mobile;
    data['email'] = email;
    data['profile'] = profile;
    data['company_id'] = companyId;
    data['branch_id'] = branchId;
    data['department_id'] = departmentId;
    data['id'] = id;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['company_name'] = companyName;
    data['company'] = company;
    return data;
  }
}
