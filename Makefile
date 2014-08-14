ci: rspec rubocop

rspec:
	bundle exec rspec

rubocop:
	bundle exec rubocop -D lib spec
