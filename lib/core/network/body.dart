


class NetworkBody{

  final String companyId;
  final String deviceType;
  final String deviceInfo;
  final String deviceId;
  NetworkBody(this.companyId, this.deviceType, this.deviceInfo, this.deviceId);

  Map<String, dynamic> bodyDefault(){
    return {
        "company_id":companyId,
        // "device_type":deviceType,
        // "device_info":deviceInfo,
        "device_id":deviceId
      };
  }
}