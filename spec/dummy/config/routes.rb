# frozen_string_literal: true

Rails.application.routes.draw do
  get :remote_ip, to: "remote_ip#show"
end
