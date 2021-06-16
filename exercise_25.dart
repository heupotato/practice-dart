import 'dart:io';
import 'dart:math';

List<String> guessedLetters = []; 
List<String> clueLetters = []; 
List<int> cluePos = []; 

String pickRandomWord(String path){
    var inputFile = File(path);   
    final List<String> words = inputFile.readAsLinesSync(); 
    return(words[Random().nextInt(words.length)]); 
}

int checkStatusGame(int guessedLettersNum, int turns){
	if (guessedLettersNum == clueLetters.length) return 1; 
	if (turns < 1) return -1; 
	return 0; 
}

void prepareGame(String clueWord){
	print("The word you have to find has ${clueWord.length} letters"); 
	clueLetters = List.unmodifiable(clueWord.toLowerCase().split("")); 
	cluePos = List.generate(clueLetters.length, (_) => 0); 
	printFoundLetters(); 
}

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

void printResult(int result, String clueWord){
	if (result == 1) print("Congratulations! You found the clue word ${clueWord.toUpperCase()}"); 
	else print("You lost! The clue word is ${clueWord.toUpperCase()}"); 
}

void displayBody(int turns){
    String blank = "                               ||\n"; 
    String head = "  ---                          ||" + "\n" +
                  " |X X|                         ||" + "\n" +
                  " | o |                         ||" + "\n" +
                  "  ---                          ||" + "\n";
    String body = "   |                           ||\n"; 
    String leftHand = " --|"; 
    String rightHand = "--"; 
    String leftLeg = "/";
    String rightLeg = "\\"; 
    print("   ============================="); 
    print("   |                           ||");
    print("   |                           ||");
    stdout.write("${turns<6 ? head : blank *4}"); 
    stdout.write("${turns<5? body : blank}"); 
    print("${turns<4 ? leftHand : "    "}${turns<3? rightHand : "  "}                         ||");
    print("   ${turns<3? rightHand : " "}                           ||");
    print("  ${turns<2 ? leftLeg : " "} ${turns<1 ? rightLeg : " "}                          ||");
    print(" ${turns<2 ? leftLeg : " "}   ${turns<1 ? rightLeg : " "}                         ||");
    stdout.write(blank*2);
    print("   ============================="); 
}

void playGame(){
    print("Starting the game"); 
	print("Picking a random word"); 
	String clueWord = pickRandomWord("sowpods.txt").toLowerCase(); 
	prepareGame(clueWord); 
	print("Let's begin"); 
	int guessedLettersNum = 0; 
	int turns = 6; 
	int result = 0; 
	while (result == 0){
		print("You have $turns incorrect guess(es) left"); 
        displayBody(turns); 
		print("Let's guess a letter"); 
		String guess = guessLetter(); 
		guessedLetters.add(guess); 
		int count = 0; 
		for (int i = 0; i<clueLetters.length; i++)
			if (clueLetters[i] == guess) {
				count++; 
				cluePos[i] = 1; 
			}
		if (count > 0){
			guessedLettersNum += count; 
			print("There are $count letter(s) $guess in this word"); 
			result = checkStatusGame(guessedLettersNum, turns); 
		}
		else 
		{
			turns--; 
			print("There aren't any letter $guess in this word"); 
			result = checkStatusGame(guessedLettersNum, turns); 
		}
		printFoundLetters(); 
		print(""); 
	}
	printResult(result, clueWord); 
}

void main(List<String> args) {
    String option = ""; 
    while (option != "quit"){ 
        playGame();
        print("Type `quit` to exit game or type any key to continue"); 
    }
	print("Thanks for playing game"); 
}