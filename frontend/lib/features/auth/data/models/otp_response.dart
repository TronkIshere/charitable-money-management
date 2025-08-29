import 'package:frontend/features/auth/domain/entity/otp_entity.dart';

class OtpResponse extends OtpEntity {
  OtpResponse({required super.otp});

  factory OtpResponse.fromJson(Map<String, dynamic> json) {
    return OtpResponse(otp: json['otp']);
  }
}
