require 'rails_safe_tasks/railtie'

module RailsSafeTasks
  class << self

    #
    # An array of built-in task names which should be protected.
    #
    def dangerous_tasks
      @dangerous_tasks ||= [
        'db:drop',
        'db:reset',
        'db:schema:load',
        'db:migrate:reset'
      ]
    end

    #
    # An array of RAILS_ENV values which should not permit dangerous tasks
    # to be executed.
    #
    def restricted_environments
      @restricted_environments ||= ['production']
    end

    #
    # Add a custom check which will be executed whenever we check to see if the
    # current environment should allow dangerous tasks or not.
    #
    def custom_check(&block)
      @custom_checks ||= []
      @custom_checks << block
    end

    #
    # Should the current environment be protected from running dangerous tasks?
    #
    def restrict?
      # Check the list of restricted environments
      restricted_environments.include?(Rails.env.to_s) ||

      # Check that it's not deployed with Capistrano
      File.exist?(Rails.root.join('REVISION')) ||

      # Check the custom checker
      (@custom_checks && @custom_checks.any? { |c| c.call == true }) ||

      # Nothing else matched, it's OK
      false
    end

  end
end
