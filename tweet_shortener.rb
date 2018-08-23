def dictionary
    dictionary = {
        "hello" => "hi",
        "to" => "2",
        "two" => "2",
        "too" => "2",
        "for" => "4",
        "four" => "4",
        "you" => "u",
        "at" => "@",
        "and" => "&",
        "be" => "b"
    }
end
 def word_substituter(tweet)
    tweet_array = tweet.split.map do |word|
        if dictionary.keys.include?(word.downcase)
                word = dictionary[word.downcase]
        else
            word
        end
    end
    tweet_array.join(" ")
end
 #word_substituter("Hey guys, can anyone teach me how to be cool? I really want to be the best at everything, you know what I mean? Tweeting is super fun you guys!!!!")
 def bulk_tweet_shortener(tweet_array)
    tweet_array.each do |tweet|
        puts word_substituter(tweet)
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
    shortened = word_substituter(tweet)
    if shortened.length > 140
        shortened[0..134] + "(...)"
    else
        tweet
    end
end
