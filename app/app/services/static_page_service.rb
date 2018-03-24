# A class for writing static pages to the public directory.

require 'fileutils'

class StaticPageService
  PUBLIC_DIR = 'public'.freeze
  INDEX_FILE = 'index'.freeze

  def generate_portfolio(portfolio_name)
    return if portfolio_name.blank?

    # Create portfolio folder
    generate_directory(portfolio_name)

    # TODO: Render portfolio cell here and pass to generate_file

    # Create index file and add content
    generate_file(portfolio_name, INDEX_FILE, "<h1>Portfolio #{portfolio_name}</h1>")
  end

  def generate_project(portfolio_name, project_name)
    return if portfolio_name.blank? || project_name.blank?

    # Create portfolio folder incase it doesn't already exist
    generate_directory(portfolio_name)

    # TODO: Render project cell here and pass to generate_file

    # Create file and add content
    generate_file(portfolio_name, project_name, "<h1>Project #{project_name}</h1>")
  end

  private

  def generate_directory(dir_name)
    return if dir_name.blank?

    dir_name = "#{PUBLIC_DIR}/#{dir_name.to_s.parameterize}"
    FileUtils.mkdir_p dir_name unless File.directory? dir_name
  end

  def generate_file(dir_name, file_name, file_contents)
    return if dir_name.blank? ||
              file_name.blank? ||
              file_contents.blank?

    file_path = [
      PUBLIC_DIR,
      dir_name.to_s.parameterize,
      file_name.to_s.parameterize
    ].join('/') + '.html'

    File.write file_path, file_contents
  end
end
