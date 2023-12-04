local text = io.input("input.txt")

local input = io.read("*all")

local total_score = 0
local counter = 0
for card in string.gmatch(input,"Card%C+") do
  
  counter = counter + 1
  local card_score = 0
  local match_nums = {}
  local winning_nums = {}
  
  for winning_side in string.gmatch(card,":%C+|") do
    --print(winning_side)
    for num in string.gmatch(winning_side,"%d+") do
      winning_nums[num] = true
    end
  end
  
  for draw_side in string.gmatch(card,"|%C+") do
    --print(draw_side)
    for num in string.gmatch(draw_side,"%d+") do
      if winning_nums[num] then
        table.insert(match_nums,num)
      end
    end
  end
  
  for i,_ in ipairs(match_nums) do
    if i == 1 then
      card_score = 1
    else
      card_score = card_score * 2
    end
  end
  
  print(string.format("Game %d's score is %d",counter,card_score))
  total_score = total_score + card_score
  
end

print(string.format("Final score is %d",total_score))