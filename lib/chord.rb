# frozen_string_literal: true

# Represents a chord
class Chord
  VALID_INTERVALS = %i[major minor diminished].freeze

  attr_reader :note, :interval

  # @param note [Note] The note of the chord.
  # @param interval [Symbol] Whether the chord is major, minor, or diminished.
  # @raise [ArgumentError] if the interval is anything except major, minor, or diminished.
  def initialize(note:, interval: :major)
    # TODO: figure out all the notes in this chord?
    unless VALID_INTERVALS.include?(interval)
      raise ArgumentError, "#{interval} is not a valid interval. Intervals can only be major, minor, or diminished."
    end

    @note = note
    @interval = interval
  end

  def to_s
    chord_str = note.to_s

    case interval
    when :minor
      chord_str << 'm'
    when :diminished
      chord_str << 'dim'
    end

    chord_str
  end
end
