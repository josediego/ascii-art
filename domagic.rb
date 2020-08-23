require 'date'

class RubyScript
    attr_accessor :current_date, :art_off_the_day_file

    def initialize()
        @current_date = DateTime.now
        @art_off_the_day_file = getFilePath("ascii-art/#{@current_date.strftime("%d-%m")}.txt")
    end

    def show_me_something_nice()
        current_art = if !File.file?(@art_off_the_day_file) 
            File.read(getFilePath("ascii-art/default.txt"))
        else
            File.read(@art_off_the_day_file)
        end
        current_art.split("#delimiter").map(&:strip).sample
    end

    private
        def getFilePath(filename)
            File.join(File.expand_path(File.dirname(File.absolute_path(__FILE__))), filename)
        end
end

rubyScript = RubyScript.new
puts rubyScript.show_me_something_nice