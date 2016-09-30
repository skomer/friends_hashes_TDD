require 'pry-byebug'
require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( '../friends' )

class TestFriends < MiniTest::Test

  def setup

    @person1 = {
      name: "Rick",
      age: 12,
      monies: 1,
      friends: ["Jay","Keith","Marc", "Val"],
      favourites: {
        tv_show: "Friends",
        things_to_eat: ["charcuterie"]
      } 
    }
    
    @person2 = {
      name: "Jay",
      age: 15,
      monies: 2,
      friends: ["Keith"],
      favourites: {
        tv_show: "Scrubs",
        things_to_eat: ["soup","bread"]
      } 
    }

    @person3 = {
      name: "Val",
      age: 18,
      monies: 20,
      friends: ["Rick", "Jay"],
      favourites: {
        tv_show: "Pokemon",
        things_to_eat: ["ratatouille", "stew"]
      } 
    }

    @person4 = {
      name: "Keith",
      age: 18,
      monies: 20,
      friends: ["Rick", "Jay", "Marc"],
      favourites: {
        tv_show: "Pokemon",
        things_to_eat: ["spaghetti"]
      } 
    }

    @person5 = {
      name: "Marc",
      age: 20,
      monies: 100,
      friends: [],
      favourites: {
        tv_show: "Scrubs",
        things_to_eat: ["spinach"]
      } 
    }

    @people = [@person1, @person2, @person3, @person4, @person5]

  end

  def test_name
    assert_equal("Marc",@person5[:name])
  end

  def test_tv_show
    tv_show_result = tv_show(@person3)
    assert_equal("Pokemon", tv_show_result)
  end

  def test_favourite_foods
    favourite_foods_result = favourite_foods(@person1, "charcuterie")
    assert_equal(true, favourite_foods_result)
  end

  # Amend test as per notes in friends.rb file
  def test_add_friend
    add_friend_result = add_friend(@person2, "Mick Jagger")
    assert_equal(true, add_friend_result.include?("Mick Jagger"))
  end

  # Mildly flawed test as per notes in friends.rb file
  def test_remove_friend
    remove_friend_result = remove_friend(@person1, "Keith")
    # binding.pry
    assert_equal(false, remove_friend_result.include?("Keith"))
  end  

  def test_total_money
    total_money_result = total_money(@people)
    assert_equal(143, total_money_result)
  end

  def test_loan
    loan_result = loan(@person5, @person1, 50)
    assert_equal(50, loan_result[0])
    assert_equal(51, loan_result[1])
  end

  def test_all_foods
    all_foods_result = all_foods(@people)
    assert_equal(["charcuterie","soup","bread","ratatouille","stew","spaghetti","spinach"], all_foods_result)
  end

  def test_no_friends
    no_friends_result = no_friends(@people)
    assert_equal(["Marc"], no_friends_result)
  end

  def test_same_tv_show
    same_tv_show_result = same_tv_show(@people)
    assert_equal({"Scrubs" => ["Jay", "Marc"],"Pokemon" => ["Val", "Keith"]}, same_tv_show_result)
  end

end
