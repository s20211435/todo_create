//= require rails-ujs
//= require turbolinks
//= require_tree .
//= require jquery

// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
// filepath: /workspaces/todo_create/app/javascript/application.js
import "@hotwired/turbo-rails"
import "controllers"
import "@rails/ujs"

import Rails from "@rails/ujs"
Rails.start()

