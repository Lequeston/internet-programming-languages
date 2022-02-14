# frozen_string_literal: true

Rails.application.routes.draw do
  root 'calc#index'
  post '/calc/result', to: 'calc#result', as: :calc_result
  get '/calc/:id', to: 'calc#show', as: :calc_show
  get '/calcs', to: 'calc#all', as: :calc_all
end
