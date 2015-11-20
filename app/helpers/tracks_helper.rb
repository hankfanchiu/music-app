module TracksHelper
  include ERB::Util

  def ugly_lyrics(lyrics)
    lines = lyrics.split(/\n/)
    ugly_lyrics = lines.map { |line| "<pre>&#9835; #{h(line)}</pre>" }

    ugly_lyrics.join("").html_safe
  end
end
