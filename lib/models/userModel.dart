class UserModel{
  double?latitude;
  double?longitude;
  String? uId;
  String? name;
  String? email;
  String? password;
  String? phone;
  String? location;
  String? Specialty;
  UserModel({
    this.longitude,
    this.latitude,
    this.uId,
    this.email,
    this.location,
    this.name,
    this.password,
    this.phone,
    this.Specialty,
  });
  UserModel.fromMap(Map<String,dynamic>jason){
    longitude=jason['longitude'];
    latitude=jason['latitude'];
    uId=jason['uId'];
    email=jason['email'];
    location=jason['location'];
    name=jason['name'];
    password=jason['password'];
    phone=jason['phone'];
    Specialty=jason['Specialty'];
  }
  Map<String,dynamic>toMap(){
    return{
      'longitude':longitude,
      'latitude':latitude,
      'uId':uId,
      'email':email,
      'location':location,
      'name':name,
      'password':password,
      'phone':phone,
      'Specialty':Specialty,
    };
  }
}

