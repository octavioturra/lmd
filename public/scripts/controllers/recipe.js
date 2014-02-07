doRemove = function(id){
    if(confirm('Deseja remover esta receita?')){
        doPost('/recipe/remove', {id: id});        
    }
};

angular.module('lmd').controller('RecipeCtrl', function($scope, $http){
    $scope.recipe = {
        ingredients:[],
        steps:[],
        author:{}
    };
});