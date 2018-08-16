def dictionary
  {"hello" => "hi",
  "to" => "2",
  "two" => "2",
  "too" => "2",
  "for" => "4",
  "For" => "4",
  "four" => "4",
  "be" => "b",
  "you" => "u",
  "at" => "@",
  "and" => "&"
  }
end

def word_substituter(tweet)
  array = tweet.split
  dictionary.each do |key, value|  
    array.collect do |element|
      if (element == key) 
        element.replace(value)
      else 
        element 
      end
    end
  end
  new_tweet = array.join(" ")
  new_tweet
end

def bulk_tweet_shortener(array_of_tweets)
  array_of_tweets.each do |element|
    puts word_substituter(element)
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
  short_tweet = selective_tweet_shortener(tweet)
  if short_tweet.length > 140
    short_tweet[0..136] + "..."
  else 
    short_tweet
  end
end