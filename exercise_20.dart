import 'dart:io';

List<List<int>> game = []; 
int countMove = 0; 

void drawLine(int w){
    for (int i = 0; i<w; i++)stdout.write(" ---"); 
    print(""); 
}
void drawSeperate(int width, List<List<int>> game, int index){
    for (int i = 0; i<width; i++) stdout.write("| ${game[index][i]==1? 'X' : (game[index][i] == 2 ? 'O' : " ")} ");   
    print("|");
}

void drawBoard(List<List<int>>game){
    int size = game.length; 
    for (int i = 0; i<size; i++)
    {
        drawLine(size); 
        drawSeperate(size, game, i); 
    }
    drawLine(size);    
}

bool makeMove(int x, int y, int player){
    print(game[x][y]);
    if (game[x][y] == 0){   
        game[x][y] = player; 
        drawBoard(game); 
        countMove++; 
        return true; 
    }
		
	else {
        print("This coordinate has been filled. Can't draw!"); 
        drawBoard(game); 
        return false; 
    }
	
}

List<int> getMove(int player){
    int size = game.length; 
    List<int> xy = []; 
    print("Player $player - ${player==1? 'X' : 'O'} move... Please enter coordinate of your move: "); 
    stdout.write("X = "); 
    int x = int.parse(stdin.readLineSync()!); 
    print(""); 

    while(x>size || x<0){
        stdout.write("Invalid! Try again. X = "); 
        x = int.parse(stdin.readLineSync()!); 
        print(""); 
    }

    stdout.write("Y = "); 
    int y = int.parse(stdin.readLineSync()!); 
    print("");
    
    while(y>size || y<0){
        stdout.write("Invalid! Try again. Y = "); 
        y = int.parse(stdin.readLineSync()!); 
        print(""); 
    }
    xy.addAll([x,y]);
    return xy;  
}

int checkCol(int col, int size){
    bool check = true; 
    if (game[0][col] !=0){
        for (int i = 1; i<size; i++)
            if (game[i][col] != game[0][col])
            {
                check = false; 
                break; 
            }
    }   
    else check = false; 
    if (check == false) return -1; 
    return game[0][col]; 
}

int checkRow(int row, int size){
    bool check = true; 
    if (game[row][0] !=0){
        for (int i = 1; i<size; i++)
        if (game[row][i] != game[row][0])
            {
                check = false; 
                break; 
            }
    }
    else check = false;
    if (check == false) return -1; 
    return game[row][0]; 
}

int checkCross(int size){
    bool checkCross1 = true; 
    bool checkCross2 = true; 
    for (int i = 1; i<size; i++)
        if (game[i][i] != game[0][0])
        {
            checkCross1 = false; 
            break;  
        }
    for (int i = 0; i<size; i++){
        if (game[size - i - 1][0] != game[size - 1][0])
        {
            checkCross2 = false; 
            break; 
        }
    }
    if (checkCross1 == true && game[0][0] !=0) return game[0][0]; 
    if (checkCross2 == true && game[0][size - 1]!= 0) return game[0][size-1]; 
    return -1; 
}

int checkBoard(int size){
    for (int i = 0; i<size; i++)
    {
        // print("row $i checked"); 
        if (checkRow(i, size) != -1) return checkRow(i, size); 
        // print("col $i checked"); 
        if (checkCol(i, size) != -1) return checkCol(i, size); 
    }
    // print("cross checked");
    if (checkCross(size) != -1) return checkCross(size); 
    return -1; 
}

void main(List<String> args) {
    ///get the size of gameboard
    print("Input size of gameboard you want to draw. We will create a square board for you"); 
    stdout.write("Size: ");  
    final size = int.parse(stdin.readLineSync()!); print(""); 
    print("Creating a $size x $size game board for you"); 

    ///create a gameboard
    game = List.generate(size, (_) => List.generate(size, (_) => 0)); 
    drawBoard(game); 

    ///begin to play
    print("Ready... Let's play"); 
    
    bool res = false; 
    while (countMove < size*size){
        ///get move of player 1 
        List<int> coordinate = getMove(1); 
        ///make that move, if invalid, get move again 
        while (makeMove(coordinate[0], coordinate[1], 1) == false)
            getMove(1); 
        
        ///check if anyone wins 
        int temp = checkBoard(size); 
        if (temp != -1){
            print("Congratulations. Players $temp won!!!"); 
            res = true; 
            break; 
        } 

        ///get move of player 2
        coordinate = getMove(2); 
        while (makeMove(coordinate[0], coordinate[1], 2) == false)
            getMove(2); 
        
        ///check if anyone wins 
        temp = checkBoard(size); 
        if (temp != -1){
            print("Congratulations. Players $temp won!!!"); 
            res = true; 
            break; 
        } 
    }

    if (res == false) print("Out of moves. No one win!"); 
    
}