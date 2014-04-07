class Cell
  
  def input
    puts "Enter the x- size of the matrix(Please enter x_size >= 3)"
    
    @x = gets.chomp.to_i
    puts "Enter the y- size of the array(Please enter y_size >= 3)"
    @y = gets.chomp.to_i
    
    #A 2-D array
    @all_cells = Array.new(@x) { |i| Array.new(@y) { |i| 1 }}

    puts "Please enter 1 or 0 for the (0,0) element"

    @all_cells[0][0] = gets.chomp.to_i
    puts "Enter the number of generations you want to check"
    gen = gets.chomp.to_i
    for i in 1..gen
      puts "\n"
      gol
    end
  end

private
 def gol
  #Check the matrix for the live and dead cells
  for xi in 1..@x-2 do
    for yi in 1..@y-2 do
      s = 0
      count = 0
      #Checking the neighbours
  	  for c in yi-1..yi+1
  		  if @all_cells[xi-1][c] == 1
  			 count+=1
  		  end
        if @all_cells[xi+1][c] == 1
  			 count+=1
  		  end
        if s == 0
          if @all_cells[xi][yi-1] == 1
  					count+=1
  			  end
          if @all_cells[xi][yi+1] == 1 
  				  count+=1
  			  end
        end
        s+=1
  	  end
      #Applying the game of life rules
      if @all_cells[xi][yi] == 1	
  		  if count < 2 || count > 3
  			 @all_cells[xi][yi] = 0
   		  end
  	  elsif @all_cells[xi][yi] == 0
  		  if count == 3
  			 @all_cells[xi][yi] = 1
  		  end
  	  end
      end
    end
   alive
  end
 
  def alive 
    for xi in 1..@x-2 do
  	 for yi in 1..@y-2 do
  	 	 print "#{@all_cells[xi][yi]}"
     end
     puts "\n"
	  end
  end
end

cell = Cell.new
cell.input