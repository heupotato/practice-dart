import 'dart:io';
String convertString(String str){
  String res = ""; 
  List<String> strParts = str.split(" "); 
  for (int i = strParts.length - 1; i>=0;  i--)
    res += strParts[i] + " "; 
  return res; 
}
void main(List<String> args) {
  String str = stdin.readLineSync()!; 
  print(convertString(str));
}