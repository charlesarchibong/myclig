import 'package:flutter/foundation.dart';

const _BASE_URL = kReleaseMode
    ? 'https://myclig-stage.azurewebsites.net/api'
    : 'https://myclig-staging-new.azurewebsites.net/api';
// const _BASE_URL = 'https://myclig-stage.azurewebsites.net/api';
const LOGIN_ENDPOINT = _BASE_URL + 'login';
