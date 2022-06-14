module ApplicationHelper
  def this_year
    Time.now.year
  end
  def github_url(author, repo)
    link_to "https://github.com/#{author.strip}/#{repo.strip}"
  end

  def alert
    if flash[:alert]
      content_tag :p, flash[:alert], class: 'flash alert'
    end
  end
end
