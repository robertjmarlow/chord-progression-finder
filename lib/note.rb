class Note
    @@allTones = [:a, :b, :c, :d, :e, :f, :g]
    @@allAccidetals = [:sharp, :natural, :flat]

    attr_reader :tone
    attr_reader :accidental

    def initialize(tone:, accidental: :natural)
        raise ArgumentError, "#{tone} is not a valid tone. Tones can only be A-G." unless @@allTones.include?(tone)
        raise ArgumentError, "#{accidental} is not a valid accidental. Accidentals can only be sharp, natural, or flat." unless @@allAccidetals.include?(accidental)

        @tone = tone
        @accidental = accidental
    end

    def to_s
        noteString = "#{tone.upcase}"

        if (@accidental == :flat)
            noteString << "♭"
        elsif (@accidental == :sharp)
            noteString << "♯"
        end

        return noteString
    end
end
