# Write your code here.
def dictionary
diction_hash = {
"hello" => 'hi',
"to" => '2',
"two" => '2',
"too" => '2',
"for" => '4',
"For" => '4',
"four" => '4',
'be' => 'b',
'you' => 'u',
"at" => "@",
"and" => "&"
}
end

def word_substituter(string)
  words = Array.new
  words = string.split(" ")
  index = 0
  while index < words.length do
    key = words[index]
    if dictionary[key] != nil
      words[index] = dictionary[key]
    end
    index += 1
  end
  string_of_words = words.join(" ")
  string_of_words

end

def bulk_tweet_shortener(array_of_strings)
  index = 0
  while index < array_of_strings.length do
    puts word_substituter(array_of_strings[index])
    index += 1
  end
end

def selective_tweet_shortener(tweet)
  puts tweet.length
  short_tweet = tweet
  if tweet.length >= 140
    short_tweet = word_substituter(tweet)
  end
  if short_tweet.length > 140
      puts "super long"
      short_tweet = short_tweet[0..139]
  end
  puts short_tweet.length
  puts short_tweet
  short_tweet
end

def shortened_tweet_truncator(tweet)
  selective_tweet_shortener(tweet)
end
#tweet_three = "GUISEEEEE this is so fun! I'm tweeting for you guys and this tweet is SOOOO long it's gonna be way more than you would think twitter can handle, so shorten it up you know what I mean? I just can never tell how long to keep typing!"
#puts selective_tweet_shortener(tweet_three).length
#puts dictionary
##puts "Enter your word here: "
#word = gets.chomp
#puts "You entered #{word}"
#puts "The short message is: "
#word_substituter(word)
