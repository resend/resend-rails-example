This is an example rails app on how to configure and use the [Resend Rails SDK](https://github.com/drish/resend-ruby) with Rails Action Mailer

# Setup

Add the gem to your Gemfile:

```ruby
# Gemfile
gem "resend"
```

Create your mailer class

```ruby
# /app/mailers/user_mailer.rb
class UserMailer < ApplicationMailer
  default from: 'you@domain.io' # this domain must be verified with Resend
  def welcome_email
    @user = params[:user]
    attachments["invoice.pdf"] = File.read(Rails.root.join("resources","invoice.pdf"))
    @url  = "http://example.com/login"
    mail(
      to: ["to@email.com"],
      cc: ["cc@email.com"],
      bcc: ["cc@email.com"],
      reply_to: "to@email.com",
      subject: "Hello from Rails",
    )
  end
end
```

Create your `ERB Template` for `UserMailer`

```ruby
# /app/views/welcome_email.html.erb
<!DOCTYPE html>
<html>
  <head>
    <meta content='text/html; charset=UTF-8' http-equiv='Content-Type' />
  </head>
  <body>
    <h1>Welcome to example.com, <%= @user.name %></h1>
    <p>
      You have successfully signed up to example.com,
    </p>
    <p>
      To login to the site, just follow this link: <%= @url %>.
    </p>
    <p>Thanks for joining and have a great day!</p>
  </body>
</html>
```

Now you can send your emails, lets send it using Rails console.

```sh
bundle exec rails c
```

Initialize your `UserMailer` class, this should return a `UserMailer` instance.

```ruby
u = User.new name: "derich"
mailer = UserMailer.with(user: u).welcome_email
# => #<Mail::Message:153700, Multipart: false, Headers: <From: you@domain.io>, <To: email@example.com, email2@example.com>, <Subject: Hello World>, <Mime-Version: 1.0>...
```

You can now send emails with:

```ruby
mailer.deliver_now!
# => {:id=>"a193c81e-9ac5-4708-a569-5caf14220539", :from=>....}
```