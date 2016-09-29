require 'pry-byebug'


# 1. For a given person, return their favourite tv show

def tv_show(person)
  return person[:favourites][:tv_show]
end


# 2. For a given person, check if they like a particular food

def favourite_foods(person, food)
  return person[:favourites][:things_to_eat].include?(food)
end


# 3. Allow a new friend to be added to a given person

def add_friend(person, friend)
  return person[:friends].push(friend)
end


# 4. Allow a friend to be removed from a given person

def remove_friend(person, friend)
  # binding.pry
  person[:friends].delete(friend)
  return person[:friends]
end


# 5. Find the total of everyone's money

def total_money(people)
  total = 0
  for person in people
    total += person[:monies]
  end
  return total
end


# 6. For two given people, allow the first person to loan a given value of money to the other

def loan(lender, lendee, amount)
  lendee_balance = lendee[:monies] + amount
  lender_balance = lender[:monies] - amount
  return [lender_balance, lendee_balance]
end


# 7. Find the set of everyone's favourite food joined together

def all_foods(people)
  all_foods = []
  for person in people
    all_foods.concat(person[:favourites][:things_to_eat])
  end
  return all_foods
end


# 8. Find people with no friends

def no_friends(people)
  no_friends = []
  for person in people
    if person[:friends] == []
      no_friends.push(person[:name])
    end
  end
  return no_friends
end


# INSANE
# Find the people who have the same favourite tv show

def same_tv_show(people)
  people_and_their_shows = {}
  for person in people
    people_and_their_shows[person[:name]] = person[:favourites][:tv_show]
  end
  binding.pry
  

end


# { "Rick" => "Friends", "Jay" => "Scrubs", "bla" => "Friends" }












