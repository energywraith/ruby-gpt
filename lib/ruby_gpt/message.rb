module RubyGPT
  # The `RubyGPT::Message` class provides a simple interface for creating message objects [TODO].
  class Message
    VALID_ROLES = %w[user assistant system].freeze

    attr_reader :role, :content

    def initialize(role:, content:)
      validate_role(role)
      validate_content(content)

      @role = role
      @content = content
    end

    def to_h
      { role: @role, content: @content }
    end

    private

    def validate_role(role)
      return if VALID_ROLES.include?(role)

      raise ArgumentError, "Invalid role: #{role}. Valid roles are: #{VALID_ROLES.join(', ')}"
    end

    def validate_content(content)
      return unless content.nil? || content.strip.empty?

      raise ArgumentError, 'Content cannot be empty.'
    end
  end
end
