Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  
  root   "dashboard#index"
  resources :dashboard, only: [:index, :update]

  get     "/feature1",               to: "test#feature1"
  get     "/feature2",               to: "test#feature2"

  resources     :invites, only: [] do
    collection do
      delete :cancel
      post :new, as: "send"
      get :accept
    end
  end
  # delete  "/invite/cancel",          to: "invites#destroy",    as: 'invite_cancel'
  # post    "/invite/send",            to: "invites#new",        as: 'invite'
  # get     "/invite/accept",          to: "invites#accept",     as: 'invite_accept'

  resources     :organizations,      as: 'organization', path: "/org", except: [:index] do
    
    resources   :organization_roles, as: 'role',path: "/role",      except: [:index, :edit]
    resources   :channels,           as: 'channel',  path: '/c',     except: [:index] do

      resources :channel_roles,      as: 'role',path: '/role',      except: [:index, :edit]
    end
  end
  
end
