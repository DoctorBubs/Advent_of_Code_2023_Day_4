local text = io.input("input.txt")

local input = io.read("*all")

local total_score = 0


local all_cards = {}

local card_counter = 0
for card in string.gmatch(input,"Card%C+") do
  
  
  card_counter = card_counter + 1
  local result = { text = card,lower_range = card_counter + 1}
  
  local winning_nums = {}
  for winning_side in string.gmatch(card,":%C+|") do
    
    for num in string.gmatch(winning_side,"%d+") do
      winning_nums[num] = true
    end
  end
  
  local match_counter = 0
  for draw_side in string.gmatch(card,"|%C+") do
    
    for num in string.gmatch(draw_side,"%d+") do
      if winning_nums[num] then
        match_counter = match_counter + 1
      end
    end
  end
  
  if match_counter > 0 then
    
    result.upper_range = result.lower_range + match_counter - 1
  end
  
  
  table.insert(all_cards,result)
end
 
  


local hand = {}

for _,c in ipairs(all_cards) do
  table.insert(hand,c)
end

local i_counter = 1

while hand[i_counter] do
  local card = hand[i_counter]
  if card.upper_range then
    for i = card.lower_range,card.upper_range do
      local next_card = all_cards[i]
      table.insert(hand,next_card)
    end
  end
  i_counter = i_counter + 1
end


print(#hand)
