class ContactListModel {
  bool? status;
  String? message;
  List<ContactData>? data;

  ContactListModel({this.status, this.message, this.data});

  ContactListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ContactData>[];
      json['data'].forEach((v) {
        data!.add(ContactData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ContactData {
  String? id;
  String? firstName;
  String? lastName;
  String? mobile;
  String? email;
  String? profile;
  String? companyId;
  String? companyName;
  String? branchId;
  String? branchName;
  Null departmentId;
  Null departmentName;
  int? status;
  String? createdAt;
  String? updatedAt;
  List<ContactTypes>? contactTypes;
  List<Addresses>? addresses;

  ContactData(
      {this.id,
      this.firstName,
      this.lastName,
      this.mobile,
      this.email,
      this.profile,
      this.companyId,
      this.companyName,
      this.branchId,
      this.branchName,
      this.departmentId,
      this.departmentName,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.contactTypes,
      this.addresses});

  ContactData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    mobile = json['mobile'];
    email = json['email'];
    profile = json['profile'];
    companyId = json['company_id'];
    companyName = json['company_name'];
    branchId = json['branch_id'];
    branchName = json['branch_name'];
    departmentId = json['department_id'];
    departmentName = json['department_name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['contact_types'] != null) {
      contactTypes = <ContactTypes>[];
      json['contact_types'].forEach((v) {
        contactTypes!.add(ContactTypes.fromJson(v));
      });
    }
    if (json['addresses'] != null) {
      addresses = <Addresses>[];
      json['addresses'].forEach((v) {
        addresses!.add(Addresses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['mobile'] = mobile;
    data['email'] = email;
    data['profile'] = profile;
    data['company_id'] = companyId;
    data['company_name'] = companyName;
    data['branch_id'] = branchId;
    data['branch_name'] = branchName;
    data['department_id'] = departmentId;
    data['department_name'] = departmentName;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (contactTypes != null) {
      data['contact_types'] = contactTypes!.map((v) => v.toJson()).toList();
    }
    if (addresses != null) {
      data['addresses'] = addresses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ContactTypes {
  String? id;
  String? name;
  Pivot? pivot;

  ContactTypes({this.id, this.name, this.pivot});

  ContactTypes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (pivot != null) {
      data['pivot'] = pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  String? contactId;
  String? contactTypeId;
  String? createdAt;
  String? updatedAt;

  Pivot({this.contactId, this.contactTypeId, this.createdAt, this.updatedAt});

  Pivot.fromJson(Map<String, dynamic> json) {
    contactId = json['contact_id'];
    contactTypeId = json['contact_type_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['contact_id'] = contactId;
    data['contact_type_id'] = contactTypeId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Addresses {
  String? id;
  String? addressLine1;
  String? addressLine2;
  String? landmark;
  String? city;
  String? pincode;
  int? countryId;
  int? stateId;
  int? isDefault;
  String? countryName;
  String? stateName;
  String? createdAt;
  String? updatedAt;

  Addresses(
      {this.id,
      this.addressLine1,
      this.addressLine2,
      this.landmark,
      this.city,
      this.pincode,
      this.countryId,
      this.stateId,
      this.isDefault,
      this.countryName,
      this.stateName,
      this.createdAt,
      this.updatedAt});

  Addresses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    addressLine1 = json['address_line_1'];
    addressLine2 = json['address_line_2'];
    landmark = json['landmark'];
    city = json['city'];
    pincode = json['pincode'];
    countryId = json['country_id'];
    stateId = json['state_id'];
    isDefault = json['is_default'];
    countryName = json['country_name'];
    stateName = json['state_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['address_line_1'] = addressLine1;
    data['address_line_2'] = addressLine2;
    data['landmark'] = landmark;
    data['city'] = city;
    data['pincode'] = pincode;
    data['country_id'] = countryId;
    data['state_id'] = stateId;
    data['is_default'] = isDefault;
    data['country_name'] = countryName;
    data['state_name'] = stateName;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
