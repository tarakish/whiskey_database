module ApplicationHelper
  include Pagy::Frontend

  def current_user_is?(user)
    logged_in? && user = current_user
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

  def default_meta_tags
    {
      site: 'Malt Mate - ウイスキーをもっと身近に -',
      title: '',
      reverse: true,
      separator: '|',
      description: 'ウイスキーを気軽に、身近に楽しむための情報サイトです。相性のよい飲み方やおつまみなど、独自の検索軸からウイスキー選びをサポートします。',
      keywords: 'ウイスキー,初心者,ペアリング,わかりにくい,直感,難しい,相性,フレーバー',
      canonical: request.original_url,
      noindex: !Rails.env.production?,
      icon: image_url('favicon.ico'),
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.png'),
        locale: 'ja_JP'
      },
      twitter: {
        card: 'summary_large_image',
        creator: '@tarakish_23',
        image: image_url('ogp.png')
      }
    }
  end

end
