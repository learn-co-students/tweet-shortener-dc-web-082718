require 'pry'

def dictionary
  {"hello" => 'hi',
  "to" => '2',
  "two" => '2',
  "too" => '2',
  'for' => '4',
  "four" => '4',
  'be' => 'b',
  'you' => 'u',
  "at" => "@",
  "and" => "&"
}
end

def word_substituter (tweet)
  tweet = tweet.split(" ")
  dictionaryKeys = dictionary.keys

  shorterTweet = []

  tweet.each do |word|
    if dictionaryKeys.include?(word.downcase)
      shorterTweet.push(dictionary[word.downcase])
    else
      shorterTweet.push(word)
    end
  end
  shorterTweet = shorterTweet.join(" ")
end

def bulk_tweet_shortener (arrayOfTweets)
  arrayOfTweets.each do |tweet|
    puts word_substituter(tweet)
  end
end

def selective_tweet_shortener (tweet)

  if tweet.length > 140
    word_substituter(tweet)
  else
    tweet
  end
end

def shortened_tweet_truncator (tweet)
  tweet = selective_tweet_shortener(tweet)

  if tweet.length > 140
    "#{tweet[0..136]}..."
  else
    tweet
  end
end
