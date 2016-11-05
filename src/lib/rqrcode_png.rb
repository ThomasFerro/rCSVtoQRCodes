require 'rqrcode_png'

module RQRCode
    def self.genereate_QRCode(string, filename , size = 16)
        qr = RQRCode::QRCode.new(string, :size => size, :level => :h )
        png = qr.to_img                                             # returns an instance of ChunkyPNG
        png.resize(200, 200).save("png/" + filename + ".png")
    end
end