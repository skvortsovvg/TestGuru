module ApplicationHelper
  def this_year
    Time.now.year
  end

  def github_url(author, repo)
    link_to "https://github.com/#{author.strip}/#{repo.strip}"
  end

  def flash_msg
    flash.map do |key, value|
      content_tag :p, value, class: "flash #{key}"
    end.join().html_safe if flash.any?
  end
end
