# frozen_string_literal: true

Rails.application.routes.draw do
  root 'ajax#input'
  post 'ajax/result'
end
