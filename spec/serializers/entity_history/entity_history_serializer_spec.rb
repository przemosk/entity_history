# frozen_string_literal: true

require "spec_helper"

RSpec.describe EntityHistory::Serializers::EntityHistorySerializer, type: :serializer do
  subject { described_class.new(collection: collection) }

  describe "#serializable_hash" do
    context "with raw:false option" do
      it "contain required keys" do
        true
      end
    end

    context "with raw:true option" do
      it "contain required keys" do
        true
      end
    end
  end
end
