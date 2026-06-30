{
  programs.zsh.shellAliases = {
    yta-aac = "yt-dlp --extract-audio --audio-format aac ";
    yta-best = "yt-dlp --extract-audio --audio-format best ";
    yta-flac = "yt-dlp --extract-audio --audio-format flac ";
    yta-mp3 = "yt-dlp --extract-audio --audio-format mp3 ";
    ytv-best = "yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4";
  };
}
