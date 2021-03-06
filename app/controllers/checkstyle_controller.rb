require "xml"

class CheckstyleController < ApplicationController
  unloadable

  before_filter :find_project, :authorize

  def show
    @error = ""
    @report = nil
    @severity_count = {}
    @source_count = {}

    checkstyle_filename = get_checkstyle_project_file(params[:project_identifier])

    begin
      # Load the XML file
      @report = XML::Document.file(checkstyle_filename)
    rescue Exception => e  
      @error = e.message
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