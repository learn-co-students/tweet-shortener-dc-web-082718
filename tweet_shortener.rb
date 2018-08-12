def word_substituter(tweet_string)
  
  dictionary = {
    hello: 'hi',
    to: '2',
    two: '2',
    too: '2',
    for: '4', 
    four: '4',
    be: 'b',
    you: 'u',
    at: '@',
    :and => '&'
  }
  
  new_tweet_array = []
  
  # The method accepts a string, we must
  # first convert it to an array.
  
  tweet_array = tweet_string.split
  
  # Next, let's iterate over the array
  # of words and look for matches to our 
  # dictionary.
  
  tweet_array.each do |tweet_word|
    
    substituted = false
    
    dictionary.keys.each do |dic_key|
      
      # If the word in the tweet is equivalent to
      # a dictionary key, we set the tweet word
      # equal to the value on file
      
      if dic_key.to_s == tweet_word.downcase
        new_tweet_array << dictionary[dic_key]
        substituted = true
        break
      end
    end
    
    if substituted == false 
      new_tweet_array << tweet_word
    end
    
  end 
  new_tweet_array = new_tweet_array.join(" ")
  new_tweet_array
end 

# tweet_tester = ["GUISEEEEE this is so fun! I'm tweeting for you guys and this tweet is SOOOO long it's gonna be way more than you would think twitter can handle, so shorten it up you know what I mean? I just can never tell how long to keep typing!"]

def bulk_tweet_shortener(tweets)
  tweets.collect do |tweet|
    puts word_substituter(tweet)
  end 
end 

# bulk_tweet_shortener(tweet_tester)

def selective_tweet_shortener(tweet)
    if tweet.length <= 140
      return tweet
    else
      return word_substituter(tweet)
    end 
end 

def shortened_tweet_truncator(tweet)
  if tweet.length > 140
      tweet = word_substituter(tweet)
      if tweet.length > 140
        tweet = tweet[0...140]
      end  
  end 
  tweet
end