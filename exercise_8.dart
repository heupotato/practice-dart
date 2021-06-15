
import 'dart:io';

import 'dart:math';

final List<String> choice = ["rock", "paper", "scissor"]; 
final Map<String, String> result = {
    "rockpaper": "lose", 
    "rockscissor": "win", 
    "paperrock": "win", 
    "paperscissor": "lose", 
    "scissorrock": "lose", 
    "scissorpaper": "win"
};

void printRes(String input, String randomChoice){
    print("Your move: $input"); 
    print("Computer's move: $randomChoice"); 
    if (input == randomChoice) print("Draw!"); 
    else print("You ${result[input + randomChoice]}"); 
}
void main(List<String> args) {
    String input = ""; 
    while (input != "quit"){
        print("Make a move! `rock` or `paper` or `scissor`. Type `quit` to exit"); 
        input = stdin.readLineSync()!; 
        String randomChoice = choice[new Random().nextInt(3)]; 
        if (choice.contains(input)) printRes(input, randomChoice);
        else if (input!="quit") print("Invalid move! Please try again"); 
    }
}
