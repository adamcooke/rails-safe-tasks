# Rails Safe Tasks

This gem provides an extra layer of safety between you and deleting all
your production data by accident.

It restricts the use of various rake tasks (including db:drop, db:reset etc...)
when you are running your application in a production environment.

![Screenshot](https://s.adamcooke.io/15/vPpaN1.png)

## Installation

To install, just add to your Gemfile and run `bundle`.

```ruby
gem 'rails_safe_tasks', '~> 1.0'
```

## Usage

You don't need to do anything to get started but you can add some extra configuration
if you wish.

```ruby
# Add another task to the list of dangerous tasks
RailsSafeTasks.dangerous_tasks << 'another:task'

# Specify a custom rule for checking whether or not the current environment
# should be protected or not. Return true if the current environment should
# be protected. In this example, the presence of the 'VDT_APP' environment
# variable means we should be in a cautious state.
RailsSafeTasks.custom_check do
  !!ENV['VDT_APP']
end

# Protect a task which is not already initialized when the Gem is included.
namespace :my_app do
  task :wipe_everything do
    # Here be dragons...
  end
end

Rake::Task['my_app:wipe_everything'].enhance ['rails_safe_tasks:disable']
```
