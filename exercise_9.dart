import 'dart:io';
import 'dart:math';

void main(List<String> args) {
    print("Let's guess the number!"); 
    int number = Random().nextInt(100) +1; 
    int choice = 0;
    while (choice != number){
        choice = int.parse(stdin.readLineSync()!); 
        if (choice > number) print("Too high!"); 
        else if (choice < number) print("Too low!"); 
    }
    print("Exactly right!"); 
}