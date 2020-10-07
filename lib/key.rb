# frozen_string_literal: true

# Represents a {https://en.wikipedia.org/wiki/Key_signature Key Signature}.
class Key
  attr_reader :note, :interval

  # @param note [Note] The note of the key.
  # @param interval [Symbol] Whether the key is major or minor.
  # @raise [ArgumentError] if the interval is anything except major or minor.
  def initialize(note:, interval: :major)
    unless %i[major minor].include?(interval)
      raise ArgumentError, "#{interval} is not a valid interval. Intervals can only be major or minor."
    end

    @note = note
    @interval = interval
  end

  def to_s
    "#{note} #{interval}"
  end
end
