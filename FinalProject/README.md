This script will be a tiktaktoe game that can be played by two players at a time. This can be great for kids or adults that just want to past time.
The first part of this code is establishing the board to be able to hold the data:
```
board = ["-", "-", "-",
         "-", "-", "-",
         "-", "-", "-"]

game_still_going = True

winner = None

current_player = "X"
```
Next we will start the game, show the board, handle turns, and check if the game is over:
```
def play_game():

  display_board()

  while game_still_going:

    handle_turn(current_player)

    check_if_game_over()

    flip_player()

  if winner == "X" or winner == "O":
    print(winner + " won.")
  elif winner == None:
    print("Tie.")
```
Next we will display the board so that the users can play:
```
def display_board():
  print("\n")
  print(board[0] + " | " + board[1] + " | " + board[2] + "     1 | 2 | 3")
  print(board[3] + " | " + board[4] + " | " + board[5] + "     4 | 5 | 6")
  print(board[6] + " | " + board[7] + " | " + board[8] + "     7 | 8 | 9")
  print("\n")
```
As the game progresses the script will then start to check for wins. This code will check rows for a win:
```
def check_rows():
  global game_still_going
  row_1 = board[0] == board[1] == board[2] != "-"
  row_2 = board[3] == board[4] == board[5] != "-"
  row_3 = board[6] == board[7] == board[8] != "-"

  if row_1 or row_2 or row_3:
    game_still_going = False

  if row_1:
    return board[0] 
  elif row_2:
    return board[3] 
  elif row_3:
    return board[6] 
  else:
    return None
```
Next we will check columns for a win:
```
def check_columns():
  global game_still_going
  column_1 = board[0] == board[3] == board[6] != "-"
  column_2 = board[1] == board[4] == board[7] != "-"
  column_3 = board[2] == board[5] == board[8] != "-"
  
  if column_1 or column_2 or column_3:
    game_still_going = False
  
  if column_1:
    return board[0] 
  elif column_2:
    return board[1] 
  elif column_3:
    return board[2] 
  else:
    return None
```
Lastly we will check diagonal:
```
def check_diagonals():
  global game_still_going
  diagonal_1 = board[0] == board[4] == board[8] != "-"
  diagonal_2 = board[2] == board[4] == board[6] != "-"

  if diagonal_1 or diagonal_2:
    game_still_going = False

  if diagonal_1:
    return board[0] 
  elif diagonal_2:
    return board[2]
  else:
    return None
```
Occaisonally the script will check for a winner:
```def check_for_winner():
  global winner
  row_winner = check_rows()
  column_winner = check_columns()
  diagonal_winner = check_diagonals()
  
  if row_winner:
    winner = row_winner
  elif column_winner:
    winner = column_winner
  elif diagonal_winner:
    winner = diagonal_winner
  else:
    winner = None
```
It will also check for a tie:
```
def check_for_tie():
  global game_still_going
  if "-" not in board:
    game_still_going = False
    return True
  else:
    return False
```
By this time either a winner or a tie will be declared and the game can be played again.
