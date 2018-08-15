# Write your code here.
def dictionary
  {
    "hello" => 'hi',
    "to" => '2',
    "two" => '2',
    "too" => '2',
    "for" => '4',
    "four" => '4',
    "be" => 'b',
    "you" => 'u',
    "at" => "@",
    "and" => "&"
  }
end

def word_substituter(tweet)
  tweet_arr = tweet.split
  fresh_arr = []
  tweet_arr.each do |word|
    if dictionary.keys.include?(word.downcase)
      fresh_arr << dictionary[word.downcase]
    else
      fresh_arr << word
    end
  end
  fresh_arr.join(" ")
end

def bulk_tweet_shortener(tweets)
  tweets.each do |msg|
    puts word_substituter(msg)
  end
end

def selective_tweet_shortener(tweet)
  if tweet.length > 140
    word_substituter(tweet)
  else
    tweet
  end
end

def shortened_tweet_truncator(tweet)
  if word_substituter(tweet).length > 140
    word_substituter(tweet)[0..136] + ("...")
  else
    word_substituter(tweet)
  end
end
