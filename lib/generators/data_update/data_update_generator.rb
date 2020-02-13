class DataUpdateGenerator < Rails::Generators::NamedBase
  source_root File.expand_path("templates", __dir__)

  def create_data_update_file
    template(
      "data_update.rb.tt",
      File.join("lib", "data_update_scripts", class_path, "#{file_name}.rb"),
    )
  end
end
