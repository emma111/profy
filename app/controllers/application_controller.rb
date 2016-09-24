class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # authenticate_user!はユーザがログインしているかどうかを確認し、ログインしていない場合はユーザをログインページにリダイレクトするdeviseのメソッド
  protect_from_forgery with: :exception
end
