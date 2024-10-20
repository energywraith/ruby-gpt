module RubyGPT
  # The `RubyGPT::Message` class provides a simple interface for creating message objects [TODO].
  class Message
    attr_reader :role, :content

    def initialize(role:, content:)
      @role = role
      @content = content
    end

    def to_h
      { role: @role, content: @content }
    end
  end
end
