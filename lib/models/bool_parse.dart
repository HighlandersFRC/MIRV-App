bool? parseBool(String? val) {
  if (val?.toLowerCase() == 'true') {
    return true;
  } else if (val?.toLowerCase() == 'false') {
    return false;
  } else {
    return null;
  }
}
