# Gathering.create(user_id: 1, leader_id: 6, query: "more")
# Gathering.create(user_id: 1, leader_id: 2, query: "dogs, cats")
# Gathering.create(user_id: 2, leader_id: 1, query: "ruby on rails")
# Gathering.create(user_id: 3, leader_id: 3, query: "pizza")
# Gathering.create(user_id: 3, leader_id: 2, query: "hamster")

# Leader.create(twitter_object: '{name: "DevBootcamp", nickname: "DevBootcamp", image: "1"}', user_id: 1)
# Leader.create(twitter_object: '{name: "Daniel", nickname: "serious", image: "2"}', user_id: 1)
# Leader.create(twitter_object: {name: "Aaron", nickname: "will change your life", image: "3", user_id: 2})
# Leader.create(twitter_object: {name: "Banu", nickname: "minority", image: "8", user_id: 3})
# Leader.create(twitter_object: {name: "Random Dude", nickname: "creep", image: "5", user_id: 3})

# Tweet.create(content: "one", gathering_id: 1)
# Tweet.create(content: "two", gathering_id: 1)
# Tweet.create(content: "three", gathering_id: 2)
# Tweet.create(content: "four", gathering_id: 2)
# Tweet.create(content: "dg", gathering_id: 3)
# Tweet.create(content: "serfe", gathering_id: 4)
# Tweet.create(content: "wrew", gathering_id: 5)
# Tweet.create(content: "erw", gathering_id: 5)

# User.create(provider: "twitter", uid: "", encrypted_password: "",reset_password_token: "dfd", reset_password_sent_at: 20151001, remember_created_at: 20151001, sign_in_count: 0, current_sign_in_at: 20151001, last_sign_in_at: 20151001, current_sign_in_ip: "rtdr", last_sign_in_ip: "dfsf", confirmation_token: "dfdgdfgfd", confirmed_at: 20151001, confirmation_sent_at: 20151001, unconfirmed_email: "fdgd@sdfggdgd.com", name: "TD", nickname: "TD", image: "dfdsf", email: "ffdsfds@sdfdsgd.com", tokens: "sfgdgd")

# __END__
# # NEED TO MAKE IDs INTEGERS

# # Should Work
# -- User --
# User.leaders
# User.gatherings
# User.tweets

# -- Leader --
# Leader.gathering +

# -- Gathering --
# Gathering.tweets +
