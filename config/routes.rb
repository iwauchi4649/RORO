Rails.application.routes.draw do
  root 'review#company'

  get 'review/company' => 'review#company'
  get 'review/business' => 'review#business'
  get 'review/message' => 'review#message'
  get 'review/contact' => 'review#contact'
  get  'contact' =>'review#contact'
  post 'confirm' => 'review#confirm'
  post 'done' => 'review#done'
end
