if Rails::VERSION::MAJOR >= 3
  RedmineApp::Application.routes.draw do
    match '/time_trackers/stop', :to => 'time_trackers#stop', :via => [:get, :post]
    match '/time_trackers/start', :to => 'time_trackers#start', :via => [:get, :post]
    match '/time_trackers/suspend', :to => 'time_trackers#suspend', :via => [:get, :post]
    match '/time_trackers/render_menu', :to => 'time_trackers#render_menu', :via => [:get, :post]
    match '/time_trackers/show_report', :to => 'time_trackers#show_report', :via => [:get, :post]
    match '/time_trackers/delete', :to => 'time_trackers#delete', :via => [:get, :post]
    match '/time_trackers/add_status_transition', :to => 'time_trackers#add_status_transition', :via => [:get, :post]
    match '/time_trackers/delete_status_transition', :to => 'time_trackers#delete_status_transition', :via => [:get, :post]
    match '/time_trackers', :to => 'time_trackers#index', :via => [:get, :post]
  end
else
  ActionController::Routing::Routes.draw do |map|
    map.connect '/time_trackers/stop', :controller => 'time_trackers', :action => 'stop'
    map.connect '/time_trackers/start', :controller => 'time_trackers', :action => 'start'
    map.connect '/time_trackers/suspend', :controller => 'time_trackers', :action => 'suspend'
    map.connect '/time_trackers/render_menu', :controller => 'time_trackers', :action => 'render_menu'
    map.connect '/time_trackers/show_report', :controller => 'time_trackers', :action => 'show_report' 
    map.connect '/time_trackers/delete', :controller => 'time_trackers', :action => 'delete' 
    map.connect '/time_trackers/add_status_transition', :controller => 'time_trackers', :action => 'add_status_transition' 
    map.connect '/time_trackers/delete_status_transition', :controller => 'time_trackers', :action => 'delete_status_transition' 
    map.connect '/time_trackers', :controller => 'time_trackers', :action => 'index'
  end
end