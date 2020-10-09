# frozen_string_literal: true

require 'chord_progression'

RSpec.describe ChordProgression do
  it 'creates a C major chord progression' do
    progression = ChordProgression.create(key: Key.new(note: Note.new(tone: :c)))

    expect(progression.to_s).to eq('C G Am F')
  end

  it 'creates a G major chord progression' do
    progression = ChordProgression.create(key: Key.new(note: Note.new(tone: :g)))

    expect(progression.to_s).to eq('G D Em C')
  end
end