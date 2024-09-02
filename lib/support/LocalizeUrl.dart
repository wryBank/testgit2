class Localizeurl {
  static Map<String, String> getLocaleUrl(String locale) {
    switch (locale) {
      case 'th_TH':
        return {'url': 'https://drive.google.com/uc?export=download&id=104vb9Kgt-5LUSA5Rvo14A0LJ-g9FnpnV', 'fileName': 'th-TH.json'};
      case 'en_US':
        return {'url': 'https://drive.google.com/uc?export=download&id=1Qn4-CpOxaEVeAsO8f3BKj2GciwMJATyg', 'fileName': 'en-US.json'};
      default:
        return {'url': 'https://drive.google.com/uc?export=download&id=1Qn4-CpOxaEVeAsO8f3BKj2GciwMJATyg', 'fileName': 'en-US.json'};
    }
  }
}
