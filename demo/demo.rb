# frozen_string_literal: true

# puts $LOAD_PATH
# $LOAD_PATH << '../lib'
$LOAD_PATH << '/home/rob/git/chord-progression-finder/lib'
# puts $LOAD_PATH

# puts __FILE__

# require_relative '../lib/chord_progression'
require 'chord_progression'
require 'key'
require 'note'

puts 'What key do you want a chord progression for?'
puts 'e.g.: C for C major, Gm for G minor, F# for F# major'

input_arr = gets.chomp.match(/([A-G])([#b])?(m)?/)

if !input_arr.nil? && !input_arr[1].nil?
  accidental = :natural
  interval = input_arr[3].nil? ? :major : :minor

  unless input_arr[2].nil?
    case input_arr[2]
    when '#'
      accidental = :sharp
    when 'b'
      accidental = :flat
    end
  end

  chord_progression_key =
    Key.new(note: Note.new(tone: input_arr[1].downcase.to_sym, accidental: accidental), interval: interval)

  puts "Your chord progression for #{chord_progression_key} is:"
  puts ChordProgression.create(key: chord_progression_key).to_s
else
  puts 'Only notes A through G are valid'
end
