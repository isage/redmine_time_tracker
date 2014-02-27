namespace :redmine do
  namespace :timetracker do

desc <<-END_DESC
Stop trackers running for more than "hours", optionally notify specified user.

Example:
  rake redmine:timetracker:check_trackers RAILS_ENV="production"
END_DESC


    task :check_trackers => :environment do
      options = {}
      abort "Please specify max hours." if ENV['hours'].blank?
      options[:hours] = ENV['hours'].to_i if ENV['hours']
      options[:delete] = ENV['delete'].to_i || 0
      options[:notify] = (ENV['notify'] || '').split(',').each(&:strip!)

      @trackers = TimeTracker.find(:all)
      @notify_trackers = []
      for @tracker in @trackers
        if !@tracker.nil?
          if @tracker.hours_spent > options[:hours]
             @notify_trackers.push(@tracker)
             if (options[:delete]==1)
               # send "deleted" mail
               Mailer.tracker_deleted(@tracker).deliver
             else
               # send "notify" mail
               Mailer.tracker_expired(@tracker).deliver
             end
          end
        end
      end
      if !options[:notify].empty? and !@notify_trackers.empty?
        if options[:delete] == 1
          Mailer.trackers_deleted(options,@notify_trackers).deliver
        else
          Mailer.trackers_expired(options,@notify_trackers).deliver
        end
      end
#      puts @notify_trackers
      if options[:delete] == 1
        for @tracker in @notify_trackers
          # delete tracker
          @tracker.destroy
        end
      end
    end

  end
end

