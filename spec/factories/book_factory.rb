# frozen_string_literal: true

FactoryBot.define do
  factory :book, class: "Book" do
    title { "Good Job" }
    author  { "Unknown" }
    description { "" }
  end
end
