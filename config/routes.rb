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
