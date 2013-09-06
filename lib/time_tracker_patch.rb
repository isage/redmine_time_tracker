require 'mailer'

module TimeTrackerMailer
  module InstanceMethods
    def tracker_deleted(tracker)
      if Rails::VERSION::MAJOR >= 3
        @tracker = tracker
        @cuser = User.current
        @issue = Issue.find(:first, :conditions => { :id => tracker.issue_id })
        @hours = tracker.hours_spent

        mail :to => User.find(:first, :conditions => { :id => tracker.user_id }).mail,
             :subject => "[#{l(:time_tracker_mail_deleted_subject,:issue_id=>tracker.issue_id)}]"
      else
        recipients User.find(:first, :conditions => { :id => tracker.user_id }).mail
        subject "[#{l(:time_tracker_mail_deleted_subject,:issue_id=>tracker.issue_id)}]"
        body :tracker => tracker,
             :cuser => User.current,
             :issue => Issue.find(:first, :conditions => { :id => tracker.issue_id }),
             :hours => tracker.hours_spent
        render_multipart('tracker_deleted', body)
      end
    end
  end

  def self.included(receiver)
    receiver.send(:include, InstanceMethods)
  end
end

unless Mailer.included_modules.include? TimeTrackerMailer
    Mailer.send(:include, TimeTrackerMailer)
end
