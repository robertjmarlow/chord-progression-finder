class Note
    @@all_tones = [:a, :b, :c, :d, :e, :f, :g]
    @@all_accidetals = [:sharp, :natural, :flat]

    attr_reader :tone
    attr_reader :accidental

    def initialize(tone:, accidental: :natural)
        raise ArgumentError, "#{tone} is not a valid tone. Tones can only be A-G." unless @@all_tones.include?(tone)
        raise ArgumentError, "#{accidental} is not a valid accidental. Accidentals can only be sharp, natural, or flat." unless @@all_accidetals.include?(accidental)

        @tone = tone
        @accidental = accidental
    end

    def to_s
        note_string = "#{tone.upcase}"

        if (@accidental == :flat)
            note_string << '♭'
        elsif (@accidental == :sharp)
            note_string << '♯'
        end

        return note_string
    end
end
