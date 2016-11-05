require 'rqrcode_png'

module RQRCode
    def self.QRCode_size_from_string_length(length)
        case length
        when 0..50
            return 6
        when 51..140
            return 12
        when 141..250
            return 16
        else 
            return 20 
        end
    end

    def self.genereate_QRCode(string, filename)
        qr = RQRCode::QRCode.new(string, :size => QRCode_size_from_string_length(string.length), :level => :h )
        png = qr.to_img                                             # returns an instance of ChunkyPNG
        png.resize(200, 200).save("png/" + filename + ".png")
    end
end