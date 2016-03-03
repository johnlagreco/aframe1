class RegularsController < ApplicationController
  
  def incoming
	  	@phone = params[:From]
	  	
	  	@new_regular = Regular.exists?(:phone => @phone) === false
	  	@regular = Regular.first_or_create(:phone => @phone)
	  	
	  	@body = if params[:Body].nil? then '' else params[:Body].downcase end
	  	begin
	  		if @new_regular
	  			output = "Thanks for contacting Aframe! Text 'subscribe' if you would like to receive daily specials from your favorite server."
	  		else
	  			output = process_message(@body, @subscriber)
	  		end
	  	rescue
	  		output = "Didn't work. Please try again."
	  	end

	  	respond(output)
  end

  def new
  	message = params[:message]

  	Regular.all.each do |s|
  		begin
  			s.send_message(message)
  			flash[:notice] = "Text is being sent!"
  		rescue
  			flash[:notice] = "Didn't work!"
  		end
  	end
  	redirect_to '/'
  end

  def process_message(message, regular)
  	if message == 'subscribe' || message == 'unsubscribe'

  		subscribed = message === 'subscribe'
  		regular.update :subscribed => subscribed

  		output = "You are now in the know!"
  		if !regular.subscribed
  			output = "You are now out of the loop. Text 'subscribe' to get back in."
  		end
  	else
  		output = "Sorry, we didn't understand. The commands are 'subscribe' or 'unsubscribe'."
  	end
  	return output
  end

  def respond(message)
  	response = Twilio::TwiML::Response.new do |r|
  		r.Message message
  	end
  	render text: response.text
  end

  def show
  end

  def new
  end

  def edit
  end
end
