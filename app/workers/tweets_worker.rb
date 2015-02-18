class TweetsWorker
  include Sidekiq::Worker
  include BackgroundJobsHelper
  sidekiq_options queue: "high"

  def perform
    BackgroundJobsHelper::tweets_for_all_users
  end
end


while true
  sleep(20.min)
  TweetsWorker.perform_async
end
