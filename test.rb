require 'sinatra'
require 'twilio-ruby'

account_sid = "TWILIO_ACCOUNT_SID"
auth_token = "TWILIO_AUTH_TOKEN"
client = Twilio::REST::Client.new account_sid, auth_token
 
from = "TWILIO_NUMBER" # Your Twilio number
 
friends = {
"+16464250769" => "John",
"+19177334309" => "Angry-Jon"
}
friends.each do |key, value|
  client.account.messages.create(
    :from => from,
    :to => key,
    :body => "Hey #{value}, thanks for joining Aframe! You are now in the loop!"
  )
  puts "Sent message to #{value}"
end