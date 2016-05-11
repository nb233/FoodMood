package com.foodmood.controllers;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.foodmood.models.Mood;
import com.foodmood.models.Recipe;
import com.foodmood.models.Wine;
import com.foodmood.services.MoodService;
import com.foodmood.services.RecipeService;
import com.foodmood.services.WineService;

@Controller
@RequestMapping("/wine")
public class WineController {
	
	@Autowired
	private WineService wineService;
	@Autowired
	private RecipeService recipeService;
	@Autowired
	private MoodService moodService;
	
	
	@RequestMapping(value="/addWine", method=RequestMethod.POST)
	@ResponseBody
	public String addWine(HttpServletRequest request, HttpServletResponse response) {
		wineService.saveWine(request);
			
		return "Wine Added!";
	}
	
	@RequestMapping(value="/getWine", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView getWine(HttpServletRequest request, HttpServletResponse response) {
		Long recipeId = Long.parseLong(request.getParameter("recipeId"));
		Recipe recipe = recipeService.readRecipe(recipeId);
		Wine wine = wineService.getMatchingWine(recipe);
		String usersMood = request.getParameter("mood");
		ArrayList<Mood> allMoods = (ArrayList<Mood>) moodService.getAllMoods();
		ArrayList<String> grapesOfMood = new ArrayList<String>();
		for(Mood mood : allMoods){
			if(mood.getTheMood().equals(usersMood)){
				grapesOfMood = mood.getGrapesForMood();
			}
		}
		ArrayList<String> grapesOfWine = wine.getGrapes();
		String theGrapeToUse = null;
		for(String wineGrape : grapesOfWine){
			for(String moodGrape : grapesOfMood){
				if(wineGrape.equals(moodGrape)){
					theGrapeToUse = moodGrape;
				}
			}
		}
		
		String minPrice = request.getParameter("minPrice");
		String maxPrice = request.getParameter("maxPrice");
		
		System.out.println("MinPrice: " + minPrice );
		System.out.println("MaxPrice: " + maxPrice);
		
		
		return new ModelAndView();
	}

}
