require 'twilio-ruby'

class TwilioApi
  def self.send_text(to_telephone_number, message_to_send)
    account_sid = ENV['TWILIO_SID']
    auth_token = ENV['TWILIO_TOKEN']
    from_telephone_number = ENV['TWILIO_NUMBER']
    @client_twilio = Twilio::REST::Client.new account_sid, auth_token

    message = @client_twilio.account.messages.create(
        :body => "#{message_to_send}",
        :to => "#{to_telephone_number}",
        :from => "#{from_telephone_number}"
        # :media_url => "#{media_url}"
    )
  end
end
