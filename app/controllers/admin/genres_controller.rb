class Admin::GenresController < ApplicationController
    
     def new
         @genre = Genre.new
     end 

end
