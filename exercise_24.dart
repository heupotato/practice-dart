import 'dart:io';

List<String> guessedLetters = []; 
List<String> clueLetters = []; 
List<int> cluePos = []; 

String guessLetter(){
	print("Guess a letter"); 
	String guess = stdin.readLineSync()!.toLowerCase(); 
	while (guessedLetters.contains(guess) || guess.length !=1){
		if ( guess.length !=1) print("Invalid guess. Please try again"); 
		else print("You've guessed this letter. Please try other letters"); 
		guess = stdin.readLineSync()!.toLowerCase(); 
	}
	return guess; 	
}
void printFoundLetters(){
	for (int i = 0; i<cluePos.length; i++)
		stdout.write(cluePos[i] == 1 ? clueLetters[i].toUpperCase() + " " : "_ " ); 
	stdout.write("\n"); 
}
void main(List<String> args) {
	String clueWord = "EVAPORATE"; 
	print("The word you have to find has ${clueWord.length} letters"); 
	clueLetters = List.unmodifiable(clueWord.toLowerCase().split("")); 
	cluePos = List.generate(clueLetters.length, (_) => 0); 
	printFoundLetters(); 
	int res = 0; 
	String guess = ""; 
	while (res < clueLetters.length){
		guess = guessLetter(); 
		guessedLetters.add(guess); 
		int count = 0; 
		for (int i = 0; i<clueLetters.length; i++)
			if (clueLetters[i] == guess) {
				res++; 
				count++; 
				cluePos[i] = 1; 
			}
		print("There are $count letter(s) $guess in this word"); 
		printFoundLetters(); 
	}
	print("Congratulations! You found the clue word: $clueWord"); 
}