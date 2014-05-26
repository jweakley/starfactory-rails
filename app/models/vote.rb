class Vote < ActiveRecord::Base
  belongs_to :workshop, counter_cache: true
end
