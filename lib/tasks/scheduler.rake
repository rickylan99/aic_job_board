desc "This task is called by the Heroku scheduler add-on"
task :update_expired_jobs => :environment do
  puts "Updating expired jobs..."
  
  jobs = Job.all

  jobs.each do |job|

    if DateTime.now.to_date > job.deadline
      job.expired = true
      job.save
    end

  end 
  puts "done."
end