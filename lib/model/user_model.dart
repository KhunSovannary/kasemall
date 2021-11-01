Map<String, dynamic> user(String _fullname, String _password, String _phone,
    String vCode, String vId) {
  var data = {
    'name': _fullname,
    'password': _password,
    'phone': _phone,
    'requestId': vId,
    'verifyCode': vCode,
  };
  return data;
}