# frozen_string_literal: true

module EntityHistory
  class Configuration
    def self.default_serializer_klass
      EntityHistory::Serializers::EntityHistorySerializer
    end
  end
end
