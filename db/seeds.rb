Collector.create(user_id: 1, leader_id: 1, query: "dogs, cats, ruby on rails")
Collector.create(user_id: 1, leader_id: 2, query: "dogs, cats")
Collector.create(user_id: 2, leader_id: 1, query: "ruby on rails")
Collector.create(user_id: 3, leader_id: 3, query: "pizza")
Collector.create(user_id: 3, leader_id: 2, query: "hamster")

Leader.create(name: "Rilke", nickname: "teamlead", image: "1", user_id: 1)
Leader.create(name: "Daniel", nickname: "serious", image: "2", user_id: 1)
Leader.create(name: "Aaron", nickname: "will change your life", image: "3", user_id: 2)
Leader.create(name: "Banu", nickname: "minority", image: "8", user_id: 3)
Leader.create(name: "Random Dude", nickname: "creep", image: "5", user_id: 3)

Tweet.create(content: "gdfr", collector_id: 1)
Tweet.create(content: "grd", collector_id: 1)
Tweet.create(content: "gr", collector_id: 2)
Tweet.create(content: "fsfs", collector_id: 2)
Tweet.create(content: "dg", collector_id: 3)
Tweet.create(content: "serfe", collector_id: 4)
Tweet.create(content: "wrew", collector_id: 5)
Tweet.create(content: "erw", collector_id: 5)

User.create(provider: "twitter", uid: "", encrypted_password: "",reset_password_token: "dfd", reset_password_sent_at: 20151001, remember_created_at: 20151001, sign_in_count: 0, current_sign_in_at: 20151001, last_sign_in_at: 20151001, current_sign_in_ip: "rtdr", last_sign_in_ip: "dfsf", confirmation_token: "dfdgdfgfd", confirmed_at: 20151001, confirmation_sent_at: 20151001, unconfirmed_email: "fdgd@sdfggdgd.com", name: "TD", nickname: "TD", image: "dfdsf", email: "ffdsfds@sdfdsgd.com", tokens: "sfgdgd")

__END__
# NEED TO MAKE IDs INTEGERS

# Should Work
-- User --
User.leaders
User.collectors
User.tweets

-- Leader --
Leader.collector +

-- Collector --
Collector.tweets
