namespace :twilio do
  task :send => :environment do
    from = '+14507002052' # Your Twilio number
    to = '+15145850083' # Your mobile phone number

    TwilioClient.messages.create(
    from: from,
    to: to,
    body: "Your order is ready in 2 min!"
    )
  end
end
