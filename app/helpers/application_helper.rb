module ApplicationHelper
  def this_year
    Time.now.year
  end

  def github_url(author, repo)
    link_to "https://github.com/#{author.strip}/#{repo.strip}"
  end

  def flash_msg
    flash.map do |key, value|
      if value.is_a?(Array)
          value.map do |subvalue|
              content_tag :div, subvalue.try(:html_safe), class: "alert alert-#{devise_status_to_bootstrap(key)} m-3", role: "alert"
          end
      else
        content_tag :div, value.try(:html_safe), class: "alert alert-#{devise_status_to_bootstrap(key)} m-3", role: "alert"
      end
    end.join().html_safe if flash.any?
  end

  def devise_status_to_bootstrap(key)
    case key
    when "alert"
      "danger"
    when "notice"
      "success"
    else
      key
    end
  end

end
