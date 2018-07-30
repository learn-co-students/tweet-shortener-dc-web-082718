# Write your code here.
require 'pry'

def dictionary(word)
  substitutes = {
    "hello" => "hi",
    "to" => "2",
    "two" => "2",
    "too" => "2",
    "for" => "4",
    "four" => "4",
    "be" => "b",
    "you" => "u",
    "at" => "@",
    "and" => "&",
  }
  substitutes.keys.each do |key|
    if key == word.downcase
      return substitutes[key]
    end
  end
  word
end

# Method for finding all of the long dictionary keys in tweets and replacing those found words with their coresponding dictionary values
def word_substituter(tweet)
  tweet_array = tweet.split(" ")
  tweet_array.collect! do |word|
    dictionary(word)
  end
  tweet_array.join(" ")
end

# Method for iterating through an array of tweets and printing each after substituting words
def bulk_tweet_shortener(tweet_storm)
  tweet_storm.each do |twit|
    puts word_substituter(twit)
  end
end

# Shorten tweets that are more than 140 characters, else return the tweet
def selective_tweet_shortener(tweet)
  if tweet.length > 140
    word_substituter(tweet)
  else
    return tweet
  end
end

# Truncate tweets over 140 characters with an ellipses (...) after shortening them
def shortened_tweet_truncator(tweet)
  twit = selective_tweet_shortener(tweet)
  puts twit
  if twit.size > 140
    twit = twit[0..136] << "..."
    return twit
  else
    return tweet
  end
end

testy = "GUISEEEEE this is so fun! I'm tweeting for you guys and this tweet is SOOOO long it's gonna be way more than you would think twitter can handle, so shorten it up you know what I mean? I just can never tell how long to keep typing!"
shortened_tweet_truncator(testy)
