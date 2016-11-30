module OfficersHelper
  def cache_key_for_officer_row(officer)
    "#{officer.id}-#{officer.last_seen}"
  end
end
