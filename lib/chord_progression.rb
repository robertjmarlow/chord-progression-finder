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

    chords_in_progression << all_chords[:I]
    chords_in_progression << all_chords[:V]
    chords_in_progression << all_chords[:vi]
    chords_in_progression << all_chords[:IV]

    ChordProgression.new(chords: chords_in_progression)
  end

  def to_s
    chords.join(' ')
  end

  private

  def self.get_all_chords_for_key(key:)
    all_chords = {}

    noteIdx = CHROMATIC_SCALE.find_index(key.note)
    chromaticScale = CHROMATIC_SCALE.rotate(noteIdx)

    all_chords[:I] = Chord.new(note: chromaticScale[0], interval: :major)
    all_chords[:ii] = Chord.new(note: chromaticScale[2], interval: :minor)
    all_chords[:iii] = Chord.new(note: chromaticScale[4], interval: :minor)
    all_chords[:IV] = Chord.new(note: chromaticScale[5], interval: :major)
    all_chords[:V] = Chord.new(note: chromaticScale[7], interval: :major)
    all_chords[:vi] = Chord.new(note: chromaticScale[9], interval: :minor)
    all_chords[:vii] = Chord.new(note: chromaticScale[11], interval: :diminished)

    return all_chords
  end
end
