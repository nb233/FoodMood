<%@ include file="header.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-sm-12">

				
				<h1>${recipe.recipeName}</h1>

				<br>
				<% 
				Recipe recipe = (Recipe) request.getAttribute("recipe");
				ArrayList<String> recipeDescription = recipe.getRecipeDescription();
				List<Ingredient> recipeIngredients = recipe.getRecipeIngredients();
				List<RecipeComponent> recipeComponents = recipe.getRecipeComponents();
				
				
				%>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-3">
			<%
			for(int i = 0; i < recipeIngredients.size(); i++){	
			%>
				
					<%= recipeIngredients.get(i).getIngredientName() %>
					<%= recipeIngredients.get(i).getAmountPerPortion() %>
					<%= recipeIngredients.get(i).getUnitOfMeasurement() %>
					
				
				
			<%
			}
			%>
			</div>
			
			<div class="col-sm-9">
			<%
			for(int i = 0; i < recipeDescription.size(); i++){
			%>
				<h4><%= i+1 %></h4>
				<h5><%= recipeDescription.get(i) %></h5>
			<%} %>
			</div>
		</div>
			<%for (int i = 0; i < recipeComponents.size(); i++){
				List<Ingredient> recipeComponentIngredients = recipeComponents.get(i).getComponentIngredients();
				ArrayList<String> recipeComponentDescription = recipeComponents.get(i).getComponentDescription();
				%>
			<div class="row">
			<div class="col-sm-3">�
			<h3><%=recipeComponents.get(i).getComponentName() %></h3>
			<%
			for(int p = 0; p < recipeComponentIngredients.size(); p++){	
			%>
				
					<%= recipeComponentIngredients.get(p).getIngredientName() %>
					<%= recipeComponentIngredients.get(p).getAmountPerPortion() %>
					<%= recipeComponentIngredients.get(p).getUnitOfMeasurement() %>
					
				
				
			<%
			}
			%>
			</div>
			
			<div class="col-sm-9">
			<h4><%= recipeComponents.get(i).getComponentName() %></h4>
			<%
			for(int d = 0; d < recipeComponentDescription.size(); d++){
			%>
				<h4><%= d+1 %></h4>
				<h5><%= recipeComponentDescription.get(d) %></h5>
			<%} %>
			</div>
		</div>
		<%} %>
		<div class="row">
			<div class="col-sm-12">
				<form action="http://localhost:8080/wine/getWine" role="form"
				method="POST" id="wineform">
					<div class="form-group">
						<label for="winePrice">Vin pris:</label>
						<select class="form-control" id="winePrice" name="winePrice">
							<option value="0-99">under 100 kr</option>
							<option value="100-300">100 - 300 kr</option>
							<option value="301-500">301 - 500 kr</option>
							<option value="501-5000">�ver 500 kr</option>
						</select>
					</div>
					<div class="form-group">
						<label for="mood">Hum�r:</label>
						<select class="form-control" id="mood" name="mood">
							<option value="flirty">Fl�rtig</option>
							<option value="happy">Glad</option>
							<option value="party">Festlig</option>
							<option value="sad">Ledsen</option>
							<option value="angry">Arg</option>
						</select>
					</div>
					<div class="form-group">
						<input type="hidden" name="recipeId" id="recipeId" value="<%=recipe.getId()%>">
						<button type="submit" class="btn btn-default" id="btnsearchwine">s�k viner</button>
					</div>
					
				</form>
			</div>
		</div>
		
	</div>
<%@ include file="footer.jsp"%>