
import 'dart:io';
import 'dart:math';

import 'package:english_words/english_words.dart';
String generatePassword(String strength){
    String randomWords = ""; 
    if (strength == "weak") {
        generateWordPairs().take(1).forEach((element) {randomWords = shuffleString(element.toString()); }); 
        return randomWords; 
    } 
    else {
        List<int> randomCrypto = List.generate(21, (_) => Random.secure().nextInt(75) + 48); 
        randomWords = String.fromCharCodes(randomCrypto) ;
        return shuffleString(randomWords); 
    }
}

String shuffleString(String str){
    String res = ""; 
    List<String> chars = str.split(""); 
    chars.shuffle(); 
    res = chars.join(""); 
    return res; 
}
void main(List<String> args) {
    print("Enter strength of password... `weak` or `strong`?"); 
    String strength = stdin.readLineSync()!; 
    while (strength != "weak" && strength !="strong")
    {
        print("Invalid strength"); 
        strength = stdin.readLineSync()!; 
    }
    print("Generating new password"); 
    print(generatePassword(strength));
}