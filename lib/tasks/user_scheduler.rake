namespace :user_scheduler do
  desc "This task create for each user a new diary every day"
  task :create_diary_each_d => :environment do
    User.all.each do |user|
      user.create_diary
    end
  end
end
