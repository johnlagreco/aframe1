class Regular < ActiveRecord::Base
  belongs_to :user

  def send_message(msg, image_url)
  	@twilio_number = ENV['15518883154']
  	@client = Twilio::REST::Client.new ENV['AC812cf9bcd3453587b2a3d4d16a7b237c'], ENV['3a7ce6823697691ad8fa9ee7eb5960d7']
  	message = @client.account.message.create(
  		:from => @twilio_number,
  		:to => self.phone_number,
  		:body => msg,
  		:media_url => image_url
  	)
  	puts message.to
  end
end
