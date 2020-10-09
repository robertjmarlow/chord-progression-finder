# frozen_string_literal: true

require 'chord'

RSpec.describe Chord do
  it 'creates a C major' do
    chord = Chord.new(note: Note.new(tone: :c))

    expect(chord.note.tone).to eq(:c)
    expect(chord.note.accidental).to eq(:natural)
    expect(chord.interval).to eq(:major)
    expect(chord.to_s).to eq('C')
  end

  it 'creates a D minor' do
    chord = Chord.new(note: Note.new(tone: :d), interval: :minor)

    expect(chord.note.tone).to eq(:d)
    expect(chord.note.accidental).to eq(:natural)
    expect(chord.interval).to eq(:minor)
    expect(chord.to_s).to eq('Dm')
  end

  it 'creates an F sharp diminished' do
    chord = Chord.new(note: Note.new(tone: :f, accidental: :sharp), interval: :diminished)

    expect(chord.note.tone).to eq(:f)
    expect(chord.note.accidental).to eq(:sharp)
    expect(chord.interval).to eq(:diminished)
    expect(chord.to_s).to eq('F♯dim')
  end

  it 'throws an exception if an illegal interval is specified' do
    expect { Chord.new(note: Note.new(tone: :c), interval: :sad) }.to raise_error(ArgumentError)
  end
end
