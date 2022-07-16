class UserModel {
  final String? pk;
  final String? id;
  final String? email;
  final String? first_name;
  final String? last_name;
  final String? full_name;
  final String? avatar;
  final String? dob; //date of birth format: 1999-08-12
  final String? invitation_code; //invitation code from
  final String? customer_logo;
  final String? customer_name;
  final String? mobile;
  final String? userName;
  final String? password1;
  final String? password2;

  UserModel(
      {this.email,
      this.first_name,
      this.last_name,
      this.pk,
      this.avatar,
      this.id,
      this.customer_logo,
      this.customer_name,
      this.dob,
      this.full_name,
      this.invitation_code,
      this.mobile,
      this.userName,
      this.password1,
      this.password2});

  factory UserModel.fromJson(Map json) {
    return UserModel(
        avatar: json['avatar'],
        email: json['email'],
        first_name: json['first_name'],
        last_name: json['last_name'],
        pk: json['pk'],
        id: json['id'],
        customer_logo: json['customer']['logo'],
        customer_name: json['customer']['name'],
        dob: json['dob'],
        full_name: json['full_name'],
        invitation_code: json['invitation_code'],
        mobile: json['mobile']);
  }
}
