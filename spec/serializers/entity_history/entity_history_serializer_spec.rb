# frozen_string_literal: true

require "spec_helper"

RSpec.describe EntityHistory::Serializers::EntityHistorySerializer, type: :serializer do
  subject { described_class.new(collection: collection, options: options) }

  describe "#serializable_hash" do
    let!(:book) { create(:book) }
    let!(:create_history) { book.update!(title: "#{book.title}_#{rand(999..99999)}") }
    let(:collection) do 
      RailsEventStore::Client.new.read.stream("Book_#{book.id}").to_a
    end

    context "with raw:false option" do
      let(:options) { { raw: false } }

      it "return serialized payload" do
        result = subject.serializable_hash

        expect(result.is_a?(Array)).to eq true
        expect(result.first.keys).to eq %i[action event_id attributes changes]
        expect(result.first.is_a?(Hash)).to eq true
      end
    end

    context "with raw:true option" do
      let(:options) { { raw: true } }

      it "contain required keys" do
        result = subject.serializable_hash

        expect(result.is_a?(Array)).to eq true
        expect(result.first.is_a?(EntityHistory::Events::Created)).to eq true
      end
    end
  end
end
