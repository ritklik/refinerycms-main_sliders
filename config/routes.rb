Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :main_sliders do
    resources :main_sliders, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :main_sliders, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :main_sliders, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
