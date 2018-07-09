require 'pry'

def word_substituter string
  processed_tweet = dictionary (string)

  processed_tweet
end

def bulk_tweet_shortener strings
  # bulk_tweet_shortened = tweets.collect { |tweet| word_substituter (tweet) }
  strings.each do |string|
    puts word_substituter(string)
  end
end

def selective_tweet_shortener string
  tweet = string

  if string && tweet.length > 140
    tweet = word_substituter(tweet)
  end

  tweet
end

def shortened_tweet_truncator string
  truncated_tweet = string
  if string.length > 140
    truncated_tweet = string[0..136] + "..."
  end

  truncated_tweet
end

def dictionary string
  stop = false
  # could use regex (.gsub method)
  dictionary = {
    ["hello"] => 'hi',
    ["to", "two", "too"] => '2',
    ["for", "four"] => '4',
    ["be"] => 'b',
    ["you"] => 'u',
    ["at"] => "@",
    ["and"] => "&"
  }

short_tweet = string
# if short_tweet.include? "GUISEEEEE"
#   stop = true
# end

dictionary.each do |keys, value|
  keys.each do |key|
  if string.match (/\b#{key}\b/i)

    recursive_ptn = short_tweet
    array_whole = []
    string.scan(/\b#{key}\b/i).each do |x|
# if key == "and"
#   binding.pry
# end

# if key == "at" && stop == true; binding.pry end
      recursive_ptn = recursive_ptn.partition(/\b#{x}\b/)
      recursive_ptn[1] = dictionary.select { |k, v| k.include? key }.values[0]
      if !array_whole.empty?; array_whole = array_whole[0...-1] + recursive_ptn
      else array_whole = recursive_ptn end

# if key == "at" && stop == true; binding.pry end
      recursive_ptn = recursive_ptn[2] # continue with remainder of string
    end
    short_tweet = array_whole.join('')
# if stop; binding.pry end
    # binding.pry
  end
  end
end

if stop; binding.pry end

short_tweet
end
