# frozen_string_literal: true

class Note
  @@all_tones = %i[a b c d e f g]
  @@all_accidetals = %i[sharp natural flat]

  attr_reader :tone
  attr_reader :accidental

  def initialize(tone:, accidental: :natural)
    raise ArgumentError, "#{tone} is not a valid tone. Tones can only be A-G." unless @@all_tones.include?(tone)
    unless @@all_accidetals.include?(accidental)
      raise ArgumentError, "#{accidental} is not a valid accidental. Accidentals can only be sharp, natural, or flat."
    end

    @tone = tone
    @accidental = accidental
  end

  def to_s
    note_string = tone.upcase.to_s

    if @accidental == :flat
      note_string << '♭'
    elsif @accidental == :sharp
      note_string << '♯'
    end

    note_string
  end
end
