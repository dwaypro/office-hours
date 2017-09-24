require 'twilio-ruby'


class User < ApplicationRecord

  devise :database_authenticatable, :registerable
         #:recoverable, :rememberable, :trackable, :validatable
  has_many :subscriptions
  has_many :projects
  has_many :updates, { through: :projects }


def text_user(tel,message)
  begin
    @client = Twilio::REST::Client.new ENV["ACCOUNT_SID"], ENV["AUTH_TOKEN"]
    message = @client.messages.create(
      body: "#{message}",
      to: "+1#{tel}",
      from: "+15416047255"
      )
  rescue Twilio::REST::TwilioError => e
      puts e.message
    end
  end
end
