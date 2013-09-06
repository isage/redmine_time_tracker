require 'redmine'
require 'dispatcher' unless Rails::VERSION::MAJOR >= 3

if Rails::VERSION::MAJOR >= 3
  ActionDispatch::Callbacks.to_prepare do
    require 'time_tracker_patch'
    require 'time_tracker_helper_patches'
  end
else
  Dispatcher.to_prepare do
    require 'time_tracker_patch'
  end
end

require_dependency 'time_tracker_hooks'

Redmine::Plugin.register :redmine_time_tracker do
    name 'Redmine Time Tracker plugin'
    author 'Jérémie Delaitre'
    description 'This is a plugin to track time in Redmine'
    version '0.5'

    requires_redmine :version_or_higher => '1.3.0'

    settings :default => { 'refresh_rate' => '60', 'status_transitions' => {} }, :partial => 'settings/time_tracker'

    permission :view_others_time_trackers, :time_trackers => :index
    permission :delete_others_time_trackers, :time_trackers => :delete

    menu :account_menu, :time_tracker_menu, '',
        {
            :caption => '',
            :html => { :id => 'time-tracker-menu' },
            :first => true,
            :param => :project_id,
            :if => Proc.new { User.current.logged? }
        }
end
