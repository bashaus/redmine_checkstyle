require 'redmine'

Redmine::Plugin.register :redmine_checkstyle do
  name 'Redmine checkstyle plugin'
  author 'Bashkim Isai'
  description 'Show the results of a checkstyle output'
  version '0.0.1'

  menu :project_menu, :checkstyle, { :controller => 'checkstyle', :action => 'show' }, :caption => 'Coding', :after => :activity, :param => :project_identifier

  project_module :checkstyle do
    permission :view_checkstyle, :checkstyle => [:index, :show]
  end
end