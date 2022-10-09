// função que dá upCaser em cada primeira letra de cada palavra
String upCaser(String text) {
  final List<String> words = text.split(' ');
  final List<String> newWords = [];
  for (var word in words) {
    final String newWord = word[0].toUpperCase() + word.substring(1);
    newWords.add(newWord);
  }
  return newWords.join(' ');
}

// formata o preço para o formato  0.000, 00,000 000,000...
String normalizerPrice(String value) {
  RegExp regExp = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  mathFunc(Match match) => '₦ ${match[0]},';
  return value.replaceAllMapped(regExp, mathFunc);
}
