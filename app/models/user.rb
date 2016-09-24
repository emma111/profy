class User < ActiveRecord::Base

  #accessor
  attr_accessor :group_key

  #devise config
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable,
         :authentication_keys => [:email]

  #association
  belongs_to :group
