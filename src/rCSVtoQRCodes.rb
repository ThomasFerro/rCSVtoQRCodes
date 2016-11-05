require 'fileutils'
require_relative 'lib/rCSVReader'
require_relative 'lib/rqrcode_png'

# Extract csv file name from a relative or absolute path
def extract_file_name(file)
    return file.split('/').last.split('.csv').first
end

# Create the string to be encode into the QRCode
def create_string_from_data(data, dataIndex)
    ret = ""
    index = 0
    limit = data["headers"].length
    
    while index < limit
        header = data["headers"][index]
        element = "/"
        if data["elements"][dataIndex][index].to_s.length != 0
            element = data["elements"][dataIndex][index]
        end
        ret += header + " : " + element + "; "
        index += 1
    end
    return [ret]
end

files = Dir.glob("csv/*.csv").select {|f| !File.directory? f}

if files.length == 0
    puts 'No CSV file found in \'csv\' folder.'
end

# Extract data from each CSV file
files.each do |file|
    # Extract data from the CSV
    data = RCSVReader.read_CSV(file)

    index = 0
    limit = data["elements"].length

    # For each person in the CSV, create a png with all his informations
    while index < limit
        firstName = data["elements"][index][0]
        lastName = data["elements"][index][1]

        filename = extract_file_name(file) + '/' + firstName + '_' + lastName
        stringToEncode = create_string_from_data(data, index)

        dirname = File.dirname('./png/' + filename)
        unless File.directory?(dirname)
            FileUtils.mkdir_p(dirname)
        end
        # Generate the QRCode
        RQRCode.genereate_QRCode(stringToEncode[0], filename)
        index += 1
    end
end

