Rails.application.routes.draw do

  namespace :movies do
    namespace :actors do
      get 'collector/show'
      get 'collector/create'
    end
  end
  devise_for :users
  root to: "home#index"
  resources :movies do
    resources :actors, controller: "movies/actors" do
      collection do
        get "/collect", to: "movies/actors/collector#show"
        post "/collect", to: "movies/actors/collector#create"
      end
    end
    resources :locations, controller: "movies/locations"
    resources :scenes, controller: "movies/scenes"
    resources :roles, controller: "movies/roles"
    resources :casts, controller: "movies/casts"
    resources :cars, controller: "movies/cars"
    resources :documents, controller: "movies/documents"

    resources :inventories, controller: "movies/inventories" do
      resources :items, controller: "movies/inventories/items"
    end
    resource :budget

    resource :schedule, controller: "movies/schedule" do
      get "/actor/:actor_id", to: "movies/schedule#for_actor"
      get "/events/:event/:day", to: "movies/schedule/events#create", as: "schedule_event"
    end

    resources :schedule_events,  controller: "movies/schedule_events" do
      resources :ride_events,  controller: "movies/schedule_events/ride_events"
      resources :break_events,  controller: "movies/schedule_events/break_events"
      resources :shoot_events,  controller: "movies/schedule_events/shoot_events"
      resources :action_events,  controller: "movies/schedule_events/action_events"
    end
  end
end
