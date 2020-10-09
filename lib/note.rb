# frozen_string_literal: true

# Represents a single note on the {https://en.wikipedia.org/wiki/Chromatic_scale Chromatic Scale}.
class Note
  # valid tones for a note
  VALID_TONES = %i[a b c d e f g].freeze

  # valid accidentals for a note
  VALID_ACCIDENTALS = %i[sharp natural flat].freeze

  attr_reader :tone, :accidental

  # @param tone [Symbol] The tone of the note. Only a through g are accepted.
  # @param accidental [Symbol] Whether the note is sharp, natural, or flat.
  # @raise [ArgumentError] if the note's tone or accidental is illegal _or_ if the note is impossible (e.g. b sharp).
  def initialize(tone:, accidental: :natural)
    raise ArgumentError, "#{tone} is not a valid tone. Tones can only be A-G." unless VALID_TONES.include?(tone)
    unless VALID_ACCIDENTALS.include?(accidental)
      raise ArgumentError, "#{accidental} is not a valid accidental. Accidentals can only be sharp, natural, or flat."
    end
    unless valid_note?(tone: tone, accidental: accidental)
      raise ArgumentError, "#{tone} #{accidental} is a non-existent note."
    end

    @tone = tone
    @accidental = accidental
  end

  # Determines whether or not the note is valid. e.g. an Esharp doesn't exist.
  # @return Whether or note the note is valid.
  def valid_note?(tone:, accidental:)
    if tone == :e && accidental == :sharp
      false
    elsif tone == :f && accidental == :flat
      false
    elsif tone == :b && accidental == :sharp
      false
    elsif tone == :c && accidental == :flat
      false
    else
      true
    end
  end

  def to_s
    note_string = tone.upcase.to_s

    case accidental
    when :flat
      note_string << '♭'
    when :sharp
      note_string << '♯'
    end

    note_string
  end

  def hash
    tone ^ accidental
  end

  def eql?(other)
    # TODO: technically, F# == Gb, so..... yeah fix that
    tone == other.tone && accidental == other.accidental
  end
  alias :== eql?
end
