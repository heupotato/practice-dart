import 'dart:io';



void main(){
    print("What's your name?"); 
    var name = stdin.readLineSync(); 
    print("How old are you?"); 
    int age = int.parse(stdin.readLineSync()!); 
    print("Hi $name, in ${100-age} more years you will be 100 years old"); 
}