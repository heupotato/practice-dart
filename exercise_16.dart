import 'dart:io';
import 'dart:math';

void main(List<String> args) {
    print("Generating number"); 
    List<int> randomNum = List.generate(4, (_) => Random().nextInt(10)); 
    randomNum = randomNum.toSet().toList(); 
    while (randomNum.length <4 || randomNum[0] == 0){
        randomNum = List.generate(4, (_) => Random().nextInt(10)); 
        randomNum = randomNum.toSet().toList(); 
    }
    while (true){
        int cow = 0; 
        int bull = 0; 
        print("Guess 4-digit number"); 
        String choice = stdin.readLineSync()!; 
        List<int> choiceNum = []; 
        choice.split('').forEach((element) => choiceNum.add(int.parse(element)) ); 
        for (int i = 0; i<4; i++){
            if (choiceNum[i] == randomNum[i]) cow++; 
            else if (randomNum.contains(choiceNum[i])) bull++; 
        }
        if (cow == 4) break; 
        print("You have $cow cow(s) and $bull bull(s)"); 
    }
    print("Correct answer! Congratulation!");
}