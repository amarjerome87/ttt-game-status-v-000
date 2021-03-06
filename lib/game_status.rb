def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[2,4,6],[0,4,8]]

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|

if board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X" ||
  board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O"
    return win_combination
  end
end
end

def full?(board)
 final_tally = 0
 board.each do |token|
   if token == "X" || token == "O"
     final_tally += 1
   end
 end
  if final_tally == 9
    true
  else
    false
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    true
  else
    false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  else
    false
  end
end

def winner(board)
  combo = won?(board)
  if !combo
    return nil
  else
    return board[combo[2]]
  end

end
