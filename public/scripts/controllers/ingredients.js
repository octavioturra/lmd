angular.module('lmd').controller('IngredientsCtrl', function ($scope) {
    var Ingredient = function () {
        function Ingredient(){};
        
        var self = Ingredient.prototype;
        self.key = '';
        self.name = '';
        self.quantity = 0;
        self.unity = '';
        self.optional = false;
        self.switchList = [];
        return Ingredient;
    }();

    $scope.ingredient = new Ingredient;
    $scope.add = function () {
        var ingredient = $scope.ingredient;
        if (!ingredient.name) {

            return;
        }
        if (ingredient.quantity < 1) {

            return;
        }
        if (!ingredient.unity) {

            return;
        }   
        ingredient.key = _.uniqueId('i_');
        $scope.recipe.ingredients.push(ingredient);
        $scope.ingredient = new Ingredient;
    }
    $scope.remove = function(ingredient){
        $scope.recipe.ingredients = _.without($scope.recipe.ingredients, ingredient);
    }
});