# Exercise 2: 
# Model a Twitter class:
# 1. The twitter class will hold all the tweets, with an instance variable @tweets
# 2. Add `tweets_count` method to get the number of tweets
# 3. A method `tweet` append the new tweet to the twitter instance
# Model a Tweet class:
# 1. The class should have the attributes: id, content, username
#   1.1 The content is a string
#   1.2 The user is a string with the user name
#   1.3 The id is a number, which has to be unique 
# 2. The following methods should be included in the class:
#   2.1 like - it should increment the likes for the tweet
#   2.2 retweet - it should add the ability to add text, but will have the tweet appended. HINT: Use a block.

class Tweet
    @@id = 0

    def initialize(username, content)
        @username = username
        @content = content
        @id = self.id
        @likes = 0
    end

    def id
        @@id += 1
    end

    def like
        @likes += 1
    end

    def retweet(username, retweet_content)
        new_content = "#{retweet_content}\n '#{@content}'"

        self.class.new(username, new_content)
    end
end

class Twitter
    attr_reader :tweets

    def initialize
        @tweets = []
    end

    def tweets_count
        @tweets.length        
    end

    def tweet(username, content)
        new_tweet = Tweet.new(username, content)

        @tweets << new_tweet

        new_tweet
    end
end

twitter = Twitter.new

t1 = twitter.tweet("memo", "test")
t1.like
t1.like

twitter.tweet("fer", "test")
twitter.tweet("tono", "test")
t2 = twitter.tweet("ricardo", "test")

retuit = t2.retweet("kuri", "cuanta creatividad")

puts retuit.inspect
puts twitter.tweets.inspect
