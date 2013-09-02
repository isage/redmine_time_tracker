
  module TimeTrackerMailer
      module InstanceMethods
        def tracker_deleted(tracker)
          recipients User.find(:first, :conditions => { :id => tracker.user_id }).mail
          issue = Issue.find(:first, :conditions => { :id => tracker.issue_id })
          subject "[#{l(:time_tracker_mail_deleted_subject,:issue_id=>tracker.issue_id)}]"
          body :tracker => tracker,
               :cuser => User.current,
               :issue => issue,
               :hours => tracker.hours_spent
          render_multipart('tracker_deleted', body)
        end
      end

      def self.included(receiver)
        receiver.send(:include, InstanceMethods)
      end
  end

