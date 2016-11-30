module OfficersHelper
  def cache_key_for_officer_row(officer)
    "officer-#{officer.id}-#{officer.last_seen}"
  end

  def cache_key_for_officer_table
    "officer-table-#{Officer.maximum(:last_seen)}"
  end
end
