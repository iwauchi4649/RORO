Rails.application.routes.draw do
  root 'review#business'

  resource :review do
    get 'business'
    get 'company'
    get 'contact'
    get 'message'
  end
end
