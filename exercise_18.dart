List<List<int>> game =  [[0, 0, 0],
                        [2, 1, 0],
                        [2, 1, 1]]; 

bool checkCol(int col){
    if (game[0][col] !=0)
        return (game[0][col] == game[1][col] && game[1][col] == game[2][col]); 
    return false; 
}


bool checkRow(int row){
    if (game[row][0] !=0)
        return (game[row][0] == game[row][1] && game[row][1] == game[row][2]); 
    return false; 
}
bool checkCross(){
    return ((game[0][0] == game[1][1] && game[1][1] == game[2][2]) ||
            (game[0][2] == game[1][1] && game[1][1] == game[2][0])); 
}
void main(List<String> args) {
    for (int i = 0; i<3; i++){
        if (checkCol(i) == true) {
            print("Player ${game[0][i]} wins"); 
            return; 
        }
        if (checkRow(i) == true){
            print("Player ${game[i][0]} wins"); 
            return; 
        }
        if (checkCross() == true){
            print("Player ${game[1][1]} wins"); 
            return;
        }
    }
    print("No one wins");
}