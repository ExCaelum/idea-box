Rails.application.routes.draw do
  root :to => "ideas#index"

  namespace :api do
    namespace :v1, defaults: {format: :json} do
      resources :ideas, only: [:index, :create, :destroy, :update]
      patch '/ideas/:id/upvote',to: "upvote#update"
    end
  end
end
