module UsersHelper


  def avatar(user)
    if user.avatar.present?
      image_tag(user.avatar, class: "widget-meta profile-avatar")
    else
      image_tag("https://pbs.twimg.com/profile_images/575994177843904512/Su6OblHX_400x400.jpeg", class: "widget-meta profile-avatar")
    end
  end

  def cover_photo(user)
    if user.cover_photo.present?
      image_tag(user.cover_photo)
    else
      image_tag("http://33.media.tumblr.com/72b99653d8e3ac0e6dfed1a9bdad2302/tumblr_nohbix1n0v1uvkr55o1_500.gif")
    end
  end

  # ======
  #
  # Status badges for articles
  #
  # Usage:
  # Pass in an article and it returns the badge with text based on the status of the article.
  #
  #
  def status_badge(article)
    case
      # ======
      #
      # Unpublished
      #
      when article.published_at.nil? && article.embargoed_until.nil?
        "<span class='badge'>#{status_text(article)}</span>".html_safe

      # ======
      #
      # Published
      #
      when article.published_at.present?
        "<span class='badge status-active'>#{status_text(article)}</span>".html_safe

      # ======
      #
      # Embargoed
      #
      when article.embargoed_until.present?
        "<span class='badge status-pending'>#{status_text(article, extended: true)}</span>".html_safe
      #
    end
  end
end
