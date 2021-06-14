import 'dart:io';
import 'package:strings/strings.dart'; 
void main(List<String> args) {
  var str = stdin.readLineSync()!; 
  var res = reverse(str); 
  if (res == str) print("$str is a palindrome string"); 
  else print("$str is not a palindrome string"); 
}