module ApplicationHelper
  def years_between(date_from:, date_to:)
    ((date_to.to_time - date_from.to_time) / 1.year.seconds).floor
  end
end
