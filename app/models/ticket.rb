# frozen_string_literal: true

# class Ticket
class Ticket < ApplicationRecord
  has_one :excavator, dependent: :destroy
end
