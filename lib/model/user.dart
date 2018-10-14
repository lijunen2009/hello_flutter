class User{
  final String name;
  final String phone;
  User(this.name,this.phone);
  User.fromJson(Map<String, dynamic> json): name = json['name'],phone = json['phone'];

  Map<String, dynamic> toJson() =>
    {
      'name': name,
      'phone': phone,
    };
}