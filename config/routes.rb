Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'lists#index' # bare url without slash/spezification
  resources :lists, except: %i[edit update] do # list_id - for a choosen id
    resources :bookmarks, only: %i[new create] # theese are all the bookmarks related to the list_id
  end
  resources :bookmarks, only: :destroy # /bookmarks/:id
end

# See all
# See details about one
# Create a
# Update a
# Destroy a

# get '/songs/new, to: 'songs#new'
# post '/songs', to: 'songs#create'
# get '/songs/:id', to: 'songs#show'
# get '/songs', to: 'songs#index'
# get '/songs/:id/edit', to: 'songs#edit'
# put '/songs/:id', to: 'songs#update'
# delete '/songs/:id', to: 'songs#destroy'

# Read all
# get    "lists",          to: "lists#index"
# Create
# get    "lists/new",      to: "lists#new",  as: :new_restaurant
# post   "lists",          to: "lists#create"
# Read one - The `show` route needs to be *after* `new` route.
# get    "lists/:id",      to: "lists#show", as: :restaurant
# Update
# get    "lists/:id/edit", to: "lists#edit", as: :edit_restaurant
# patch  "lists/:id",      to: "lists#update"
# Delete
# delete "lists/:id",      to: "lists#destroy"
