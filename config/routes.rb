Rails.application.routes.draw do

  get 'account/index'
  get 'pricing/index'
  authenticate :user, ->(u) { u.id } do
    require 'sidekiq/web'
    require 'sidekiq/cron/web'
    mount Sidekiq::Web => '/sidekiq'
  end




  devise_for :users
  root to: "home#index"
  resources :movies do
    resource :access_manager, only: :show, controller: "movies/access_manager" do
      resources :invites, controller: "movies/access_manager/invites" do
        collection do
          post "/new", to: "movies/access_manager/invites#create"
        end
      end
    end



    resource :simulation, only: [:create, :show], controller: "movies/simulation"
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

    resource :budget, controller: "movies/budget" do
    end

    resources :movie_money_transfers, controller: "movies/budget"

    resource :schedule, controller: "movies/schedule" do
      get "/actor/:actor_id", to: "movies/schedule#for_actor", as: "actor"
      get "/events/:event/:day", to: "movies/schedule/events#create", as: "schedule_event"
      post "/:schedule_id/sort", to: "movies/schedule/sort#create"
    end

    resources :schedule_events,  controller: "movies/schedule_events" do
      resources :ride_events,  controller: "movies/schedule_events/ride_events"
      resources :break_events,  controller: "movies/schedule_events/break_events"
      resources :shoot_events,  controller: "movies/schedule_events/shoot_events"
      resources :action_events,  controller: "movies/schedule_events/action_events"
    end
  end
end
