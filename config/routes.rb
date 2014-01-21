DocsApiBootstraper::Application.routes.draw do

  # ----------------------------------------------------------------------------
  # ActiveAdmin routes
  #
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
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
