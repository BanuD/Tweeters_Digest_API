require 'clockwork'
require 'clockwork/database_events'
require_relative '../config/boot'
require_relative '../config/environment'

module Clockwork
  every(20.seconds, 'wtf') { TweetsWorker.perform_async }
end
