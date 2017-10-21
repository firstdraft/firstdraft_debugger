# DevToolbar

This gem causes a toolbar to appear fixed to the right side of the viewport. It will

 - Display a link to pop open an in-browser [web-console](https://github.com/rails/web-console).
 - Display a link to `/rails/info` so you can check your routes.
 - Display a link to `/admin` if [ActiveAdmin](https://github.com/activeadmin/activeadmin) is installed.
 - Display a link to `/git` if [WebGit](https://github.com/firstdraft/web_git) is installed.

## Installation

Add this line to your application's Gemfile, `bundle install`, and restart your server:

```ruby
# Gemfile

group :development do
  gem 'dev_toolbar', git: 'https://github.com/firstdraft/dev_toolbar.git'
end
```

Add this line to your application controller:

```ruby
# app/controllers/application_controller.rb

after_action :console
```

Add this line to your application layout:

```html
<!-- app/views/layouts/application.html.erb -->

<%= dev_toolbar %>
```
