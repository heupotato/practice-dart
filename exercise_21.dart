import 'dart:io';
import 'dart:math';

void main(List<String> args) {
    print("Think of a number from 0 to 100"); 
    int choice = 0; 
    int low = 0; 
    int high = 101; 
    while (choice != 3){
        int guess = Random().nextInt(high - low) + low;
        print("Computer's guess: $guess");  
        print("If guess is lower: press 1\nIf guess is higher: press 2\nIf guess is correct: press 3"); 
        choice = int.parse(stdin.readLineSync()!); 
        switch (choice){
            case 1: 
                high = guess; 
                guess = Random().nextInt(high - low) + low; 
                break; 
            case 2: 
                low = guess; 
                guess = Random().nextInt(high - low) + low; 
                break; 
            case 3: 
                print("Your chosen number is $guess"); 
                break; 
            default: 
                print("No such choice"); 
        }
    }
}