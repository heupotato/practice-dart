import 'dart:io';

void printList(List<List<int>> game){
	game.forEach((row) {
		row.forEach((element) => stdout.write(element.toString() + " ")); 
		print(""); 
		}
	); 
}
void draw(int x, int y, List<List<int>> game){
	if (game[x][y] == 0)
		game[x][y] = 1; 
	else print("This coordinate has been filled. Can't draw!"); 
	printList(game); 
}
void main(List<String> args) {
	List<List<int>> game = List.generate(3, (_) => List.generate(3, (_) => 0)); 
	printList(game);
	while (true){
		stdout.write("Enter the coordinate. X = "); 
		int x = int.parse(stdin.readLineSync()!); 
		print(""); 

		while(x>2 || x<0){
			stdout.write("Invalid! Try again. X = "); 
			x = int.parse(stdin.readLineSync()!); 
			print(""); 
		}

		stdout.write("Y = "); 
		int y = int.parse(stdin.readLineSync()!); 
		print("");
		
		while(y>2 || y<0){
			stdout.write("Invalid! Try again. Y = "); 
			y = int.parse(stdin.readLineSync()!); 
			print(""); 
		}

		draw(x, y, game); 
	}
}