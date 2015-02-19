require 'clockwork'
require 'clockwork/database_events'
require_relative '../config/boot'
require_relative '../config/environment'

module Clockwork
  every(40.seconds, 'queueing tweet refresh and alert scanning') { TweetsWorker.perform_async }
end
