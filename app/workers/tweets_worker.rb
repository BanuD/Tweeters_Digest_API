require_relative '../helpers/background_jobs_helper'

class TweetsWorker
  include Sidekiq::Worker

  def perform
    BackgroundJobsHelper.tweets_for_all_users
  end
end
