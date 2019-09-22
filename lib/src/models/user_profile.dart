class UserProfile{

  String userId;
  bool isArtist;
  String firstName;
  String lastName;
  int phoneNumber;
  String address1;
  String address2;
  String addressCity;

  UserProfile({
    this.userId,
    this.isArtist,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.address1,
    this.address2,
    this.addressCity
  });

  UserProfile.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    isArtist = json['is_artist'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phoneNumber = json['phone_number'];
    address1 = json['address_1'];
    address2 = json['address_2'];
    addressCity = json['address_city'];
  }

}