# Write your code here.
def word_substituter(tweet)
  words = tweet.split(" ")#splits sentences into words
  short_tweet = []#array used to hold truncated words

  words.each do |word|#iterate through each word
    case word.downcase#convert to downcase to avoid errors on casing. Case statement used to compare and swap out shortened words for original words.
    when "hello"
      short_tweet << "hi"
    when "to", "two", "too"
      short_tweet << "2"
    when "for", "four"
      short_tweet << "4"
    when "be"
      short_tweet << "b"
    when "you"
      short_tweet << "u"
    when "at"
      short_tweet << "@"
    when "and"
      short_tweet << "&"
    else
      short_tweet << word
    end
  end
  short_tweet.join(" ")#join words back together in a sentence
end

def bulk_tweet_shortener(tweets)
  tweets.each do |tweet|#iterate through each word in tweet
    tweet = word_substituter(tweet)#runs each tweet through word_substituter method and stores in variable tweet
    puts "#{tweet}"
  end
end

def selective_tweet_shortener(tweet)
  if tweet.length > 140 #runs next line of code only if the length of the tweet is longer than 140 characters.
    word_substituter(tweet)#if over 140 characters each tweet is ran the #word_substituter
  else
    tweet
  end
end

def shortened_tweet_truncator(tweet)
  tweet = selective_tweet_shortener(tweet)
  if tweet.length > 140# if tweet length is still over 140 characters AFTER running the #selective_tweet_shortener, then run next line
    tweet[0..136] + "..." #shortens tweet to 137 characters and adds "..." to the last 3 spots.
  else
    tweet#if under 140 just return tweet as is.
  end
end
