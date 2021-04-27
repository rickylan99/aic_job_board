# frozen_string_literal: true

desc 'This task is called by the Heroku scheduler add-on'
task update_expired_jobs: :environment do
  puts 'Updating expired jobs...'

  jobs = Job.all

  jobs.each do |job|
    next unless (DateTime.now.to_date > job.deadline) && !job.expired

    job.expired = true
    job.save
    job&.expired_job
  end
  puts 'done.'
end
