Rails.application.routes.draw do
  root 'review#company'

  get 'review/company' => 'review#company'
  get 'review/business' => 'review#business'
  get 'review/message' => 'review#message'
  get 'review/contact' => 'review#contact'
end
