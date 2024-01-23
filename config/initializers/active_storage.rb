Rails.application.config.to_prepare do
  ActiveStorage::Record.has_paper_trail
end