DocsApiBootstraper::Application.routes.draw do

  # ----------------------------------------------------------------------------
  # ActiveAdmin routes
  #
  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config
  # ----------------------------------------------------------------------------


  # ----------------------------------------------------------------------------
  # Documentation routes
  #
  root :to          => "default#index"
  get "/rest"       => "default#rest"

  get "/:version"           => "versions#show"
  get "/:version/changelog" => "changelogs#show"
  get "/:version/:resource" => "resources#show"

  # ----------------------------------------------------------------------------

end
