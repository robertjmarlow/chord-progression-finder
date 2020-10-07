# frozen_string_literal: true

# Represents a {https://en.wikipedia.org/wiki/Key_signature Key Signature}.
class Key
  attr_reader :note, :interval

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
