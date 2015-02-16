namespace :rails_safe_tasks do
  task :disable do
    if RailsSafeTasks.restrict?
      if ENV['I_AM_SURE'] != "1"
        puts
        puts "\e[31m** You cannot run this task with the production environment"
        puts "** If you want to, set the 'I_AM_SURE' environment variable to 1\e[0m"
        puts "** This has been disabled using the 'rails_safe_tasks' gem."
        puts
        exit 1
      end
    end
  end
end

RailsSafeTasks.dangerous_tasks.each do |task|
  Rake::Task[task].enhance ['rails_safe_tasks:disable']
end
