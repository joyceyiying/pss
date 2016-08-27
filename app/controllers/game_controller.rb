class GameController < ApplicationController
  def index
  	@input = params["pss"]
  	@computer = ["paper", "sissor", "stone"].sample
  	win_lose_cases = ["You Win","You Lose", "Even"]
  	@win_lose= ["You Win","You Lose", "Even"]
  	
  	#player plays paper
  	if @input == 'paper' && @computer == 'paper'
  	  	# @win_lose = "Even"
  	   @win_lose = win_lose_cases[2]
  	elsif @input == 'paper' && @computer == 'sissor'
  		# @win_lose = "You Lose"
  	   @win_lose = win_lose_cases[1]
  	
  	elsif @input == 'paper' && @computer == 'stone'
  		# @win_lose = "You Win"
  		@win_lose = win_lose_cases[0]
    
   
    #player plays sissor
    elsif @input == 'sissor' && @computer == 'paper'
  	  	# @win_lose = "You Win"
  		@win_lose = win_lose_cases[0]
  	elsif @input == 'sissor' && @computer == 'sissor'
  		# @win_lose = "Even"
  	  	@win_lose = win_lose_cases[2]
  	
  	elsif @input == 'sissor' && @computer == 'stone'
  		# @win_lose = "You Lose"
  		@win_lose = win_lose_cases[1]
  	
  	
  	#player plays stone
  	elsif @input == 'stone' && @computer == 'paper'
  	  	# @win_lose = "You Lose"
  		@win_lose = win_lose_cases[1]
  	elsif @input == 'stone' && @computer == 'sissor'
  		# @win_lose = "You Win"
  		@win_lose = win_lose_cases[0]
  	
  	elsif @input == 'stone' && @computer == 'stone'
  		# @win_lose = "Even"
  	  	@win_lose = win_lose_cases[2]
  	  end
	  p = Pss.new
	  p.computer = @computer
	  p.player = @input
	  p.win_lose = @win_lose
	  p.save
	  @psses = Pss.all
	  win = 0
	  lose = 0
	  even = 0
	  
	  
	  @psses.each do |pss|
	  	if pss.win_lose == win_lose_cases[1]
	  		lose += 1
	  	elsif pss.win_lose == win_lose_cases[0]
	  	    win += 1
	  	else 
	  		even += 1
	  	end
	  end
  	
	  if lose >= 2
	  	@final_score = "Such a Loser"
	  	@final_icon = "https://www.askideas.com/media/73/You-Loser-Picture.jpg"
	  elsif win >= 2
	  	 @final_score = "You Totally Win!!"
	  	 @final_icon = 'http://i1.wp.com/pmcdeadline2.files.wordpress.com/2016/01/leonardo-dicaprio-golden-globes.jpg?crop=0px%2C132px%2C2000px%2C1332px&resize=446%2C299&ssl=1'
	  elsif lose + win + even >= 3
	  	 @final_score = "One More Try"
	  	 @final_icon = 'http://www.freeiconspng.com/uploads/file-scales-even-icon-svg--wikipedia-the-free-encyclopedia-18.png'
	  end
	  
	  if @final_score
	  	Pss.destroy_all
	  end
	  
	  end
  end
  
