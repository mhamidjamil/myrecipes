class PagesController < ApplicationController
    def home
        redirect_to recipes_path if logged_in?
      end
      
     def create
          @recipe = Recipe.new(recipe_params)
          @recipe.chef = current_chef
          if @recipe.save
            flash[:success] = "Recipe was created successfully!"
            redirect_to recipe_path(@recipe)
          else
            render 'new'
          end
        end
end