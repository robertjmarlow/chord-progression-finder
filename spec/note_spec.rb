# frozen_string_literal: true

require 'note'

RSpec.describe Note do
  it 'creates a C natural' do
    note = Note.new(tone: :c)

    expect(note.tone).to eq(:c)
    expect(note.accidental).to eq(:natural)
    expect(note.to_s).to eq('C')
  end

  it 'creates a B flat' do
    note = Note.new(tone: :b, accidental: :flat)

    expect(note.tone).to eq(:b)
    expect(note.accidental).to eq(:flat)
    expect(note.to_s).to eq('B♭')
  end

  it 'creates an F sharp' do
    note = Note.new(tone: :f, accidental: :sharp)

    expect(note.tone).to eq(:f)
    expect(note.accidental).to eq(:sharp)
    expect(note.to_s).to eq('F♯')
  end

  it 'throws an exception if an illegal tone is specified' do
    expect { Note.new(tone: :h) }.to raise_error(ArgumentError)
  end

  it 'throws an exception if an illegal accidental is specified' do
    expect { Note.new(tone: :a, accidental: :super_sharp) }.to raise_error(ArgumentError)
  end

  it 'throws an exception if an illegal note attempts to be created' do
    expect { Note.new(tone: :e, accidental: :sharp) }.to raise_error(ArgumentError)
    expect { Note.new(tone: :f, accidental: :flat) }.to raise_error(ArgumentError)
    expect { Note.new(tone: :b, accidental: :sharp) }.to raise_error(ArgumentError)
    expect { Note.new(tone: :c, accidental: :flat) }.to raise_error(ArgumentError)
  end
end
