module ApplicationHelper
  include Pagy::Frontend

  # general
  def current_user_is?(user)
    logged_in? && user == current_user
  end

  # header
  def exist_search_form?
    if (controller_name == 'whiskeys') && (action_name == 'index')
      true
    elsif controller_name == 'searches'
      true
    end
  end

  def separate_header
    if controller_name == 'staticpages'
      render 'shared/headers/top_header'
    else
      render 'shared/headers/header'
    end
  end

  def separate_menu
    if logged_in?
      render 'shared/headers/header_menu'
    else
      render 'shared/headers/header_menu_before_login'
    end
  end

  def space_behind_head
    return 'mt-7' if controller_name != 'staticpages'
  end

  # whiskey
  def proper_price(price)
    if price.zero?
      'オープン価格'
    else
      "¥#{price.to_s(:delimited)}"
    end
  end

  def draw_rating(n, star)
    html_text = ''
    (n + 1).times do
      html_text += render 'shared/ratings/star'
    end
    # 5つ星と3つ星を出し分ける
    (star - 1 - n).times do
      html_text += render 'shared/ratings/outline_star'
    end
    raw(html_text)
  end

  def sort_by_sort_url(url, order)
    url.gsub(/%5Bs%5D=\w+\+\w+/, "%5Bs%5D=#{order}")
  end

  # settings
  def default_meta_tags
    {
      site: 'Malt Mate - ウイスキーをもっと身近に -',
      title: 'Malt Mate - ウイスキーをもっと身近に -',
      reverse: true,
      separator: '|',
      description: '『Malt Mate』はウイスキーを気軽に、もっと身近に楽しむための情報サイト。相性のよい飲み方やおつまみなど、独自の検索軸からあなたのウイスキー選びをサポートします。',
      keywords: 'ウイスキー,初心者,ペアリング,わかりにくい,直感,難しい,相性,フレーバー',
      canonical: request.original_url,
      noindex: !Rails.env.production?,
      icon: [
        { href: image_url('favicon.ico') },
        { href: image_url('apple-touch-icon.png'), rel: 'apple-touch-icon' }
      ],
      og: {
        site_name: 'Malt Mate - モルトメイト -',
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.png'),
        locale: 'ja_JP'
      },
      twitter: {
        card: 'summary_large_image',
        creator: '@tarakish_23'
      }
    }
  end
end
