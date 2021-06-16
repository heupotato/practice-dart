import 'dart:io';

import 'dart:math';

String pickRandomWord(String path){
    var inputFile = File(path);   
    final List<String> words = inputFile.readAsLinesSync(); 
    return(words[Random().nextInt(words.length)]); 
}
void main(List<String> args) {
    print("Selecting a random word..."); 
    print(pickRandomWord("sowpods.txt")); 
}