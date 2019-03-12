class Permission < ApplicationRecord
has_and_belongs_to_many :users, :join_table => :users_permissions


belongs_to :resource,
           :polymorphic => true,
           :optional => true


validates :resource_type,
          :inclusion => { :in => Rolify.resource_types },
          :allow_nil => true

scopify
end
