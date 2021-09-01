require 'csv'

module Wice
  class Spreadsheet  #:nodoc:

    #:nodoc:
    attr_reader :tempfile

    def initialize(name, field_separator, encoding = nil)  #:nodoc:
      @tempfile = Tempfile.new(name)
      @tempfile.chmod 0640
      @tempfile.set_encoding(encoding) unless encoding.blank?
      @tempfile.write("\ufeff") # add byte order mark to help with Excel import
      @csv = CSV.new(@tempfile, col_sep: field_separator)
    end

    def << (row)  #:nodoc:
      @csv << row
    end
  end
end
