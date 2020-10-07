# frozen_string_literal: true

require 'key'

RSpec.describe Key do
  it 'creates a C major key' do
    key = Key.new(note: Note.new(tone: :c))

    expect(key.note.tone).to eq(:c)
    expect(key.note.accidental).to eq(:natural)
    expect(key.interval).to eq(:major)
    expect(key.to_s).to eq('C major')
  end

  it 'creates an f# minor key' do
    key = Key.new(note: Note.new(tone: :f, accidental: :sharp), interval: :minor)

    expect(key.note.tone).to eq(:f)
    expect(key.note.accidental).to eq(:sharp)
    expect(key.interval).to eq(:minor)
    expect(key.to_s).to eq('F♯ minor')
  end

  it 'throws an exception if an illegal key is interval is specified' do
    expect { Key.new(note: Note.new(tone: :c), interval: :sad) }.to raise_error(ArgumentError)
  end
end
