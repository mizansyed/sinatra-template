Basic structure for Sinatra project. Based on [oren's sinatra-template](https://github.com/oren/sinatra-template.git).

What's inside?
--------------

* Modular Sinatra app version 1.3.2 using ruby 1.9.3-p125
* minitest for unit-level tests
* rack-test for routes tests
* capybara + minitest for integration tests (no need for rspec)
* yard for documentation
* Rakefile, Gemfile, .rvmrc, .gitignore
* Basic custom request logging

Folders Structure
------------------

    settings.rb     # application wide settings

    app/
      views/		# erb views
      models/		# models
	  controllers/	# controllers (routes)

    lib/
      helpers/		# custom controller/view helpers
      sinatra/
        /logger/	# basic request logger

    test/         
      models      	# minitest
      routes      	# rack-test
      acceptance 	# capybara + minitest

Setup
-----

Install Ruby 1.9.3 (if necessary). RVM is optional, but highly recommended

    rvm install ruby-1.9.3-p125
    git clone https://github.com/znupy/sinatra-template.git
    cd sinatra-template (it will create sinatra-template gemset)

[Install QT](https://github.com/thoughtbot/capybara-webkit/wiki/Installing-Qt-and-compiling-capybara-webkit) (needed for capybara-webkit)

Install bundler

    gem install bundler

Install the gems

    bundle install --without production staging

View all available rake commands

    rake -T

    rake                  # Run all tests
    rake test:acceptance  # Run acceptance tests
    rake test:models      # Run models tests
    rake test:routes      # Run routes tests
    rake yard             # Generate YARD Documentation

Run the server

    shotgun

Go to [http://127.0.0.1:9393](http://127.0.0.1:9393)


