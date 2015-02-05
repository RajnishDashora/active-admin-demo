# active-admin-demo
Demo for active admin gem on rails 4

**Gem file
`gem 'devise'`
`gem 'activeadmin', github: 'activeadmin'`
`bundle install`

`rails generate active_admin:install`
`rake db:migrate`
`rails server`

http:localhost:3000/admin

Username:admin@example.com
password:password

Create a model using
 `rails g model [MyModelName]`

Create active admin model for this,
`rails generate active_admin:resource [MyModelName]`
**Reference
http://activeadmin.info/docs/documentation.html

https://github.com/activeadmin/activeadmin

http://stackoverflow.com/questions/16426398/active-admin-install-with-rails-4

http://stackoverflow.com/questions/19650121/rails-4-activeadmin-error-message-bundler-could-not-find-compatible-versions
