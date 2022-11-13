class UserDataModel{
   String firstName;
   String email;
   String lastName;
   String mobileNumber;

  UserDataModel({
    this.firstName,  this.email,  this.lastName,  this.mobileNumber,
});
  UserDataModel.fromJson(Map<String,dynamic>json){
    firstName=json['firstName'];
     email=json['email'];
    lastName=json['lastName'];
    mobileNumber=json['mobileNumber'];
  }
  Map<String,dynamic>tomap(){
    return{
      'firstName':firstName,
      'email':email,
      'lastName':lastName,
      'mobileNumber':mobileNumber,

    };
  }
}