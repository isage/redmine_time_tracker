require 'mailer'

module TimeTrackerMailer
  module InstanceMethods
    def tracker_deleted(tracker)
        @tracker = tracker
        @issue = Issue.find(:first, :conditions => { :id => tracker.issue_id })
        @hours = tracker.hours_spent

        mail :to => User.find(:first, :conditions => { :id => tracker.user_id }).mail,
             :subject => "[#{l(:time_tracker_mail_deleted_subject,:issue_id=>tracker.issue_id)}]"
    end

    def tracker_expired(tracker)
        @tracker = tracker
        @issue = Issue.find(:first, :conditions => { :id => tracker.issue_id })
        @hours = tracker.hours_spent

        mail :to => User.find(:first, :conditions => { :id => tracker.user_id }).mail,
             :subject => "Redmine Time Tracker: Превышен лимит учтенного времени по счетчикам"
    end

    def trackers_expired(options,trackers)
        @trackers = trackers

        mail :to => options[:notify],
             :subject => "Redmine Time Tracker: Превышен лимит учтенного времени по счетчикам"
    end

    def trackers_deleted(options,trackers)
        @trackers = trackers

        mail :to => options[:notify],
             :subject => "Redmine Time Tracker: Превышен лимит учтенного времени по счетчикам"
    end

  end

  def self.included(receiver)
    receiver.send(:include, InstanceMethods)
  end
end

unless Mailer.included_modules.include? TimeTrackerMailer
    Mailer.send(:include, TimeTrackerMailer)
end
