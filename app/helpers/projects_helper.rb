module ProjectsHelper
  def agencies_link(project)
    raw project.agencies.map { |agency| link_to(agency.name, agency) }.join(',')
  end
end
