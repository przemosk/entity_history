# frozen_string_literal: true

require "spec_helper"

RSpec.describe EntityHistory, model: true do
  it "has a version number" do
    expect(EntityHistory::VERSION).not_to be nil
  end

  describe ".log_entity_history" do
    context "calls hooks" do
      let(:book) { build(:book) }

      it "when object is after create action" do
        expect(book).to receive(:notify_created_event)

        book.save
      end

      it "when object is after update action" do
        book.save
        expect(book).to receive(:notify_updated_event)

        book.update!(title: "Great Job")
      end

      it "when object is after destroy action" do
        book.save
        expect(book).to receive(:notify_destroyed_event)

        book.destroy
      end
    end
  end

  describe "#display_entity_history" do
    let!(:book) { create(:book) }

    it "serializes the entity history" do
      expect(book).to receive(:display_entity_history)

      book.display_entity_history
    end
  end
end
