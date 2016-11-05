require 'csv'

module RCSVReader 
    # Read a csv files and fill a hash containing headers and elements
    # args :
    #   file : the file to parse
    def self.read_CSV(file)
        first = true
        headers = Array.new
        elements = Array.new
        # Extract headers and data from CSV
        index = 0
        CSV.foreach(file, encoding:'iso-8859-1:utf-8') do |row| 
            # Headers
            if first
                first = !first
                splittedRow = row[0].split(';');
                splittedRow.each do |rowElement|
                    headers.push(rowElement)
                end
            # Data
            else
                splittedRow = row[0].split(';');
                elements[index] = Array.new
                splittedRow.each do |rowElement|
                    elements[index].push(rowElement)
                end    
                index += 1       
            end
        end
        return  { "headers" => headers, "elements" => elements }
    end
end