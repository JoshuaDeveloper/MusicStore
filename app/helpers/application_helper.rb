module ApplicationHelper
  def welcome
    puts "Welcome to \n"
    logo.length.times do |element|
      print logo[element]
      sleep(0.010)
    end
    puts ""
  end

  def loading(n_times = 22)
    n_times.times do
      sleep 0.1
      print "-"
    end
    puts ""
  end

  def logo
    "

⠀⠀⠀⠀⠀⠀⠀⢀⣴⣦⣶⣤⣤⣶⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣤⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣶⣦⡀⠀ ⣠⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⣼⣿⠋⣹⣿⠋⣹⣿⠃⣀⡀⢀⣀⠀⠀⣠⣄⠀⠀⣀⡉⠁⣀⣀⡀⠀⠀⠀⠀⠀⠀⢺⣿⡁⠙⢃⣠⣿⣟⠛⣀⣀⡀⠀⢠⣤⡀⠀⠀⠀⣀⣀⡀⠀⠀
⠀⠀⠀⠀⠀⠀⢰⣿⠇⢠⣿⠇⢠⣿⡏⢰⣿⠃⣼⡟⠀⣰⣿⣏⠀⢠⣿⠃⣼⡿⢻⣿⠀⠀⠀⠀⠀⠀⠈⠻⣿⣆⠈⣿⡟⠉⣼⡿⠙⣿⡆⣸⡿⣿⣶⠀⣾⣟⣹⣿⠀⠀
⠀⠀⠀⠀⠀⢀⣿⡟⢀⣿⡟⠀⣾⡟⣠⣿⡏⣰⣿⢁⣾⣿⢟⣿⣆⣾⡏⣰⣿⡇⠀⣁⣾⠇⠀⠀⢿⣷⡀⣀⣿⡿⢸⣿⠁⣰⣿⠑⣿⣿⣴⡿⢁⣿⡏⣼⣿⡛⠛⣡⣾⠃
⠀⠀⠀⠀⠀⠘⠛⠀⠘⠛⠁⠀⠙⠛⠛⠛⠛⠋⠛⠛⠛⠛⠿⠛⠛⠙⠛⠛⠙⠛⠛⠛⠁⠀⠀⠀⠈⠙⠛⠛⠋⠁⠈⠛⠛⠋⠛⠛⠛⠉⠁⠀⠀⠛⠛⠋⠛⠛⠛⠛

  "
  end

end
