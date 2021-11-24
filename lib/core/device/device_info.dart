


class DeviceInfo{
  Map<String, dynamic> getDeviceInfo(){
    return {			  "DeviceVersion" :"Iphone 7",
                           "IMEINumber" : "",
                           "NetworkCountryISO" : 150,
                           "SIMCountryISO" :340,
                           "SIMSerialID" : "",
                           "SIMState" : "",
                           "UUIDNumber" :"1ee",
                           "DeviceManufacturer" : "Apple",
                           "PhoneNumber" : "09394242879",
                           "DeviceOS" : "",
                           "BuildVersion" : ""
    };
  }
  
  ///get device ID
  String getDeviceId(){
    return "9e9523e81515145f";
  }
  /// get company ID
  String getCompanyId(){
    return "4bf735e97269421a80b82359e7dc2288";
  }

  /// wether its iphone (I) or (A) for android
  String getDeviceType(){
    return "I";
  }
}