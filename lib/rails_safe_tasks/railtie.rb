module RailsSafeTasks
  class Railtie < ::Rails::Railtie

    rake_tasks do
      load File.expand_path(File.join('..', '..', 'tasks', 'rails_safe_tasks.rake'), __FILE__)
    end

  end
end
