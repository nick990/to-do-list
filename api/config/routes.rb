Rails.application.routes.draw do
  resources :tasks, only: %i[index create destroy show] do
    member do
      patch :complete
    end
  end
end
