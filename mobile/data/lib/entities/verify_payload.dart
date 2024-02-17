import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_payload.freezed.dart';
part 'verify_payload.g.dart';

@freezed
class VerifyPayload with _$VerifyPayload {
  const factory VerifyPayload({
    required String address,
    required String signature,
  }) = _VerifyPayload;

  factory VerifyPayload.fromJson(Map<String, Object?> json) => _$VerifyPayloadFromJson(json);
}
