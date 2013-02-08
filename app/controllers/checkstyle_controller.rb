require "xslt"

class CheckstyleController < ApplicationController
  unloadable

  before_filter :find_project, :authorize

  def show
    @severity_count = {}
    @source_count = {}

    checkstyle_filename = get_checkstyle_project_file(params[:project_identifier])

    if !File.exists? checkstyle_filename then
      @error_list = "Could not read checkstyle report"
    else
      begin
        # Load the XML file
        stylesheet = XML::Document.file("vendor/plugins/redmine_checkstyle/app/views/checkstyle/list.xsl")
        xml_doc = XML::Document.file(checkstyle_filename)

        @severity_count = xml_doc.find("//error").to_a.group_by {|d| d['severity'].to_s}.map {|k,v| {:name => k, :count => v.length} }
        @source_count = xml_doc.find("//error").to_a.group_by {|d| d['source'].to_s}.map {|k,v| {:name => k, :count => v.length} }
      end

      begin
        sheet = XSLT::Stylesheet.new(stylesheet)

        # output to StdOut
        sheet.apply( xml_doc )

        # output to 'str'
        @error_list = sheet.apply( xml_doc ).to_s
      rescue
        @error_list = "Could not parse xml to stylesheet"
      end
    end
  end

  protected
  def find_project
    # @project variable must be set before calling the authorize filter
    @project = Project.find_by_identifier(params[:project_identifier])
  end

  protected
  def get_checkstyle_project_file(project_identifier)
    "/var/www/#{project_identifier}/checkstyle.xml"
  end
end