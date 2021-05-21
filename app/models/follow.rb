# frozen_string_literal: true

class Follow < ApplicationRecord
  belongs_to :user, counter_cache: true
  belongs_to :post, counter_cache: true
end
