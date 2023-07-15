namespace :db do
  desc "Verifica se o database existe"
  task :exists do
    begin
      Rake::Task['environment'].invoke
      ActiveRecord::Base.connection
    rescue
      exit 1
    else
      exit 0
    end
  end
end