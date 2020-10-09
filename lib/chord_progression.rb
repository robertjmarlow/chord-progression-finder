# frozen_string_literal: true

require 'note'
require 'chord'

# Creates a chord progression that uses the {https://en.wikipedia.org/wiki/Circle_of_fifths Circle of fifths}
# to make the chords sound nice together.
class ChordProgression
  CHROMATIC_SCALE = [
    Note.new(tone: :c),
    Note.new(tone: :c, accidental: :sharp),
    Note.new(tone: :d),
    Note.new(tone: :d, accidental: :sharp),
    Note.new(tone: :e),
    Note.new(tone: :f),
    Note.new(tone: :f, accidental: :sharp),
    Note.new(tone: :g),
    Note.new(tone: :g, accidental: :sharp),
    Note.new(tone: :a),
    Note.new(tone: :a, accidental: :sharp),
    Note.new(tone: :b)
  ].freeze

  attr_reader :chords

  def initialize(chords:)
    # TODO: make this private? https://stackoverflow.com/a/1567476
    @chords = chords
  end

  def self.create(key:)
    all_chords = get_all_chords_for_key(key: key)
    chords_in_progression = []

    case key.interval
    when :major
      # this is a pretty popular progression
      # https://en.wikipedia.org/wiki/List_of_songs_containing_the_I%E2%80%93V%E2%80%93vi%E2%80%93IV_progression
      chords_in_progression << all_chords[:I]
      chords_in_progression << all_chords[:V]
      chords_in_progression << all_chords[:vi]
      chords_in_progression << all_chords[:IV]
    when :minor
      # same as above but minor-ized
      chords_in_progression << all_chords[:i]
      chords_in_progression << all_chords[:v]
      chords_in_progression << all_chords[:VI]
      chords_in_progression << all_chords[:iv]
    end

    ChordProgression.new(chords: chords_in_progression)
  end

  def to_s
    chords.join(' ')
  end

  def self.get_all_chords_for_key(key:)
    note_idx = CHROMATIC_SCALE.find_index(key.note)
    chromatic_scale = CHROMATIC_SCALE.rotate(note_idx)

    # the index into the chromatic scale follows the intervals from the root note;
    #  +1 index is a semitone
    # the roman numerals follow:
    #  https://en.wikipedia.org/wiki/Roman_numeral_analysis#Diatonic_scales
    case key.interval
    when :major
      { I: Chord.new(note: chromatic_scale[0], interval: :major),
        ii: Chord.new(note: chromatic_scale[2], interval: :minor),
        iii: Chord.new(note: chromatic_scale[4], interval: :minor),
        IV: Chord.new(note: chromatic_scale[5], interval: :major),
        V: Chord.new(note: chromatic_scale[7], interval: :major),
        vi: Chord.new(note: chromatic_scale[9], interval: :minor),
        vii: Chord.new(note: chromatic_scale[11], interval: :diminished) }
    when :minor
      { i: Chord.new(note: chromatic_scale[0], interval: :minor),
        ii: Chord.new(note: chromatic_scale[2], interval: :diminished),
        III: Chord.new(note: chromatic_scale[3], interval: :major),
        iv: Chord.new(note: chromatic_scale[5], interval: :minor),
        v: Chord.new(note: chromatic_scale[7], interval: :minor),
        VI: Chord.new(note: chromatic_scale[8], interval: :major),
        VII: Chord.new(note: chromatic_scale[10], interval: :major) }
    end
  end
end
