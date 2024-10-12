class ContactDetailModel {
  bool? status;
  String? message;
  DetailData? data;

  ContactDetailModel({this.status, this.message, this.data});

  ContactDetailModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? DetailData.fromJson(json['data']) : null;
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

class DetailData {
  String? id;
  Null companyId;
  String? firstName;
  String? lastName;
  String? mobile;
  String? email;
  Null profile;
  Null branchId;
  Null departmentId;
  String? createdAt;
  String? updatedAt;
  int? status;
  Null otp;
  Null otpExpiry;
  int? isChangePassword;
  Null companyName;
  Null branchName;
  Null departmentName;
  List<Null>? contactTypes;
  List<Addresses>? addresses;
  Null company;

  DetailData(
      {this.id,
      this.companyId,
      this.firstName,
      this.lastName,
      this.mobile,
      this.email,
      this.profile,
      this.branchId,
      this.departmentId,
      this.createdAt,
      this.updatedAt,
      this.status,
      this.otp,
      this.otpExpiry,
      this.isChangePassword,
      this.companyName,
      this.branchName,
      this.departmentName,
      this.contactTypes,
      this.addresses,
      this.company});

  DetailData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    mobile = json['mobile'];
    email = json['email'];
    profile = json['profile'];
    branchId = json['branch_id'];
    departmentId = json['department_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
    otp = json['otp'];
    otpExpiry = json['otp_expiry'];
    isChangePassword = json['is_change_password'];
    companyName = json['company_name'];
    branchName = json['branch_name'];
    departmentName = json['department_name'];
    if (json['contact_types'] != null) {
      contactTypes = <Null>[];
      json['contact_types'].forEach((v) {
        // contactTypes!.add(Null.fromJson(v));
      });
    }
    if (json['addresses'] != null) {
      addresses = <Addresses>[];
      json['addresses'].forEach((v) {
        addresses!.add(Addresses.fromJson(v));
      });
    }
    company = json['company'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['company_id'] = companyId;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['mobile'] = mobile;
    data['email'] = email;
    data['profile'] = profile;
    data['branch_id'] = branchId;
    data['department_id'] = departmentId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['status'] = status;
    data['otp'] = otp;
    data['otp_expiry'] = otpExpiry;
    data['is_change_password'] = isChangePassword;
    data['company_name'] = companyName;
    data['branch_name'] = branchName;
    data['department_name'] = departmentName;
    if (contactTypes != null) {
      // data['contact_types'] =
      // this.contactTypes!.map((v) => v.toJson()).toList();
    }
    if (addresses != null) {
      data['addresses'] = addresses!.map((v) => v.toJson()).toList();
    }
    data['company'] = company;
    return data;
  }
}

class Addresses {
  String? id;
  String? contactId;
  int? countryId;
  int? stateId;
  String? addressLine1;
  String? addressLine2;
  String? landmark;
  String? city;
  String? pincode;
  int? isDefault;
  String? countryName;
  String? stateName;

  Addresses(
      {this.id,
      this.contactId,
      this.countryId,
      this.stateId,
      this.addressLine1,
      this.addressLine2,
      this.landmark,
      this.city,
      this.pincode,
      this.isDefault,
      this.countryName,
      this.stateName});

  Addresses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    contactId = json['contact_id'];
    countryId = json['country_id'];
    stateId = json['state_id'];
    addressLine1 = json['address_line_1'];
    addressLine2 = json['address_line_2'];
    landmark = json['landmark'];
    city = json['city'];
    pincode = json['pincode'];
    isDefault = json['is_default'];
    countryName = json['country_name'];
    stateName = json['state_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['contact_id'] = contactId;
    data['country_id'] = countryId;
    data['state_id'] = stateId;
    data['address_line_1'] = addressLine1;
    data['address_line_2'] = addressLine2;
    data['landmark'] = landmark;
    data['city'] = city;
    data['pincode'] = pincode;
    data['is_default'] = isDefault;
    data['country_name'] = countryName;
    data['state_name'] = stateName;
    return data;
  }
}
